using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;

namespace EOS.Officier.Controllers
{
    public class StaticController : Controller
    {
        //
        // GET: /Static/
        ESSMerkezDataContext m_merkezDc = new ESSMerkezDataContext(Globals.MerkezConnectionString);

        public ActionResult Index()
        {
            var finishedElections = m_merkezDc.VElectionDetails.Where(x=>x.StatusId==6 && x.StartDate <=DateTime.Now).ToList();
            ViewData["FinishedElections"] = finishedElections;

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(int TrackingCode,int ElectionId)
        {
            if (m_merkezDc.Votes.Any(x => x.ElectionId == ElectionId && x.TrackingCode == TrackingCode))
            {
                var vote = m_merkezDc.Votes.First(x => x.ElectionId == ElectionId && x.TrackingCode == TrackingCode);
                return View(vote);
            }
            return View();
        }

    }
}
