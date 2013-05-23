<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.PartyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Parti Ekle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
            type="text/javascript"></script>
            <a href="#page-stats" class="block-heading" data-toggle="collapse">Parti Ekle</a>
            <div id="page-stats" class="block-body collapse in">
                <form method="post"  enctype="multipart/form-data">
                <div class="row-fluid">
                    <% if (ViewData["Wizard"] == "Party")
                       { %>
                    <div class="stat-widget">
                        <div class="stat-button">
                            <label for="PartyName">
                                Parti Adı:</label>
                            <input type="text" class="required" name="Party.PartyName" />
                            <label for="PartyAcr">
                                Parti Kısaltması:</label>
                            <input type="text" class="required" name="Party.PartyAcr" />
                            <label for="ImageUrl">
                                Parti Simgesi:</label>
                            <input type="file" class="required" name="ImageUrl" />
                            <input class="btn btn-primary btn-large" type="submit" value="Partiyi Kaydet" />
                        </div>
                    </div>
                    <% } %>
                    <%else if (ViewData["Wizard"] == "Manager")
                       { %>
                    <div class="span6">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="IdentityNo">
                                    TC Kimlik NO:</label>
                                <input class="required" type="text" name="Manager.IdentityNo" value="<%= Model == null ? "" : Model.Manager.IdentityNo %>" />
                                <input class="btn btn-primary btn-large" type="submit" value="Yönetici Sorgula" />
                            </div>
                        </div>
                    </div>
                    <div class="span3 pull-right">
                        <label for="ImageUrl">
                            Parti Simgesi:</label>
                        <img src="<%= ViewData["PartyImage"] %>" id="Img1" />
                        <input type="hidden" name="Party.ImageUrl" value="<%= Model.Party.ImageUrl %>">
                    </div>
                    <div class="span3 pull-right">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="PartyName">
                                    Parti Adı:</label>
                                <input type="text" readonly name="Party.PartyName" value="<%= Model.Party.PartyName %>" />
                                <label for="PartyAcr">
                                    Parti Kısaltması:</label>
                                <input type="text" readonly name="Party.PartyAcr" value="<%= Model.Party.PartyAcr %>" />
                                <input type="hidden" name="Party.PartyId" value="<%= Model.Party.PartyId %>" />
                            </div>
                        </div>
                    </div>
                    <% }
                       else
                       {  %>
                    <div class="stat-widget-container">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="IdentityNo">
                                    TC Kimlik NO:</label>
                                <input type="text" name="Manager.IdentityNo" value="<%=Model.Manager.IdentityNo %>" />
                                <input class="btn btn-primary btn-large" type="submit" value="Başkan Olarak Ata" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Name">
                                    Adı:</label>
                                <input type="text" name="Manager.Name" readonly value="<%= Model.Manager.Name %>" />
                                <label for="Surname">
                                    Soyadı:</label>
                                <input type="text" name="Manager.Surname" readonly value="<%= Model.Manager.Surname %>" />
                                <label for="BirthPlace">
                                    Doğum Yeri:</label>
                                <input type="text" name="Manager.BirthPlace" readonly value="<%= Model.Manager.BirthPlace %>" />
                                <label for="BirthDate">
                                    Doğum Tarihi:</label>
                                <input type="text" name="Manager.BirthDate" readonly name="BirthPlace" value="<%= Model.Manager.BirthDate.Value.ToShortDateString() %>" />
                                <label for="MotherName">
                                    Anne Adı:</label>
                                <input type="text" name="Manager.MotherName" readonly name="BirthPlace" value="<%= Model.Manager.MotherName %>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="FatherName">
                                    Baba Adı:</label>
                                <input type="text" name="Manager.FatherName" readonly value="<%= Model.Manager.FatherName %>" />
                                <label for="City">
                                    İl:</label>
                                <input type="text" name="Manager.City" readonly value="<%= Model.Manager.City %>" />
                                <label for="District">
                                    İlçe:</label>
                                <input type="text" name="Manager.District" readonly value="<%= Model.Manager.District %>" />
                                <label for="Address">
                                    Adres:</label>
                                <input type="text" name="Manager.Address" readonly value="<%= Model.Manager.Address %>" />
                                <label for="Telephone">
                                    Telefon:</label>
                                <input type="text" name="Manager.Telephone" readonly value="<%= Model.Manager.Telephone %>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="PartyName">
                                    Parti Adı:</label>
                                <input type="text" id="PartyName" name="Party.PartyName" value="<%= Model.Party.PartyName %>" />
                                <label for="PartyAcr">
                                    Parti Kısaltması:</label>
                                <input type="text" id="PartyAcr"  name="Party.PartyAcr" value="<%= Model.Party.PartyAcr %>" />
                                <label for="ImageUrl">
                                    Parti Simgesi Adresi:</label>
                                <img src="<%= Model.Party.ImageUrl %>" id="Party.ImageUrl" />
                                <input type="hidden" name="Party.PartyId" value="<%= Model.Party.PartyId %>" />
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
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
         <script type="text/javascript">
            $(function () {
           jQuery.validator.addClassRules("required", {
  required: true
});
        $("form").validate({
					rules: {
						"#PartyName": {         
							required: true,   
							minlength: 5,
                            maxlength: 50,    
						},
                        "#PartyAcr": {
                            required: true,
							minlength: 2,
                            maxlength: 7,    
                        },
                        "#ImageUrl": {
                            required: true,
                        }
					},
					messages: { 
						"Party.PartyName": {         
							required: "Bu alan gereklidir",   
							minlength: "En az 5 harakter",
                            maxlength: "En fazla 50 karakter",    
						},
                        PartyAcr: {
							required: "Bu alan gereklidir",   
							minlength: "En az 2 harakter",
                            maxlength: "En fazla 7 karakter",     
                        },
                        ImageUrl: {
                            required: "Bu alan gereklidir.",
                        }
					},
			});
        });
        </script>
</asp:Content>
