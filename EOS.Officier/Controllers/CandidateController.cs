using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;

namespace EOS.Officier.Controllers
{
    public class CandidateController : Controller
    {
        private EOSInternetDataContext m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Create()
        {
            ViewData["Elections"] = Globals.GetElections("NewElections");
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CandidateModel candidateModel)
        {
            try
            {
                ViewData["Elections"] = Globals.GetElections("NewElections");
                if (!string.IsNullOrEmpty(candidateModel.Citizen.IdentityNo) &&
              !string.IsNullOrEmpty(candidateModel.Citizen.Name))
                {
                    candidateModel.Candidate.CandidateId = candidateModel.Citizen.IdentityNo;
                    m_internetDc.Candidates.InsertOnSubmit(candidateModel.Candidate);
                    m_internetDc.SubmitChanges();
                    ViewData["Message"] = " Aday başarı ile kaydedildi!";
                }
                else
                {
                    if (m_internetDc.Voters.Any(x => x.IdentityNo == candidateModel.Citizen.IdentityNo))
                    {
                        ViewData["Election"] = Globals.GetElections("NewElections").First(x => x.ElectionId == candidateModel.Candidate.ElectionId).Name;
                        ViewData["Parties"] = Globals.GetParties();
                        ViewData["Regions"] = Globals.GetRegions();

                        if (m_internetDc.Candidates.Any(x => x.CandidateId == candidateModel.Citizen.IdentityNo && x.ElectionId==candidateModel.Candidate.ElectionId))
                        {
                            ViewData["Message"] = " Bir Kişi Yalnız Bir Partiden Aday Olabilir!";
                            return RedirectToAction("Edit", new { CandidateId = candidateModel.Citizen.IdentityNo });
                        }
                        if (m_internetDc.Parties.Any(x => x.Manager == candidateModel.Citizen.IdentityNo))
                        {
                            var party =
                                m_internetDc.Parties.First(x => x.Manager == candidateModel.Citizen.IdentityNo);
                            ViewData["PartyId"] = party.PartyId;
                        }

                        var citizen = m_internetDc.Voters.First(x => x.IdentityNo == candidateModel.Citizen.IdentityNo);
                        candidateModel.Citizen = citizen;
                        return View(candidateModel);
                    }
                    else
                    {
                        ViewData["Message"] = " Adayın Seçmen Kaydı Yaptırması Gerekir!";
                    }
                }
            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }

            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult List()
        {
            try
            {
                var model = m_internetDc.VCandidates.ToList();
                var images = new List<string>();
                foreach (var candidate in model)
                {
                    images.Add(string.Format("data:image/jpg;base64,{0}", Convert.ToBase64String(candidate.Image.ToArray())));
                }
                ViewData["Images"] = images;
                return View(model);
            }
            catch (Exception)
            {
                return View();
            }
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Edit(string CandidateId)
        {
            
            ViewData["Parties"] = Globals.GetParties();
            ViewData["Regions"] = Globals.GetRegions();
            var model = new CandidateModel();
            model.Candidate = m_internetDc.Candidates.First(x => x.CandidateId == CandidateId);
            ViewData["Election"] = Globals.GetElections("NewElections").First(x => x.ElectionId == model.Candidate.ElectionId).Name;
            model.Citizen = m_internetDc.Voters.First(x => x.IdentityNo == CandidateId);

            return View(model);
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(CandidateModel candidateModel)
        {
            try
            {
                ViewData["Elections"] = Globals.GetElections("StartedElections");
                ViewData["Parties"] = Globals.GetParties();
                ViewData["Regions"] = Globals.GetRegions();

                if (!string.IsNullOrEmpty(candidateModel.Citizen.IdentityNo) &&
              !string.IsNullOrEmpty(candidateModel.Citizen.Name))
                {
                    if (string.IsNullOrEmpty(candidateModel.Candidate.CandidateId))
                    {
                        candidateModel.Candidate.CandidateId = candidateModel.Citizen.IdentityNo;
                    }
                    var candidate =
                        m_internetDc.Candidates.First(x => x.CandidateId == candidateModel.Candidate.CandidateId);
                    candidate.PartyId = candidateModel.Candidate.PartyId;
                    candidate.OrderNo = candidateModel.Candidate.OrderNo;
                    candidate.RegionId = candidateModel.Candidate.RegionId;
                    m_internetDc.SubmitChanges();
                    ViewData["Message"] = " Aday bilgileri başarı ile güncellendi!";
                }
                else
                {
                    if (m_internetDc.Voters.Any(x => x.IdentityNo == candidateModel.Citizen.IdentityNo))
                    {
                        if (m_internetDc.Candidates.Any(x => x.CandidateId == candidateModel.Citizen.IdentityNo))
                        {
                            return View();
                        }
                        if (m_internetDc.Parties.Any(x => x.Manager == candidateModel.Citizen.IdentityNo))
                        {
                            var party =
                                m_internetDc.Parties.First(x => x.Manager == candidateModel.Citizen.IdentityNo);
                            ViewData["PartyId"] = party.PartyId;
                        }
                        var citizen = m_internetDc.Voters.First(x => x.IdentityNo == candidateModel.Citizen.IdentityNo);
                        candidateModel.Citizen = citizen;
                        ViewData["Message"] = " Bir Kişi Yalnız Bir Partiden Aday Olabilir!";
                        return View(candidateModel);
                    }
                    else
                    {
                        ViewData["Message"] = " Adayın Seçmen Kaydı Yaptırması Gerekir!";
                    }
                }
            }
            catch (Exception)
            {
                ViewData["Message"] = "Aday Düzenleme Başarısız!";
            }
            return View(candidateModel);
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Delete(string CandidateId)
        {
            try
            {
                if (m_internetDc.Candidates.Any(x => x.CandidateId == CandidateId))
                {
                    var candidate = m_internetDc.Candidates.First(x => x.CandidateId == CandidateId);
                    m_internetDc.Candidates.DeleteOnSubmit(candidate);
                    m_internetDc.SubmitChanges();
                    ViewData["Message"] = "Aday Başarı ile Silinmiştir!";
                }
            }
            catch (Exception)
            {
                ViewData["Message"] = "Aday Silme İşlemi Başarısız!";
            }

            return RedirectToAction("List");
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public JsonResult Orders(int electionId, int partyId, int regionId)
        {
            m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
            string result = "";
            ESSMerkezDataContext merkezDc = new ESSMerkezDataContext(Globals.MerkezConnectionString);
            if (partyId != 0 && electionId != 0 && regionId != 0)
            {
                if (m_internetDc.Parties.Any(p => p.PartyId == partyId)
                    && merkezDc.Elections.Any(e => e.ElectionId == electionId)
                    && merkezDc.Regions.Any(r => r.RegionId == regionId)
                    )
                {
                    int count = merkezDc.Regions.First(r => r.RegionId == regionId).CandidateCount.Value;
                    var candidates = m_internetDc.Candidates.Where(c => c.PartyId == partyId && c.RegionId == regionId && c.ElectionId == electionId).ToList();
                    List<int> exist = new List<int>();
                    List<int> usable = new List<int>();
                    foreach (var candidate in candidates)
                    {
                        exist.Add(candidate.OrderNo.Value);
                    }

                    for (int i = 1; i <= count; i++)
                    {
                        if (!exist.Contains(i))
                        {
                            usable.Add(i);
                            result += "<option value='" + i + "'>" + i + " . Sıra</option>\n";
                        }
                    }
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
