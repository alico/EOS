<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EOS.Officier.Models.VCandidate>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Aday Listeleme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Aday Listeleme</a>
    <div id="page-stats" class="block-body collapse in">
        <div class="row-fluid">
            <div class="span12">
                <table id="dt_basic" class="imagetable table table-condensed">
                    <thead>
                        <tr>
                            <th>
                                Aday TC Kimlik No
                            </th>
                            <th>
                                Aday Adı
                            </th>
                            <th>
                                Aday Soyadı
                            </th>
                             <th>
                                Seçim Adı
                            </th>
                            <th>
                                Parti Simgesi
                            </th>
                            <th>
                                Parti Kısa Adı
                            </th>
                            <th>
                                Adaylık Bölgesi
                            </th>
                            <th>
                                Adaylık Sırası
                            </th>
                            <th>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%int i = 0;
                          var images = ViewData["Images"] as List<string>;
                        %>
                        <% foreach (var item in Model)
                           { %>
                        <tr>
                            <td>
                                <%= item.CandidateId%>
                            </td>
                            <td>
                                <%=item.Name%>
                            </td>
                            <td>
                                <%=item.Surname%>
                            </td>
                             <td>
                                <%=item.ElectionName%>
                            </td>
                            <td>
                                <img src="<%=images[i] %>" width="50px" height="50" />
                            </td>
                            <td>
                                <%= item.PartyAcr%>
                            </td>
                            <td>
                                <%= item.Region%>
                            </td>
                            <td>
                                <%= item.OrderNo%>
                            </td>
                            <td>
                                <%: Html.ActionLink("Düzenle", "Edit", new { CandidateId = item.CandidateId,ElectionId=item.ElectionId })%>
                                <a class="candidateDelete" href="#candidateDeleteModal" data-toggle="modal" data-id="<%=item.CandidateId%>" data-election="<%=item.ElectionId %>">
                                    |Sil</a>
                            </td>
                        </tr>
                        <%i++;
                           } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="candidateDeleteModal" class="modal hide fade">
        <div class="modal-header">
            Aday Silme <a href="javascript:;" data-dismiss="modal"><i class="close">x</i></a>
        </div>
        <div class="modal-body">
            Adayı Silmek İstediğinize Emin Misiniz?
        </div>
        <div class="modal-footer">
        </div>
    </div>
    <script>
        var url;
        $('.candidateDelete').click(function () {
            console.log();
            var delete_id = $(this).data('id');
            var delete_ElectionId = $(this).data('election');
            url = "/candidate/delete?CandidateId=" + delete_id + "&ElectionId=" + delete_ElectionId;
            console.log(delete_ElectionId);
            var data = 'Silmek istediğinize emin misiniz? <br> <a id="confirmedDelete" data-id="' + delete_id + '"data-electionId="' + delete_ElectionId +'" class="btn btn-primary" href="' + url + '">Evet</a>';
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
