using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EOS.Officier.Models;
using System.Web.Security;

namespace EOS.Officier.Controllers
{
    public class UserController : Controller
    {
        private EOSInternetDataContext m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
        private ESSMerkezDataContext m_merkezDC = new ESSMerkezDataContext(Globals.MerkezConnectionString);

        [Authorize(Roles = "YetkiliYSKMemuru")]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "YetkiliYSKMemuru")]
        public ActionResult Create()
        {
            return View();
        }

        [Authorize(Roles = "YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(VUser userModel)
        {
            try
            {
                if (m_merkezDC.Users.Any(x => x.IdentityNo == userModel.IdentityNo))
                {
                    TempData["Message"] = " Bu Aday Zaten Sistemde Kayıtlıdır, Güncellemek için Aşağıdaki Ekranı Kullanın!";
                    return RedirectToAction("Edit", "User", new { userModel.IdentityNo });
                }
                if (!string.IsNullOrEmpty(userModel.IdentityNo) &&
              !string.IsNullOrEmpty(userModel.Name) &&
                    userModel.UserTypeId != 0 &&
                    userModel.DepartmentId != 0)
                {
                    var user = new User();
                    user.IdentityNo = userModel.IdentityNo;
                    user.UserName = userModel.IdentityNo;
                    user.UserPassword = userModel.IdentityNo;
                    user.UserTypeId = userModel.UserTypeId;

                    user.DepartmentId = userModel.DepartmentId;
                    user.CreatedAt = DateTime.Now;
                    user.CreatedBy = User.Identity.Name;
                    user.UserStatus = true;
                    user.UpdatedAt = DateTime.Now;
                    user.UpdatedBy = User.Identity.Name;

                    MembershipCreateStatus createStatus;
                    Membership.CreateUser(user.IdentityNo, user.IdentityNo, user.IdentityNo, null, null, true, null, out createStatus);

                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        var aspUser = m_merkezDC.aspnet_Users.First(x => x.UserName == user.IdentityNo);
                        var roleType = string.Empty;
                        if (userModel.UserTypeId.Value == 1)
                        {
                            roleType = "YSKMemuru";
                        }
                        else if (userModel.UserTypeId.Value == 2)
                        {
                            roleType = "YetkiliYSKMemuru";
                        }
                        var role = m_merkezDC.aspnet_Roles.First(x => x.RoleName == roleType);
                        var userInRoles = new aspnet_UsersInRole();
                        userInRoles.RoleId = role.RoleId;
                        userInRoles.UserId = aspUser.UserId;

                        m_merkezDC.aspnet_UsersInRoles.InsertOnSubmit(userInRoles);
                        m_merkezDC.Users.InsertOnSubmit(user);
                        m_merkezDC.SubmitChanges();
                        ViewData["Message"] = " Kullanıcı başarı ile kaydedildi!";
                    }
                    else
                    {
                        ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
                    }
                }
                else
                {
                    if (m_internetDc.Citizens.Any(x => x.IdentityNo == userModel.IdentityNo))
                    {
                        ViewData["UserTypes"] = Globals.GetUserTypes();
                        ViewData["Departments"] = Globals.GetDepartments();


                        if (m_merkezDC.Users.Any(x => x.IdentityNo == userModel.IdentityNo))
                        {
                            userModel = m_merkezDC.VUsers.First(x => x.IdentityNo == userModel.IdentityNo);
                            ViewData["Message"] = " Bu Kullanıcının Kaydı Bulunmaktadır!";
                            return View(userModel);
                        }
                        else if (m_merkezDC.VUsers.Any(x => x.IdentityNo == userModel.IdentityNo))
                        {
                            userModel =
                                m_merkezDC.VUsers.First(x => x.IdentityNo == userModel.IdentityNo);
                        }
                        return View(userModel);
                    }
                    else
                    {
                        ViewData["Message"] = " Kullanıcının Nüfus Kaydı Yaptırması Gerekir!";
                    }
                }
            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }

            return View();
        }

        [Authorize(Roles = "YetkiliYSKMemuru")]
        public ActionResult List()
        {
            var users = m_merkezDC.Users.Where(x=>x.UserStatus.Value).ToList();
            var model = new List<VUser>();
            foreach (var user in users)
            {
                var modelItem = m_merkezDC.VUsers.First(x => x.IdentityNo == user.IdentityNo);
                model.Add(modelItem);
            }
            return View(model);
        }

        [Authorize(Roles = "YetkiliYSKMemuru")]
        public ActionResult Edit(string IdentityNo)
        {
            var model = new VUser();
            if (TempData["Message"] != null)
            {
                ViewData["Message"] = TempData["Message"];
            }
            if (m_merkezDC.Users.Any(x => x.IdentityNo == IdentityNo && x.UserStatus.Value))
            {
                ViewData["UserTypes"] = Globals.GetUserTypes();
                ViewData["Departments"] = Globals.GetDepartments();
                model = m_merkezDC.VUsers.First(x => x.IdentityNo == IdentityNo);
                return View(model);
            }
            else
            {
                ViewData["Message"] = "Bu kullanıcıya erişilemez!";
            }

            return View();
        }

        [Authorize(Roles = "YetkiliYSKMemuru")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(VUser userModel)
        {
            try
            {
                ViewData["UserTypes"] = Globals.GetUserTypes();
                ViewData["Departments"] = Globals.GetDepartments();
                if (m_merkezDC.Users.Any(x => x.IdentityNo == userModel.IdentityNo))
                {
                    var user = new User();
                    user = m_merkezDC.Users.First(x => x.IdentityNo == userModel.IdentityNo);
                    user.DepartmentId = userModel.DepartmentId;
                    user.UpdatedAt = DateTime.Now;
                    user.UserTypeId = userModel.UserTypeId;

                    if (Request.Form["ChangePassword"] == "True")
                    {
                        bool changePasswordSucceeded;
                        //var aspUser = m_merkezDC.mem.First(x => x.UserName == userModel.IdentityNo);
                        
                        MembershipUser currentUser = Membership.GetUser(user.IdentityNo, false /* userIsOnline */);
                        changePasswordSucceeded = currentUser.ChangePassword(user.UserPassword, userModel.IdentityNo);
                        user.UserPassword = user.IdentityNo;
                    }
                    if (Request.Form["UserStatus"] != "True")
                    {
                        MembershipUser currentUser = Membership.GetUser(user.IdentityNo, false /* userIsOnline */);
                        Membership.DeleteUser(currentUser.UserName);
                    }
                    user.UserStatus = userModel.UserStatus == null ? false : true;
                    m_merkezDC.SubmitChanges();
                    ViewData["Message"] = " Kullanıcı bilgileri başarı ile güncellendi!";
                    return View(userModel);
                }
            }
            catch (Exception)
            {
                ViewData["Message"] = " Bir Hata Oluştu Lütfen Tekrar Deneyiniz!";
            }
            return View();
        }

        [Authorize(Roles = "YetkiliYSKMemuru")]
        public ActionResult Delete(string IdentityNo)
        {
            try
            {
                var user = m_merkezDC.Users.First(x => x.IdentityNo == IdentityNo);
                m_merkezDC.Users.DeleteOnSubmit(user);
                 MembershipUser currentUser = Membership.GetUser(user.IdentityNo, false /* userIsOnline */);
                        Membership.DeleteUser(currentUser.UserName);
                m_internetDc.SubmitChanges();
                ViewData["Message"] = "Kullanıcı Başarıyla Silinmiştir!";
            }
            catch (Exception)
            {
                ViewData["Message"] = "Kullanıcı Silme İşlemi Başarısız!";
            }
            return RedirectToAction("List");
        }
    }
}
