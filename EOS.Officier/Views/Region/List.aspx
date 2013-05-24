<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.VRegion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Bölge Listele
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Bölge Listele</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post">
        <% if (ViewData["Cities"] != null)
           { %>
        <div class="stat-widget-container">
            <div class="stat-widget">
                <div class="stat-button">
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
                    <input class="btn btn-primary btn-large" type="submit" value="Bölgeleri Görüntüle" />
                </div>
            </div>
        </div>
        <% }
           else
           { %>
        <table id="dt_basic" class="imagetable table table-condensed">
            <thead>
                <tr>
                    <th>
                        Şehir
                    </th>
                    <th>
                        Bölge Adı
                    </th>
                    <th>
                        Aday Sayısı
                    </th>
                    <th>
                        İlçe Sayısı
                    </th>
                    <th>
                    </th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <%= item.CityName%>
                    </td>
                    <td>
                        <%=item.Region%>
                    </td>
                    <td>
                        <%=item.CandidateCount%>
                    </td>
                    <td>
                        <%=item.DistrictCount %>
                    </td>
                    <td>
                        <%: Html.ActionLink("Düzenle", "Edit", new { RegionId = item.RegionId})%>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
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
$(document).ready(function() {
//* datatables
beoro_datatables.basic();

$('.dataTables_filter input').each(function() {
$(this).attr("placeholder", "Arama");
})
});

beoro_datatables = {
basic: function() {
if($('#dt_basic').length) {
$('#dt_basic').dataTable({
"sPaginationType": "bootstrap_full",
"iDisplayLength" : 25,
});
}
}
};
    </script>
</asp:Content>
