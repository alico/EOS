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
</asp:Content>
