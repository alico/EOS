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
