<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.Citizen>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kayıt Yaptırmayan Vatandaşların Listesi
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <a href="#page-stats" class="block-heading" data-toggle="collapse">Kayıt Yaptırmayan Vatandaşların Listesi</a>
        <div id="page-stats" class="block-body collapse in">
            <a id="print" class="btn">Raporla</a>

<div class="printable">
<table id="dt_basic" class="table table-condensed">
<thead>
    <tr>
        <th>
            Tc Kimlik No 
        </th>
        <th>
            Adı 
        </th>
        <th>
            Soyadı
        </th>
        <th>
            Doğum Yeri
        </th>
        <th>
            Doğum Tarihi
        </th>
        <th>
            Şehir
        </th>
        <th>
            İlçe
        </th>
        <th></th>
    </tr>
    </thead>
    <tbody>
<% if (ViewData["Unrecording"] != null)
       foreach (var item in ViewData["Unrecording"] as List<EOS.Officier.NufusMudurluguService.Citizen>)
   { %>
    <tr>
        <td>
            <%=item.IdentityNo%>
        </td>
        <td>
            <%=item.Name%>
        </td>
        <td>
            <%= item.Surname%>
        </td>
        <td>
            <%= item.BirthPlace%>
        </td>
        <td>
            <%=item.BirthDate.Value.ToShortDateString()%>
        </td>
        <td>
            <%= item.City%>
        </td>
        <td>
            <%= item.District%>
        </td>
        <td>
            A
        </td>
    </tr>
<% } %>
</tbody>
</table>
</div>
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
