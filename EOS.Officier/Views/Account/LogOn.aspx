<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Giriş Ekranı
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">Giriş Yapın</p>
            <div class="block-body">
                <form method="post">
                    <label>TC Kimlik Numarası</label>
                    <input type="text" name="UserName" class="span12">
                    <label>Şifre</label>
                    <input type="password" name="Password" class="span12">
                    <input type="submit" value="Giriş" class="btn btn-primary pull-right"> 
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>


    


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function () {
            $('.demo-cancel-click').click(function () { return false; });
        });
    </script>

  <%--  <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Giriş Başarısız! Gerekli hususlara dikkat edip yeniden deneyiniz...")%>
        <div>
            <fieldset>
                <legend>Hesap Bilgileri</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe) %>
                </div>
                
                <p>
                    <input type="submit" value="Log On" />
                </p>
            </fieldset>
        </div>
    <% } %>--%>
</asp:Content>
