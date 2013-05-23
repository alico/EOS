<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.Voter>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seçmen Listeleme
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table id="dt_basic" class="imagetable table table-striped table-condensed">
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
    
        <th>
            Seçmen Durumu
        </th>
        <th>
            Fiziksel Engeli
        </th>
        <th></th>
        </tr>
    </thead>
    <tbody>
<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%=item.IdentityNo %>
        </td>
        <td>
            <%=item.Name %>
        </td>
        <td>
            <%= item.Surname %>
        </td>
        <td>
            <%= item.BirthPlace%>
        </td>
        <td>
            <%=item.BirthDate.Value.ToShortDateString()%>
        </td>
        <td>
            <%= item.City %>
        </td>
        <td>
            <%= item.District %>
        </td>
        <td>
           <%if ((bool)item.VoterStatus)
             { %>
             Aktif
           <%} %>
           <%else
             { %>
             Pasif
           <%}%>
        </td>
        <td>
               <%if ((bool)item.Handicapped)
             { %>
             Var
           <%} %>
           <%else
             { %>
             Yok
           <%}%>
        </td>
        <td>
            <%: Html.ActionLink("Düzenle", "Edit", new { IdentityNo = item.IdentityNo })%> 
        </td>
    </tr>
<% } %>
</tbody>
</table>
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
