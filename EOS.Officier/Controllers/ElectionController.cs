using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;

namespace EOS.Officier.Controllers
{
    public class ElectionController : Controller
    {
        private EOSInternetDataContext m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
        private ESSMerkezDataContext m_merkezDC = new ESSMerkezDataContext(Globals.MerkezConnectionString);
        //
        // GET: /Election/

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult Create()
        {
            ViewData["ElectionTypes"] = Globals.GetElectionTypes();

            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Election Model)
        {
            ViewData["ElectionTypes"] = Globals.GetElectionTypes();
            if (Model != null)
            {
                if (!string.IsNullOrEmpty(Model.Name))
                {
                    if (!m_merkezDC.Elections.Any(x => x.Name == Model.Name))
                    {
                        Model.CreatedAt = DateTime.Now;
                        Model.CreatedBy = User.Identity.Name;
                        m_merkezDC.Elections.InsertOnSubmit(Model);
                        m_merkezDC.SubmitChanges();
                        for (int i = 1; i < 5; i++)
                        {
                            var process = new ElectionDetail();
                            process.StartDate = Convert.ToDateTime(Request.Form["StartDate"]);
                            process.FinishDate = Convert.ToDateTime(Request.Form["FinishDate"]);
                            process.ElectionId = Model.ElectionId;
                            process.StatusId = i;
                            process.StartedBy = User.Identity.Name;
                            process.FinishedBy = User.Identity.Name;
                            process.ActionDate = DateTime.Now;
                            m_merkezDC.ElectionDetails.InsertOnSubmit(process);
                        }
                        m_merkezDC.SubmitChanges();
                        ViewData["Message"] = "Seçim Başarıyla Eklendi Süreçlerinin Yönetmek İçin Lütfen Aşağıdaki Ekranı Kullanınız.";
                        return RedirectToAction("ManageElectionProcess", new { Model.ElectionId });
                    }
                    else
                    {
                        ViewData["Message"] = "Aynı İsimle Yalnızca Bir Adet Seçim Eklenebilir.";
                    }
                }
            }
            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult ManageElectionProcess(int ElectionId = 0)
        {
            if (ElectionId != 0)
            {
                try
                {
                    var model = new ElectionDetail();
                    model.ElectionId = ElectionId;
                    var electionDetials = m_merkezDC.VElectionDetails.Where(x => x.ElectionId == ElectionId).ToList();
                    ViewData["ElectionDetails"] = electionDetials;
                    ViewData["ElectionStatus"] = Globals.GetElectionStatusById(ElectionId);
                    ViewData["MinDate"] = electionDetials.Last().FinishDate.Value.ToString("yyyy-MM-dd HH:mm");
                    return View(model);
                }
                catch (Exception)
                {
                }

            }
            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ManageElectionProcess(ElectionDetail Model)
        {
            if (Model != null)
            {
                ViewData["ElectionStatus"] = Globals.GetElectionStatusById(Model.ElectionId.Value);
                Model.ActionDate = DateTime.Now;
                Model.FinishedBy = User.Identity.Name;
                Model.StartedBy = User.Identity.Name;

                m_merkezDC.ElectionDetails.InsertOnSubmit(Model);
                m_merkezDC.SubmitChanges();
                var electionDetials = m_merkezDC.VElectionDetails.Where(x => x.ElectionId == Model.ElectionId).ToList();
                ViewData["ElectionDetails"] = electionDetials;
                ViewData["MinDate"] = electionDetials[5].FinishDate.Value.ToString("yyyy-MM-dd HH:mm");

            }
            return View(Model);
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult List()
        {
            var elections = m_merkezDC.VElectionDetails.Where(x => x.StatusId == 1).ToList();
            return View(elections);
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult Show(int ElectionId = 0)
        {
            var result = new List<VGenelVote>();
            if (ElectionId != 0)
            {
                if (m_merkezDC.VGenelVotes.Any(x => x.ElectionId == ElectionId))
                {
                    result = m_merkezDC.VGenelVotes.Where(x => x.ElectionId == ElectionId).ToList();
                }
                ViewData["ElectionId"] = ElectionId;
                ViewData["ElectionName"] = m_merkezDC.Elections.First(x => x.ElectionId == ElectionId).Name;
            };
            ViewData["result"] = result;
            return View();
        }
        [Authorize(Roles = "SistemYoneticisi")]
        public JsonResult GetCityResult(int ElectionId = 0, int CityId = 0)
        {
            var result = new List<VIlVote>();
            var regions = new List<Region>();
            if (ElectionId != 0 && CityId != 0)
            {
                if (m_merkezDC.VIlVotes.Any(x => x.ElectionId == ElectionId && x.CityId == CityId.ToString()))
                {
                    result = m_merkezDC.VIlVotes.Where(x => x.ElectionId == ElectionId && x.CityId == CityId.ToString()).ToList();
                }
                if (m_merkezDC.Regions.Any(x => x.CityId.Value == CityId))
                {
                    regions = m_merkezDC.Regions.Where(x => x.CityId.Value == CityId).ToList();
                }
            }
            var data = new { Votes = result, Regions = regions };
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [Authorize(Roles = "SistemYoneticisi")]
        public JsonResult GetRegionResult(int ElectionId = 0, int RegionId = 0)
        {
            var result = new List<VRegionVote>();
            var districts = new List<District>();
            if (ElectionId != 0 && RegionId != 0)
            {
                if (m_merkezDC.VRegionVotes.Any(x => x.ElectionId == ElectionId && x.RegionId.Value == RegionId))
                {
                    result = m_merkezDC.VRegionVotes.Where(x => x.ElectionId == ElectionId && x.RegionId.Value == RegionId).ToList();
                }
                var details = m_merkezDC.RegionDetails.Where(x => x.RegionId.Value == RegionId).ToList();
                foreach (var detail in details)
                {
                    if (m_merkezDC.Districts.Any(d => d.DistrictId == detail.DistrictId))
                    {
                        districts.Add(m_merkezDC.Districts.First(d => d.DistrictId == detail.DistrictId));
                    }
                }

            }
            var data = new { Votes = result, Districts = districts };
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [Authorize(Roles = "SistemYoneticisi")]
        public JsonResult GetDistrictResult(int ElectionId = 0, int DistrictId = 0)
        {
            var result = new List<VVote>();
            if (ElectionId != 0 && DistrictId != 0)
            {
                if (m_merkezDC.VVotes.Any(x => x.ElectionId == ElectionId && x.DistrictId.Value == DistrictId))
                {
                    result = m_merkezDC.VVotes.Where(x => x.ElectionId == ElectionId && x.DistrictId.Value == DistrictId).ToList();
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

    }
}
