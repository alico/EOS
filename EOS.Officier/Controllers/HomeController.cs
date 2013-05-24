using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EOS.Officier.Controllers
{
    public class HomeController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            if (User.IsInRole("YSKMemuru") || User.IsInRole("YetkiliYSKMemuru"))
            {
                return RedirectToAction("List", "Voter");
            }
            else if (User.IsInRole("SistemYoneticisi"))
            {
                return RedirectToAction("List", "Election");
            }
            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            return View();
        }
    }
}
