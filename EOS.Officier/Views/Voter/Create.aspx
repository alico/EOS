<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.Voter>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seçmen Ekle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Seçmen Ekle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post" action="<%= ViewData["Message"] != null ? "/voter/edit":"/voter/create" %>">
        <table>
            <tr>
                <td>
                    <div class="stat-widget-container">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="IdentityNo">
                                    TC Kimlik NO:</label>
                                <input type="text" name="IdentityNo" <%if(Model!=null){ %> readonly <%} %> value="<%=Model==null ? "" : Model.IdentityNo%>" />
                                <% if (ViewData["IsVoterExists"] == null)
                                   { %>
                                <input class="btn btn-primary btn-large" type="submit" value="<%= Model == null ? "Nüfus Bilgilerini Görüntüle" : "Seçmeni Kaydet" %>" />
                                <% } %>
                                <%
                                   else
                                   { %>
                                <input class="btn btn-primary btn-large" type="submit" value="Seçmen Bilgilerini Güncelle" />
                                <% } %>
                            </div>
                        </div>
                        <%if (Model != null)
                          {%>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Name">
                                    Adı:</label>
                                <input type="text" readonly="readonly" id="Name" name="Name" value="<%=Model.Name%>" />
                                <label for="Surname">
                                    Soyadı:</label>
                                <input type="text" readonly="readonly" name="Surname" value="<%=Model.Surname%>" />
                                <label for="BirthPlace">
                                    Doğum Yeri:</label>
                                <input type="text" readonly="readonly" name="BirthPlace" value="<%=Model.BirthPlace%>" />
                                <label for="BirthDate">
                                    Doğum Tarihi:</label>
                                <input type="text" readonly="readonly" name="BirthDate" name="BirthPlace" value="<%=Model.BirthDate.Value.ToShortDateString()%>" />
                                <label for="MotherName">
                                    Anne Adı:</label>
                                <input type="text" readonly="readonly" name="MotherName" name="BirthPlace" value="<%=Model.MotherName%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="FatherName">
                                    Baba Adı:</label>
                                <input type="text" readonly="readonly" name="FatherName" value="<%=Model.FatherName%>" />
                                <label for="City">
                                    İl:</label>
                                <input type="text" readonly="readonly" name="City" value="<%=Model.City%>" />
                                <label for="District">
                                    İlçe:</label>
                                <input type="text" readonly="readonly" name="District" value="<%=Model.District%>" />
                                <label for="Address">
                                    Adres:</label>
                                <input type="text" readonly="readonly" name="Address" value="<%=Model.Address%>" />
                                <label for="Telephone">
                                    Telefon:</label>
                                <input type="text" readonly="readonly" name="Telephone" value="<%=Model.Telephone%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Region">
                                    Seçim Bölgesi:</label>
                                <select name="RegionId">
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
                                <label for="Handicapped">
                                    Fiziksel Engelli:</label>
                                <input type="checkbox" id="Handicapped" name="Handicapped" value="true" />
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
    <script type="text/javascript">
            $("form").validate({
					rules: {
						IdentityNo: {         
							required: true,   
							minlength: 11,
                            maxlength: 11,   
                            number: true,   
						},
					},
					messages: { 
						IdentityNo: {           
							required: "Bu alan gereklidir",   
							minlength: "11 karakter olmalıdır", 
							maxlength: "11 karakter olmalıdır",  
                            number: "Sadece rakam girilmelidir."     
						},
					},
			});
    </script>
</asp:Content>
