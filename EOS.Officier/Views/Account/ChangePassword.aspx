<%@ Page Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.ChangePasswordModel>" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Ayarlar
</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
            <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">Şifre Değiştir</p>
            <div class="block-body">
                <form method="post">
                    <label>Eski Şifre</label>
                    <input name="OldPassword" type="password" class="span12">
                    <label>Yeni Şifre</label>
                    <input name="NewPassword" type="password" class="span12">
                      <label>Yeni Şifre (Tekrar)</label>
                     <input name="ConfirmPassword" type="password" class="span12">
                    <input type="submit" value="Kaydet" class="btn btn-primary pull-right" />
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</asp:Content>
