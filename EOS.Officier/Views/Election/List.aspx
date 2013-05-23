<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.VElectionDetail>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>List</h2>

<% if (Model != null)
   { %>

<table id="dt_basic" class="table table-condensed">
<thead>
    <tr>
        <th>
            Seçim Adı / Tipi
        </th>
        <th>
            Başlangıç Tarihi
        </th>
        <th>
            Bitiş Tarihi
        </th>
        <th>
            Durumu
        </th>
        <th></th>
    </tr>
</thead>
<tbody>
<% foreach (var item in Model)
   { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.StartDate) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.FinishDate) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.StatusName) %>
        </td>
        </td>
        <td>
            <%: Html.ActionLink("Süreçler", "ManageElectionProcess", new {ElectionId=item.ElectionId}) %> |
            <%: Html.ActionLink("Sonuçlar", "Show", new { ElectionId = item.ElectionId })%> 
        </td>
    </tr>
<% } %>
</tbody>
</table>
<% } %>

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
