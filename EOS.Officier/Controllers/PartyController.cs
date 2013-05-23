using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace EOS.Officier.Controllers
{
    [Serializable]
    public class Serializer 
    {
          public string name;
          public float[] fltArray;

          public Serializer(string theName) 
          {
              this.name=theName;
              float[] theArray= new float[1000];
              Random rnd = new System.Random();
              for(int i =0;i<1000;i++)
              theArray[i]=(float)rnd.NextDouble() *1000;
              fltArray=theArray;
          }
    } 

    public class PartyController : Controller
    {
        private Models.EOSInternetDataContext m_internetDc = new Models.EOSInternetDataContext(Globals.InternetConnectionString);
        private Models.ESSMerkezDataContext m_merkezDC = new Models.ESSMerkezDataContext(Globals.MerkezConnectionString);

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Create()
        {
            ViewData["Wizard"] = "Party";
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PartyModel partyModel)
        {
            try
            {
                if (partyModel.Party != null && partyModel.Manager.IdentityNo == null)
                {
                    partyModel.Party.CreatedAt = DateTime.Now;
                    //
                    //TODO
                    //
                    if (m_internetDc.Parties.Any(k => k.PartyName == partyModel.Party.PartyName ||
                                                      k.PartyAcr == partyModel.Party.PartyAcr))
                    {
                        ViewData["Wizard"] = "Party";
                        ViewData["Message"] = "Bu isim ya da kısaltmada parti mevcut!Yeniden Deneyiniz";
                    }
                    else
                    {   
                        var file = Request.Files["ImageUrl"];
                        var filePath = Server.MapPath("~/Images/" + partyModel.Party.PartyAcr + ".png");
                        file.SaveAs(filePath);

                        FileStream FS = new FileStream(filePath, FileMode.Open, FileAccess.Read); //create a file stream object associate to user selected file 
                        byte[] img = new byte[FS.Length]; //create a byte array with size of user select file stream length
                        FS.Read(img, 0, Convert.ToInt32(FS.Length));//read user selected file stream in to byte array
                        FS.Seek(0, 0);
                        partyModel.Party.Image = img;


                        partyModel.Party.ImageUrl = partyModel.Party.PartyAcr+".png";
                        partyModel.Party.CreatedBy = User.Identity.Name;
                        m_internetDc.Parties.InsertOnSubmit(partyModel.Party);
                        ViewData["PartyImage"] = string.Format("data:image/jpg;base64,{0}", Convert.ToBase64String(partyModel.Party.Image.ToArray()));

                        m_internetDc.SubmitChanges();
                        ViewData["Message"] = " Parti başarı ile kaydedildi!";
                        ViewData["Wizard"] = "Manager";
                    }
                    return View(partyModel);
                }
                else if (partyModel.Party != null &&
                         !string.IsNullOrEmpty(partyModel.Manager.IdentityNo) &&
                         string.IsNullOrEmpty(partyModel.Manager.Name) &&
                         string.IsNullOrEmpty(partyModel.Manager.Surname))
                {

                    if (!m_internetDc.Voters.Any(j => j.IdentityNo == partyModel.Manager.IdentityNo))
                    {

                        ViewData["Wizard"] = "Manager";
                        ViewData["Message"] = "Geçersiz Kimlik Bilgisi. Yöneticinin Seçmen Kaydı Yapılmalıdır!";

                    }
                    else if (m_internetDc.Parties.Any(j => j.Manager == partyModel.Manager.IdentityNo))
                    {

                        ViewData["Wizard"] = "Manager";
                        ViewData["Message"] = "Bir Partinin Yöneticisi Başka Bir Partinin Yönetimini Üstlenemez.";

                    }
                    else
                    {
                        var citizen = m_internetDc.Citizens.First(x => x.IdentityNo == partyModel.Manager.IdentityNo);
                        partyModel.Manager = citizen;
                    }

                    return View(partyModel);
                }
                else if (partyModel.Party != null && partyModel.Manager != null)
                {
                    var party = m_internetDc.Parties.First(x => x.PartyId == partyModel.Party.PartyId);
                        
                    party.Manager = partyModel.Manager.IdentityNo;
                    m_internetDc.SubmitChanges();
                    ViewData["Message"] = " Parti Başkanı Başarı ile Atandı!";
                    ViewData["Wizard"] = "Party";
                    return View();
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
            var model = new List<PartyModel>();
            try
            {
                var parties = m_internetDc.Parties.ToList();
                var partyImages = new List<string>();
                int i=0;
                foreach (var item in parties)
                {
                    var partyModel = new PartyModel();
                    partyImages.Add(string.Format("data:image/jpg;base64,{0}", Convert.ToBase64String(item.Image.ToArray()))) ;
                    i++;
                    if (!string.IsNullOrEmpty(item.Manager))
                    {
                        var citizen = m_internetDc.Citizens.First(x => x.IdentityNo == item.Manager);
                        partyModel.Manager = citizen;
                    }
                    partyModel.Party = item;
                    model.Add(partyModel);
                }
                ViewData["PartyImages"] = partyImages;
            }
            catch (Exception)
            { }

            return View(model);
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Edit(int PartyId)
        {
            try
            {
                
                var partyModel = new PartyModel();
                var party = m_internetDc.Parties.First(x => x.PartyId == PartyId);
                partyModel.Party = party;
                ViewData["PartyImage"] = string.Format("data:image/jpg;base64,{0}", Convert.ToBase64String(partyModel.Party.Image.ToArray()));
                TempData["Image"] = ViewData["PartyImage"];
                if (!string.IsNullOrEmpty(party.Manager))
                {
                    if (m_internetDc.Citizens.Any(x => x.IdentityNo == party.Manager))
                    {
                        var citizen = m_internetDc.Citizens.First(x => x.IdentityNo == party.Manager);
                        partyModel.Manager = citizen;
                    }
                }
                else
                {
                    partyModel.Manager = null;
                }
                
                return View(partyModel);
            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(PartyModel partyModel)
        {
            try
            {
                if (!string.IsNullOrEmpty(partyModel.SearchIdentity))
                {

                    ViewData["PartyImage"] = TempData["Image"];

                    if (m_internetDc.Citizens.Any(x => x.IdentityNo == partyModel.SearchIdentity) && !m_internetDc.Parties.Any(x => x.Manager == partyModel.SearchIdentity))
                    {
                        var citizen = m_internetDc.Citizens.First(x => x.IdentityNo == partyModel.SearchIdentity);
                        partyModel.Manager = citizen;
                        partyModel.SearchIdentity = string.Empty;
                    }

                    else
                    {
                        ViewData["Message"] = "Aradığınız Yönetici Bulunamadı veya Başka Bir Partinin Yöneticisi!";
                    }

                    return View(partyModel);
                }
                else
                {
                    var party = m_internetDc.Parties.First(x => x.PartyId == partyModel.Party.PartyId);
                    party.Manager = partyModel.Manager.IdentityNo;
                    party.PartyName = partyModel.Party.PartyName;
                    party.PartyAcr = partyModel.Party.PartyAcr;
                    party.ImageUrl = partyModel.Party.ImageUrl;
                    partyModel.Party = party;
                    m_internetDc.SubmitChanges();
                    ViewData["PartyImage"] = string.Format("data:image/jpg;base64,{0}", Convert.ToBase64String(partyModel.Party.Image.ToArray()));
                    ViewData["Message"] = " Parti başarı ile Güncellendi!";
                    return View(partyModel);
                }

            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        public ActionResult Delete(int PartyId)
        {
            try
            {
                var party = m_internetDc.Parties.First(x => x.PartyId == PartyId);
                m_internetDc.Parties.DeleteOnSubmit(party);
                var candidates = m_internetDc.Candidates.Where(x => x.PartyId == PartyId).ToList();
                if (candidates.Count > 0)
                {
                    foreach (var candidate in candidates)
                    {
                        m_internetDc.Candidates.DeleteOnSubmit(candidate);
                    }
                }
                m_internetDc.SubmitChanges();
                ViewData["Message"] = "Parti Başarıyla Silinmiştir!";
            }
            catch (Exception)
            {
                ViewData["Message"] = "Parti Silme İşlemi Başarısız!";
            }
            return RedirectToAction("List");
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Delete(PartyModel partyModel)
        {
            try
            {
                if (partyModel.Party != null)
                {
                    var party = m_internetDc.Parties.First(x => x.PartyId == partyModel.Party.PartyId);
                    m_internetDc.Parties.DeleteOnSubmit(party);
                    m_internetDc.SubmitChanges();
                    ViewData["Message"] = "Parti başarı ile silindi!";
                }
            }
            catch (Exception)
            {
            }
            return View();
        }




    }
}
