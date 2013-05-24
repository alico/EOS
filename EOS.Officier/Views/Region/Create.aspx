<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.RegionModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Bölge Ekle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Bölge Ekle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post">
        <div class="stat-widget-container">
            <div class="stat-widget">
                <div class="stat-button">
                    <% if (ViewData["Cities"] != null)
                       { %>
                    <label for="CityId">
                        Şehir Seçiniz:</label>
                    <select name="CityId">
                        <% foreach (var city in ViewData["Cities"] as List<EOS.Officier.Models.City>)
                           { %>
                        <option value="<%= city.CityId %>">
                            <%= city.CityName %></option>
                        <% } %>
                        <option></option>
                    </select>
                    <% }
                       else
                       { %>
                    <label>
                        Bölge Adı:</label>
                    <input type="text" class="required" name="Region.Region1" />
                    <label>
                        Aday Sayısı:</label>
                    <input type="text" class="required" name="Region.CandidateCount" />
                    <input type="hidden" name="Region.CityId" value="<%=Model.Region.CityId %>" />
                    <% } %>
                    <input class="btn btn-primary btn-large" type="submit" value="<%=Model==null ? "İlçeleri getir" :"Bölgeyi Kaydet"%>" />
                </div>
            </div>
            <% if (Model != null)
               { %>
            <div class="row-fluid">
                <div class="span12">
                    <select class="demo1 span12" name="duallistbox_demo1" size="10" multiple="multiple"
                        style="display: none;">
                        <% foreach (var district in Model.Districts)
                           {%>
                        <option value="<%=district.DistrictId %>">
                            <%=district.DistrictName %></option>
                        <%} %>
                    </select>
                    <script>
                        $('.demo1').bootstrapDualListbox();
                    </script>
                </div>
            </div>
            <% } %>
            <%--test--%>
        </div>
        </form>
    </div>
    <script>
        $('.demo2').bootstrapDualListbox({
            preserveselectiononmove: 'moved',
            moveonselect: false,
            initialfilterfrom: 'ion ([7-9]|[1][0-2])'
        });
    </script>
    <script type="text/javascript">
            $(function () {
        $("form").validate({
					rules: {
						Region1: {         
							required: true,   
							minlength: 3,
                            maxlength: 40,    
						},
                        CandidateCount: {
                            required: true,
                            number: true,
                            maxlength: 3,
                        },
					},
					messages: { 
						Region1: {           
							required: "Bu alan gereklidir",   
							minlength: "3 karakter olmalıdır", 
							maxlength: "40 karakter olmalıdır",    
						},
                        CandidateCount: {
                            required: "Bu alan gereklidir!",
                            number: "Sadece rakam girmelisiniz!",
                            maxlength: "Fazla girme...Diğerlerine de kalsın...",
                        },
					},
			});
        });
    </script>
</asp:Content>
