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
                        <label for="IdentityNo" >TC Kimlik NO:</label>
                        <input type="text" name="IdentityNo" <%if(Model!=null){ %> readonly <%} %>   value="<%=Model==null ? "" : Model.IdentityNo%>" />
                         <% if (ViewData["IsVoterExists"] == null)
                            { %>
                        <input class="btn btn-primary btn-large" type="submit" value="<%= Model == null ? "Nüfus Bilgilerini Görüntüle" : "Seçmeni Kaydet" %>" />                       
                        <% } %>
                      <%
                            else
                            { %>
                          <input class="btn btn-primary btn-large" type="submit" value="Seçmen Bilgilerini Güncelle"/>                       
                      <% } %>
                             
                    </div>
                </div>
                <%if (Model != null)
                  {%>
                <div class="stat-widget">
                    <div class="stat-button">
                        <label for="Name" >Adı:</label>
                        <input type="text" readonly="readonly"  id="Name"  name="Name" value="<%=Model.Name%>" />
                        <label for="Surname"  >Soyadı:</label>
                        <input type="text" readonly="readonly"  name="Surname" value="<%=Model.Surname%>"/>
                        <label for="BirthPlace" >Doğum Yeri:</label>
                        <input type="text" readonly="readonly"  name="BirthPlace" value="<%=Model.BirthPlace%>"/>
                        <label for="BirthDate" >Doğum Tarihi:</label>
                        <input type="text" readonly="readonly" name="BirthDate" name="BirthPlace" value="<%=Model.BirthDate.Value.ToShortDateString()%>"  />
                        <label for="MotherName"  >Anne Adı:</label>
                        <input type="text" readonly="readonly" name="MotherName" name="BirthPlace" value="<%=Model.MotherName%>" />
                    </div>
                </div>
                <div class="stat-widget">
                    <div class="stat-button">
                       <label for="FatherName" >Baba Adı:</label>
                        <input type="text" readonly="readonly" name="FatherName" value="<%=Model.FatherName%>" />

                        <label for="City" >İl:</label>
                        <input type="text" readonly="readonly"  name="City"value="<%=Model.City%>" />

                        <label for="District" >İlçe:</label>
                        <input type="text" readonly="readonly" name="District" value="<%=Model.District%>" />

                        <label for="Address" >Adres:</label>
                        <input type="text" readonly="readonly" name="Address" value="<%=Model.Address%>" />

                        <label for="Telephone" >Telefon:</label>
                        <input type="text" readonly="readonly" name="Telephone" value="<%=Model.Telephone%>" />
                       
                    </div>
                </div>
                <div class="stat-widget">
                    <div class="stat-button">
                     <label for="Region" >Seçim Bölgesi:</label>
                     <select name="RegionId" >
                     <%foreach (var region in ViewData["Regions"] as List<EOS.Officier.Models.Region>)
                       {
                           if (Model.RegionId == region.RegionId)
                           {
                           %>
                            <option value="<%=region.RegionId %>" selected="selected"><%=region.Region1%></option>
                           <%}
                           else {%>
                            <option value="<%=region.RegionId %>"><%=region.Region1%></option>

                           <%} %>

                       <%} %>
                     </select>
                        <label for="Handicapped" >Fiziksel Engelli:</label>
                        <input type="checkbox"  id="Handicapped" name="Handicapped" value="true"/>
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
                       <p >Lütfen kaydetmek istediğiniz seçmenin nüfus bilgilerine erişmek için kimlik numarasını giriniz.</p>
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
        <a href="#tablewidget" class="block-heading" data-toggle="collapse">Yeni Kayıt Olan Seçmenler<span class="label label-warning"></span></a>
        <div id="tablewidget" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Mark</td>
                  <td>Tompson</td>
                  <td>the_mark7</td>
                </tr>
                <tr>
                  <td>Ashley</td>
                  <td>Jacobs</td>
                  <td>ash11927</td>
                </tr>
                <tr>
                  <td>Audrey</td>
                  <td>Ann</td>
                  <td>audann84</td>
                </tr>
                <tr>
                  <td>John</td>
                  <td>Robinson</td>
                  <td>jr5527</td>
                </tr>
                <tr>
                  <td>Aaron</td>
                  <td>Butler</td>
                  <td>aaron_butler</td>
                </tr>
                <tr>
                  <td>Chris</td>
                  <td>Albert</td>
                  <td>cab79</td>
                </tr>
              </tbody>
            </table>
            <p><a href="users.html">More...</a></p>
        </div>
    </div>
    <div class="block span6">
        <a href="#widget1container" class="block-heading" data-toggle="collapse">Yardım </a>
        <div id="widget1container" class="block-body collapse in">
            <h2>Seçmen Nasıl Eklenir?</h2>
            <p>This template was developed with <a href="http://middlemanapp.com/" target="_blank">Middleman</a> and includes .erb layouts and views.</p>
            <p>All of the views you see here (sign in, sign up, users, etc) are already split up so you don't have to waste your time doing it yourself!</p>
            <p>The layout.erb file includes the header, footer, and side navigation and all of the views are broken out into their own files.</p>
            <p>If you aren't using Ruby, there is also a set of plain HTML files for each page, just like you would expect.</p>
        </div>
    </div>
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
