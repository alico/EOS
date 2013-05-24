<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.VUser>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
(Yetkili) YSK Memuru Ekle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <a href="#page-stats" class="block-heading" data-toggle="collapse">(Yetkili) YSK Memuru Ekle</a>
            <div id="page-stats" class="block-body collapse in">
                <form method="post">
                <table>
                    <tr>
                        <td>
                            <div class="stat-widget-container">
                                <div class="stat-widget">
                                    <div class="stat-button">
                                        <label for="IdentityNo">
                                            TC Kimlik NO:</label>
                                        <input type="text" name="IdentityNo" value="<%=Model==null ? "" : Model.IdentityNo%>" />
                                        <input class="btn btn-primary btn-large" type="submit" value="<%=Model==null ? "Nüfus Bilgilerini Görüntüle" :"Adayı Kaydet"%>" />
                                    </div>
                                </div>
                                <%if (Model != null)
                                  {%>
                                <div class="stat-widget">
                                    <div class="stat-button">
                                        <label for="Name">
                                            Adı:</label>
                                        <input type="text" name="Name" value="<%=Model.Name%>" />
                                        <label for="Surname">
                                            Soyadı:</label>
                                        <input type="text" name="Surname" value="<%=Model.Surname%>" />
                                        <label for="BirthPlace">
                                            Doğum Yeri:</label>
                                        <input type="text" name="BirthPlace" value="<%=Model.BirthPlace%>" />
                                        <label for="BirthDate">
                                            Doğum Tarihi:</label>
                                        <input type="text" name="BirthDate" name="BirthPlace" value="<%=Model.BirthDate.Value.ToShortDateString()%>" />
                                        <label for="MotherName">
                                            Anne Adı:</label>
                                        <input type="text" name="MotherName" name="BirthPlace" value="<%=Model.MotherName%>" />
                                    </div>
                                </div>
                                <div class="stat-widget">
                                    <div class="stat-button">
                                        <label for="FatherName">
                                            Baba Adı:</label>
                                        <input type="text" name="FatherName" value="<%=Model.FatherName%>" />
                                        <label for="City">
                                            İl:</label>
                                        <input type="text" name="City" value="<%=Model.City%>" />
                                        <label for="District">
                                            İlçe:</label>
                                        <input type="text" name="District" value="<%=Model.District%>" />
                                        <label for="Address">
                                            Adres:</label>
                                        <input type="text" name="Address" value="<%=Model.Address%>" />
                                        <label for="Telephone">
                                            Telefon:</label>
                                        <input type="text" name="Telephone" value="<%=Model.Telephone%>" />
                                    </div>
                                </div>
                               
                                <div class="stat-widget">
                                    <div class="stat-button">
                                        <label for="DepartmentId">
                                            Görev Yeri:</label>
                                        <select name="DepartmentId">
                                            <% foreach (var department in ViewData["Departments"] as List<EOS.Officier.Models.Department>)
                                               {%>
                                            <option value="<%=department.DepartmentId %>">
                                                <%=department.DepartmentName%></option>
                                            <%} %>
                                        </select>
                                        <label for="PartyId">
                                            Görevi:</label>
                                                    
                                        <select name="UserTypeId">
                                            <% foreach (var userType in ViewData["UserTypes"] as List<EOS.Officier.Models.UserType>)
                                               {%>
                                            <option value="<%=userType.UserTypeId %>" >
                                                <%=userType.UserType1%></option>
                                            <%} %>
                                        </select>
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
                                            Lütfen kaydetmek istediğiniz kullanıcının nüfus bilgilerine erişmek için kimlik numarasını
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
            $(function () {
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
        });
        </script>
</asp:Content>
