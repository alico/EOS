<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.RegionModel>" %>

<%@ Import Namespace="EOS.Officier.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Bölge Düzenleme Ekranı
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Bölge Düzenle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post">
        <input type="hidden" name="Region.RegionId" value="<%=Model.Region.RegionId %>" />
        <div class="stat-widget-container">
            <div class="stat-widget">
                <div class="stat-button">
                    <% if (Model != null)
                       { %>
                    <label>
                        Bölge Adı:</label>
                    <input class="required" type="text" name="Region.Region1" value="<%=Model.Region.Region1 %>" />
                    <label>
                        Aday Sayısı:</label>
                    <input class="required" type="text" name="Region.CandidateCount" value="<%=Model.Region.CandidateCount %>" />
                    <input type="hidden" name="Region.CityId" value="<%=Model.Region.CityId %>" />
                    <input class="btn btn-primary btn-large" type="submit" value="Güncelle" />
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <select id="d-list" class="demo1 span12" name="duallistbox_demo1" size="10" multiple="multiple"
                        style="display: none;">
                        <% foreach (var district in Model.Districts)
                           {%>
                        <option value="<%=district.DistrictId %>">
                            <%=district.DistrictName %></option>
                        <%} %>
                    </select>
                    <script>
                                

                                /*$('#d-list').on('change', function () {
                                    $('#selected-district').append("<option value='1' selected='true'><%=(ViewData["SelectedDistricts"] as List<District>)[0].DistrictName %></option>");
                                    
                                });
                                $('#selected-district option').on('click', function () {
                                    console.log($(this));
                                    $('#d-list').append($(this));
                                    
                                });*/
                                <%foreach(District district in ViewData["SelectedDistricts"] as List<District>) 
                                {%>
                                $('#d-list').append("<option value='<%=district.DistrictId %>' selected='true'><%=district.DistrictName %></option>");
                                <%} %>
                                $('.demo1').bootstrapDualListbox();
                    </script>
                </div>
            </div>
            <% } %>
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
