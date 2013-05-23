using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;

namespace EOS.Officier.Controllers
{
    public class RegionController : Controller
    {
        private Models.EOSInternetDataContext m_internetDc = new Models.EOSInternetDataContext(Globals.InternetConnectionString);
        private Models.ESSMerkezDataContext m_merkezDC = new Models.ESSMerkezDataContext(Globals.MerkezConnectionString);

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult Create()
        {
            ViewData["Cities"]=Globals.GetCities();

            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RegionModel model)
        {
            var cityId = Request.Form["CityId"];
            if (!string.IsNullOrEmpty(cityId))
            {
                model = new RegionModel();
                model.Region.CityId = Convert.ToInt32(cityId);
                model.Districts = m_merkezDC.Districts.Where(x => x.CityId == cityId &&
                                                                x.DistrictStatus==true).ToList();
            }

            if (model.SelectedDistricts.Count > 0)
            {
                var region = model.Region;
                m_merkezDC.Regions.InsertOnSubmit(region);
                m_merkezDC.SubmitChanges();

                foreach (var district_id in model.SelectedDistricts)
                {
                    var region_detail = new RegionDetail();
                    region_detail.DistrictId = district_id;
                    region_detail.RegionId = region.RegionId;
                    region_detail.RegionStatus = true;
                    m_merkezDC.RegionDetails.InsertOnSubmit(region_detail);

                    var old_district = m_merkezDC.Districts.First(f => f.DistrictId == district_id);
                    old_district.DistrictStatus = false;
                    m_merkezDC.SubmitChanges();
                }
                ViewData["Message"] = "Seçim Bölgesi Başarıyla Oluşturuldu.";
                return RedirectToAction("List");
            }

            return View(model);
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult List()
        {
            ViewData["Cities"] = Globals.GetCities();
            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult List(List<VRegion> model)
        {
            if (model == null)
            {
                var cityId = Request.Form["CityId"];
                model= m_merkezDC.VRegions.Where(x => x.CityId == cityId).ToList();
                return View(model);
            }
            return View();
        }

        [Authorize(Roles = "SistemYoneticisi")]
        public ActionResult Edit(int RegionId)
        {
            var model = new RegionModel();

            model.Region = m_merkezDC.Regions.First(x=>x.RegionId==RegionId);
            model.Districts = m_merkezDC.Districts.Where(x => x.CityId == model.Region.CityId.Value.ToString()
                                                        && x.DistrictStatus==true).ToList();
            model.SelectedDistricts = m_merkezDC.RegionDetails.Where(x => x.RegionId == RegionId).Select(x=>x.DistrictId.Value).ToList();

            var selectedDistricts = new List<District>();
            foreach (var districtId in model.SelectedDistricts)
            {
                var district = Globals.GetDistricts().Where(x => x.DistrictId == districtId).First();
                selectedDistricts.Add(district);
            }
            ViewData["SelectedDistricts"] = selectedDistricts;
            return View(model);
        }

        [Authorize(Roles = "SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(RegionModel model)
        {
            var region = m_merkezDC.Regions.First(f => f.RegionId == model.Region.RegionId);
            region.Region1 = model.Region.Region1;
            region.CandidateCount = model.Region.CandidateCount;

            var regionDetails = m_merkezDC.RegionDetails.Where(r => r.RegionId == model.Region.RegionId).ToList();
            m_merkezDC.RegionDetails.DeleteAllOnSubmit(regionDetails);
            foreach (var districtId in model.SelectedDistricts)
            {
                var regionDetail = new RegionDetail();
                regionDetail.RegionId = model.Region.RegionId;
                regionDetail.DistrictId = districtId;
                regionDetail.RegionStatus = true;
                m_merkezDC.RegionDetails.InsertOnSubmit(regionDetail);
            }
            m_merkezDC.SubmitChanges();
            return RedirectToAction("List");
        }
    }
}
