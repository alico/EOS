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
                                        <input  readonly="readonly" type="text" name="City" value="<%=Model.City%>" />
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
                                               <input type="checkbox"  id="Handicapped" name="Handicapped" value="true" checked/> 
                                            <% }
                                               else
                                               { %>

                                        <input type="checkbox"  id="Handicapped" name="Handicapped" value="true"/>
                                        <% } %>
                                            <label for="VoterStatus">
                                            Seçmenlik Durumu:</label>
                                             <% if (Model.VoterStatus.Value)
                                               { %>
                                               <input type="checkbox"  id="VoterStatus" name="VoterStatus" value="true" checked/> 
                                            <% }
                                               else
                                               { %>

                                        <input type="checkbox"  id="VoterStatus" name="VoterStatus" value="true"/>
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
