<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.PartyModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Parti Listeleme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
        <a href="#page-stats" class="block-heading" data-toggle="collapse">Parti Listeleme</a>
        <div id="page-stats" class="block-body collapse in">


<table id="dt_basic" class="imagetable table table-condensed">
<thead>
    <tr>
        <th>
            Parti Simgesi
        </th>
        <th>
            Parti Kısa Adı
        </th>
        <th>
            Parti Adı
        </th>
        <th>
            Başkan Adı
        </th>
        <th>
            Başkan Soyadı
        </th>
        <th>
            Oluşturulma Tarihi
        </th>
        <th>
            
        </th>
    </tr>
</thead>
<tbody>
<%int i = 0;
  var images = ViewData["PartyImages"] as List<string>;
   %>
<% foreach (var item in Model) { %>
    <tr id="party_<%=item.Party.PartyId%>">
        <td>
       <%-- <img src="<%=ViewData["Image"]%>" width="50px" height="50"/>--%>
        <img src="<%=images[i]%>" width="50px" height="50"/>
        
        </td>
        <td>
            <%=item.Party.PartyAcr%>
        </td>
        <td>
              <%=item.Party.PartyName%>
        </td>
        <td>
            <%= item.Manager.Name%>
        </td>
        <td>
            <%= item.Manager.Surname%>
        </td>
        <td>
            <%= item.Party.CreatedAt.Value.ToShortDateString()%>
        </td>
        <td>
            <%: Html.ActionLink("Düzenle", "Edit", new { PartyId = item.Party.PartyId })%> | 
            <a class="partyDelete" href="#partyDeleteModal" data-toggle="modal" data-id="<%=item.Party.PartyId %>">Sil</a>
        </td>
    </tr>
<%i++; } %>
</tbody>
</table>
</div>
<div id="partyDeleteModal" class="modal hide fade">
    <div class="modal-header">
        Parti Sil?
        <a href="javascript:;" data-dismiss="modal"><i class="close">x</i></a>
    </div>
    <div class="modal-body">
        Partiyi silmek ...
    </div>
    <div class="modal-footer">
    </div>
    
</div>
<script>
    var url;
    $('.partyDelete').click(function () {
        console.log();
        var delete_id = $(this).data('id');
        url = "/party/delete?PartyId=" + delete_id;
        var data = 'Silmek istediğinize emin misiniz? <br> <a id="confirmedDelete" data-id="' + delete_id + '" class="btn btn-primary" href="' + url + '">Evet</a>';
        $('.modal-body').html(data);
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
