using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;
using System.ServiceModel;
using EOS.Officier.NufusMudurluguService;

namespace EOS.Officier.Controllers
{
    public class VoterController : Controller
    {
        private Models.EOSInternetDataContext m_internetDc = new Models.EOSInternetDataContext(Globals.InternetConnectionString);
        private Models.ESSMerkezDataContext m_merkezDC = new Models.ESSMerkezDataContext(Globals.MerkezConnectionString);

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Create()
        {
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Voter voter)
        {
            try
            {
                if (!string.IsNullOrEmpty(voter.IdentityNo) &&
                    !string.IsNullOrEmpty(voter.Name) &&
                    !string.IsNullOrEmpty(voter.Surname) &&
                    !string.IsNullOrEmpty(voter.BirthPlace) &&
                    voter.BirthDate != null &&
                    !string.IsNullOrEmpty(voter.City) &&
                    !string.IsNullOrEmpty(voter.District)
                    )
                {
                    if (voter.Handicapped == null)
                    {
                        voter.Handicapped = false;
                    }
                    voter.CreatedAt = DateTime.Now;
                    voter.CreatedBy = User.Identity.Name;
                    voter.CreatedFrom = 1;
                    voter.VoterStatus = true;
                    //
                    //TODO
                    //voter.CreatedBy
                    //voter.CreatedFrom
                    m_internetDc.Voters.InsertOnSubmit(voter);
                    m_internetDc.SubmitChanges();
                    ViewData["Message"] = " Seçmen başarı ile kaydedildi!";
                    return View();
                }
                else
                {
                    if (m_internetDc.Voters.Any(x => x.IdentityNo == voter.IdentityNo))
                    {
                        TempData["Message"] = " Bu Aday Zaten Sistemde Kayıtlıdır, Güncellemek için Aşağıdaki Ekranı Kullanın!";
                        return RedirectToAction("Edit", "Voter", new { voter.IdentityNo });
                    }
                    else
                    {
                        var myBinding = new BasicHttpBinding();
                        var myEndpoint = new EndpointAddress("http://192.168.1.222:9999/TCNufusMudurlugu/GetData");
                        var myChannelFactory = new ChannelFactory<IService1>(myBinding, myEndpoint);

                        NufusMudurluguService.IService1 client = null;

                        try
                        {
                            client = myChannelFactory.CreateChannel();
                            EOS.Officier.NufusMudurluguService.Citizen citizen = client.GetData(voter.IdentityNo);
                            ((ICommunicationObject)client).Close();

                            ViewData["Regions"] = m_merkezDC.Regions.ToList();
                            var model = new Models.Voter();

                            var district = m_merkezDC.Districts.First(x => x.DistrictName.Contains(citizen.District));
                            if (district != null)
                            {
                                if (m_merkezDC.RegionDetails.Any(x => x.DistrictId == district.DistrictId))
                                {
                                    var region = m_merkezDC.RegionDetails.First(x => x.DistrictId == district.DistrictId);
                                    model.RegionId = region.RegionId;

                                }
                            }
                            model.IdentityNo = citizen.IdentityNo;
                            model.Name = citizen.Name;
                            model.Surname = citizen.Surname;
                            model.MotherName = citizen.MotherName;
                            model.FatherName = citizen.FatherName;
                            model.Telephone = citizen.Telephone;
                            model.BirthDate = citizen.BirthDate;
                            model.BirthPlace = citizen.BirthPlace;
                            model.Address = citizen.Address;
                            model.City = citizen.City;
                            model.District = citizen.District;
                            model.Handicapped = false;
                            voter.VoterStatus = true;

                            return View(model);
                        }
                        catch
                        {
                            if (client != null)
                            {
                                ((ICommunicationObject)client).Abort();
                            }
                            ViewData["Message"] = "Geçersiz kimlik numarası girildi!";
                            return View();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
                return View();
            }
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult List()
        {
            var model = m_internetDc.Voters.ToList();
            return View(model);
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Edit(string IdentityNo)
        {
            try
            {
                if (TempData["Message"] != null)
                {
                    ViewData["Message"] = TempData["Message"];
                }
                ViewData["Regions"] = m_merkezDC.Regions.ToList();
                var model = m_internetDc.Voters.Where(x => x.IdentityNo == IdentityNo).First();
                return View(model);
            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }

            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(Voter voter)
        {
            try
            {
                ViewData["Regions"] = m_merkezDC.Regions.ToList();
                var model = m_internetDc.Voters.Where(x => x.IdentityNo == voter.IdentityNo).First();
                model.Address = voter.Address;
                model.Handicapped = voter.Handicapped == null ? false : voter.Handicapped;
                model.VoterStatus = voter.VoterStatus == null ? false : voter.VoterStatus;
                model.RegionId = voter.RegionId;
                m_internetDc.SubmitChanges();
                ViewData["Message"] = " Seçmen Bilgilieri Başarıyla Güncellendi!";
                return View(model);
            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }
            return View();
        }

    }
}
