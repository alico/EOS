<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Oy Kullanmayan Seçmenlerin Listesi
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <a href="#page-stats" class="block-heading" data-toggle="collapse">Oy Kullanmayan Seçmenlerin Listesi</a>
        <div id="page-stats" class="block-body collapse in">
        
            <a id="print" class="btn">Raporla</a>
<%if (ViewData["Elections"] != null)
  {%>
  <form method="post">
  <div class="stat-widget">
                                    <div class="stat-button">
                                        <label for="ElectionId">
                                            Seçim Adı:</label>
                                        <select id="slcElection" name="ElectionId">
                                            <% foreach (var election in ViewData["Elections"] as List<EOS.Officier.Models.Election>)
                                               {%>
                                            <option value="<%=election.ElectionId %>">
                                                <%=election.Name %></option>
                                            <%} %>
                                        </select>
                                        <input class="btn btn-primary btn-large" type="submit" value="Oy Kullanmayan Seçmenleri Getir" />
                                        </div>
                                        </div>
                                        </form>

<%}
  else
  {%>
  <div class="printable">
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
<% if (ViewData["UnvotingVoters"] != null)
    foreach (var item in ViewData["UnvotingVoters"] as List<EOS.Officier.Models.Voter>)
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
            <%: Html.ActionLink("Düzenle", "Edit", "Voter", new { IdentityNo = item.IdentityNo }, null)%> 
        </td>
    </tr>
<% } %>
</tbody>
</table>
</div>
<%} %>

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
