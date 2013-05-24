using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;
using EOS.Officier.NufusMudurluguService;
using System.ServiceModel;

namespace EOS.Officier.Controllers
{
    public class StatisticsController : Controller
    {
        private EOSInternetDataContext m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
        private ESSMerkezDataContext m_merkezDC = new ESSMerkezDataContext(Globals.MerkezConnectionString);

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru,SistemYoneticisi")]
        public ActionResult Unvotingvoters()
        {
            ViewData["Elections"] = Globals.GetElections("FinishedElections");
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru,SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Unvotingvoters(Voter model)
        {
            var ElectionId = Request.Form["ElectionId"];
            List<Voter> voters = new List<Voter>();
            foreach (var voter in m_internetDc.Voters.ToList())
            {
                if (!m_internetDc.VoteDetails.Any(h => h.ElectionId == Convert.ToInt32(ElectionId) && h.IdentityNo == voter.IdentityNo))
                {
                    voters.Add(voter);
                }
            }
            ViewData["UnvotingVoters"] = voters;
            return View();

        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru,SistemYoneticisi")]
        public ActionResult Unrecordingvoters()
        {
            var unrecordingCitizens = new List<NufusMudurluguService.Citizen>();
            var myBinding = new BasicHttpBinding();
            var myEndpoint = new EndpointAddress("http://192.168.1.222:9999/TCNufusMudurlugu/GetCitizens");
            var myChannelFactory = new ChannelFactory<IService1>(myBinding, myEndpoint);

            NufusMudurluguService.IService1 client = null;
            try
            {
                client = myChannelFactory.CreateChannel();
                var citizens = client.GetCitizens();
                foreach (var citizen in citizens)
                {
                    if (!m_internetDc.Voters.Any(f => f.IdentityNo == citizen.IdentityNo))
                    {
                        unrecordingCitizens.Add(citizen);
                    }
                }
                ViewData["Unrecording"] = unrecordingCitizens;
            }
            catch (Exception exp)
            {
            }
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru,SistemYoneticisi")]
        public ActionResult Votedetails()
        {
            return View();
        }

        [Authorize(Roles = "YSKMemuru,YetkiliYSKMemuru,SistemYoneticisi")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Votedetails(VoteDetail model)
        {
            var IdentityNo = Request.Form["IdentityNo"];
            List<VoteModel> votes = null;
            try
            {
                if (m_internetDc.VoteDetails.Any(h => h.IdentityNo == IdentityNo.ToString()))
                {
                    votes = new List<VoteModel>();
                    foreach (var vote in m_internetDc.VoteDetails.Where(h => h.IdentityNo == IdentityNo.ToString()).ToList())
                    {
                        votes.Add(new VoteModel(vote));
                    }
                }
                ViewData["Votes"] = votes;
            }
            catch(Exception exp)
            {}
            ViewData["Message"] = "Seçmene ait oy kaydı bulunmuyor...";
            return View();
        }

    }
}
