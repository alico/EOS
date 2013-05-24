<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.Voter>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seçmen Bilgisi Güncelle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Seçmen Bilgisi Güncelle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="POST">
        <table>
            <tr>
                <td>
                    <div class="stat-widget-container">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="IdentityNo">
                                    TC Kimlik NO:</label>
                                <input type="text" name="IdentityNo" <% if(Model!=null){ %> readonly="readonly" <%} %>value="<%=Model==null ? "" : Model.IdentityNo%>" />
                                <input class="btn btn-primary btn-large" type="submit" value="Seçmen Bilgilerini Güncelle" />
                            </div>
                        </div>
                        <%if (Model != null)
                          {%>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Name">
                                    Adı:</label>
                                <input readonly="readonly" type="text" name="Name" value="<%=Model.Name%>" />
                                <label for="Surname">
                                    Soyadı:</label>
                                <input readonly="readonly" type="text" name="Surname" value="<%=Model.Surname%>" />
                                <label for="BirthPlace">
                                    Doğum Yeri:</label>
                                <input readonly="readonly" type="text" name="BirthPlace" value="<%=Model.BirthPlace%>" />
                                <label for="BirthDate">
                                    Doğum Tarihi:</label>
                                <input readonly="readonly" type="text" name="BirthDate" name="BirthPlace" value="<%=Model.BirthDate.Value.ToShortDateString()%>" />
                                <label for="MotherName">
                                    Anne Adı:</label>
                                <input readonly="readonly" type="text" name="MotherName" name="BirthPlace" value="<%=Model.MotherName%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="FatherName">
                                    Baba Adı:</label>
                                <input readonly="readonly" type="text" name="FatherName" value="<%=Model.FatherName%>" />
                                <label for="City">
                                    İl:</label>
                                <input readonly="readonly" type="text" name="City" value="<%=Model.City%>" />
                                <label for="District">
                                    İlçe:</label>
                                <input readonly="readonly" type="text" name="District" value="<%=Model.District%>" />
                                <label for="Address">
                                    Adres:</label>
                                <input readonly="readonly" type="text" name="Address" value="<%=Model.Address%>" />
                                <label for="Telephone">
                                    Telefon:</label>
                                <input readonly="readonly" type="text" name="Telephone" value="<%=Model.Telephone%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Region">
                                    Seçim Bölgesi:</label>
                                <select readonly="readonly" name="RegionId">
                                    <%foreach (var region in ViewData["Regions"] as List<EOS.Officier.Models.Region>)
                                      {
                                          if (Model.RegionId == region.RegionId)
                                          {
                                    %>
                                    <option value="<%=region.RegionId %>" selected="selected">
                                        <%=region.Region1%></option>
                                    <%}
                                                  else
                                                  {%>
                                    <option value="<%=region.RegionId %>">
                                        <%=region.Region1%></option>
                                    <%} %>
                                    <%} %>
                                </select>
                                <label readonly="readonly" for="CreatedBy">
                                    Oluşturan:</label>
                                <input readonly="readonly" type="text" name="CreatedBy" value="<%=Model.CreatedBy%>" />
                                <label readonly="readonly" for="CreatedAt">
                                    Oluşturma Zamanı :</label>
                                <input readonly="readonly" type="text" name="CreatedAt" value="<%=Model.CreatedAt%>" />
                                <%--<label for="CreatedAt">
                                            Oluşturulan Yer :</label>--%>
                                <input type="hidden" name="CreatedAt" value="<%=Model.CreatedFrom%>" />
                                <label for="Handicapped">
                                    Fiziksel Engelli:</label>
                                <% if (Model.Handicapped.Value)
                                   { %>
                                <input type="checkbox" id="Handicapped" name="Handicapped" value="true" checked />
                                <% }
                                   else
                                   { %>
                                <input type="checkbox" id="Handicapped" name="Handicapped" value="true" />
                                <% } %>
                                <label for="VoterStatus">
                                    Seçmenlik Durumu:</label>
                                <% if (Model.VoterStatus.Value)
                                   { %>
                                <input type="checkbox" id="VoterStatus" name="VoterStatus" value="true" checked />
                                <% }
                                   else
                                   { %>
                                <input type="checkbox" id="VoterStatus" name="VoterStatus" value="true" />
                                <% } %>
                            </div>
                        </div>
                        <%} %>
                        <%else
                          { %>
                        <div class="stat-widget">
                            <div class="stat-button">
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <p>
                                    Lütfen kaydetmek istediğiniz seçmenin nüfus bilgilerine erişmek için kimlik numarasını
                                    giriniz.</p>
                            </div>
                        </div>
                        <%} %>
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
</asp:Content>
