<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.PartyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Parti Bilgisi Düzenle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Parti Ekle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post">
        <table>
            <tr>
                <td>
                    <%if (Model != null)
                      { %>
                    <input type="hidden" name="Party.PartyId" value="<%=Model.Party.PartyId %>" />
                    <div class="stat-widget-container">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <br />
                                <a href="#SearchBox" data-toggle="collapse">Yeni yönetici atamak için tıklayınız</a>
                                <div class="collapse" id="SearchBox">
                                    <label for="SearchIdentity">
                                        TC Kimlik No:
                                    </label>
                                    <input type="text" name="SearchIdentity" />
                                    <input type="submit" class="btn btn-primary" value="Yönetici Sorgula" />
                                </div>
                            </div>
                        </div>
                        <%if (Model.Manager != null)
                          {%>
                        <div class="stat-widget">
                            <div class="stat-button">
                            <label for="IdentityNo">
                                    Yönetici TC Kimlik NO:</label>
                                <%if (Model.Manager != null)
                                  { %>
                                <input type="text" name="Manager.IdentityNo" value="<%= Model.Manager.IdentityNo%>" />
                                <%}
                                  else
                                  {%>
                                <input type="text" name="Manager.IdentityNo" value="" />
                                <%} %>
                                <label for="Name">
                                    Adı:</label>
                                <input type="text" name="Manager.Name" value="<%=Model.Manager.Name%>" />
                                <label for="Surname">
                                    Soyadı:</label>
                                <input type="text" name="Manager.Surname" value="<%=Model.Manager.Surname%>" />
                                <label for="BirthPlace">
                                    Doğum Yeri:</label>
                                <input type="text" name="Manager.BirthPlace" value="<%=Model.Manager.BirthPlace%>" />
                                <label for="BirthDate">
                                    Doğum Tarihi:</label>
                                <input type="text" name="Manager.BirthDate" name="BirthPlace" value="<%=Model.Manager.BirthDate.Value.ToShortDateString()%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="MotherName">
                                    Anne Adı:</label>
                                <input type="text" name="Manager.MotherName" name="BirthPlace" value="<%=Model.Manager.MotherName%>" />
                                <label for="FatherName">
                                    Baba Adı:</label>
                                <input type="text" name="Manager.FatherName" value="<%=Model.Manager.FatherName%>" />
                                <label for="City">
                                    İl:</label>
                                <input type="text" name="Manager.City" value="<%=Model.Manager.City%>" />
                                <label for="District">
                                    İlçe:</label>
                                <input type="text" name="Manager.District" value="<%=Model.Manager.District%>" />
                                <label for="Address">
                                    Adres:</label>
                                <input type="text" name="Manager.Address" value="<%=Model.Manager.Address%>" />
                            </div>
                        </div>
                        <%} %>
                        <% else
                          { %>
                        <div class="stat-widget">
                            <div class="stat-button">
                            </div>
                        </div>
                        <%} %>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="PartyName">
                                    Parti Adı:</label>
                                <input type="text" name="Party.PartyName" value="<%=Model.Party.PartyName%>" />
                                <label for="PartyAcr">
                                    Parti Kısaltması:</label>
                                <input type="text" name="Party.PartyAcr" value="<%=Model.Party.PartyAcr%>" />
                                <label for="ImageUrl">
                                    Parti Simgesi:</label>
                                <%--<input type="hidden" name="Party.Image" value="<%=ViewData["PartyImage"] %>" />--%>
                                <input type="hidden" name="Party.ImageUrl" value="<%=Model.Party.ImageUrl%>" />
                                <img src="<%=ViewData["PartyImage"]%>" width="100px" height="50" />
                                <br />
                                  <br />
                                    <br />
                                      <br />
                                        
                                <input class="btn btn-primary btn-large" type="submit" value="Parti Bilgisi Güncelle" />
                            </div>
                        </div>
                    </div>
                    <%-- <%else
                  { %>
                   <div class="stat-widget">
                    <div class="stat-button"> 
                    </div>
                </div>
                    <div class="stat-widget">
                    <div class="stat-button">
                       <p >Lütfen kaydetmek istediğiniz vatandaşın nüfus bilgilerine erişmek için kimlik numarasını giriniz.</p>
                    </div>
                </div>
                <%} %>--%>
    </div>
    <%} %>
    </td> </tr> </table> </form> </div>
    <div class="row-fluid">
        <div class="block span6">
            <a href="#tablewidget" class="block-heading" data-toggle="collapse">Yeni Kayıt Olan
                Seçmenler<span class="label label-warning"></span></a>
            <div id="tablewidget" class="block-body collapse in">
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                First Name
                            </th>
                            <th>
                                Last Name
                            </th>
                            <th>
                                Username
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                Mark
                            </td>
                            <td>
                                Tompson
                            </td>
                            <td>
                                the_mark7
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ashley
                            </td>
                            <td>
                                Jacobs
                            </td>
                            <td>
                                ash11927
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Audrey
                            </td>
                            <td>
                                Ann
                            </td>
                            <td>
                                audann84
                            </td>
                        </tr>
                        <tr>
                            <td>
                                John
                            </td>
                            <td>
                                Robinson
                            </td>
                            <td>
                                jr5527
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Aaron
                            </td>
                            <td>
                                Butler
                            </td>
                            <td>
                                aaron_butler
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Chris
                            </td>
                            <td>
                                Albert
                            </td>
                            <td>
                                cab79
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p>
                    <a href="users.html">More...</a></p>
            </div>
        </div>
        <div class="block span6">
            <a href="#widget1container" class="block-heading" data-toggle="collapse">Yardım
            </a>
            <div id="widget1container" class="block-body collapse in">
                <h2>
                    Seçmen Nasıl Eklenir?</h2>
                <p>
                    This template was developed with <a href="http://middlemanapp.com/" target="_blank">
                        Middleman</a> and includes .erb layouts and views.</p>
                <p>
                    All of the views you see here (sign in, sign up, users, etc) are already split up
                    so you don't have to waste your time doing it yourself!</p>
                <p>
                    The layout.erb file includes the header, footer, and side navigation and all of
                    the views are broken out into their own files.</p>
                <p>
                    If you aren't using Ruby, there is also a set of plain HTML files for each page,
                    just like you would expect.</p>
            </div>
        </div>
    </div>
</asp:Content>
