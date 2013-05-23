<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.VUser>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kullanıcı Listeleme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <a href="#page-stats" class="block-heading" data-toggle="collapse">Kullanıcı Listeleme</a>
        <div id="page-stats" class="block-body collapse in">


<table id="dt_basic" class="imagetable table table-striped table-condensed">
<thead>
    <tr>
        <th>
            TC Kimlik No
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
            Görev Yeri
        </th>
        <th>
            Görevi
        </th>
    </tr>
    </thead>
    <tbody>

<% foreach (var item in Model) { %>
    <tr id="party_<%=item.IdentityNo%>">
        <td>
        <%=item.IdentityNo %>
        </td>
        <td>
            <%=item.Name%>
        </td>
        <td>
              <%=item.Surname%>
        </td>
        <td>
            <%= item.BirthPlace%>
        </td>
        <td>
            <%= item.BirthPlace%>
        </td>
        <td>
            <%= item.DepartmentName%>
        </td>
        <td>
            <%: Html.ActionLink("Düzenle", "Edit", new { IdentityNo = item.IdentityNo })%> | 
            <a class="partyDelete" href="#partyDeleteModal" data-toggle="modal" data-id="<%=item.IdentityNo %>">Sil</a>
        </td>
    </tr>
<% } %>
</tbody>
</table>
</div>
<div id="partyDeleteModal" class="modal hide fade">
    <div class="modal-header">
        Kulanıcı Sil
        <a href="javascript:;" data-dismiss="modal"><i class="close">x</i></a>
    </div>
    <div class="modal-body">
        Kullanıcıyı silmek istediğinize emin misiniz?
    </div>
    <div class="modal-footer">
    </div>
    
</div>
<script>
    var url;
    $('.partyDelete').click(function () {
        console.log();
        var delete_id = $(this).data('id');
        url = "/user/delete?IdentityNo=" + delete_id;
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
