<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Oy Kullanım Detayları
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <a href="#page-stats" class="block-heading" data-toggle="collapse">Oy Kullanım Detayları</a>
        <div id="page-stats" class="block-body collapse in">
<%if (ViewData["Votes"] == null)
  {%>
  <form method="post">
  <div class="stat-widget">
                                    <div class="stat-button">
                                        <label for="IdentityNo">
                                            Seçmen TC Kimlik No:</label>
                                        <input class="required" type="text" name="IdentityNo"/>
                                        <input class="btn btn-primary btn-large" type="submit" value="Oy Kullanım Detaylarını Getir" />
                                        </div>
                                        </div>
                                        </form>

<%}
  else
  {%>
            <a id="print" class="btn">Raporla</a>
  <div class="printable">
<table id="dt_basic" class="imagetable table table-striped table-condensed">
<thead>
    <tr>
        <th>
            Tc Kimlik No 
        </th>
        <th>
            Seçim 
        </th>
        <th>
            Bölge
        </th>
        <th>
            İlçe
        </th>
        <th>
            Oy Kullanma Tarihi
        </th>
        <th></th>
    </tr>
    </thead>
<tbody>
<% if (ViewData["Votes"] != null)
    foreach (var item in ViewData["Votes"] as List<EOS.Officier.Models.VoteModel>)
   { %>
    <tr>
        <td>
            <%=item.Voter.Surname%>,<%=item.Voter.Name%>
        </td>
        <td>
            <%=item.Election.Name%>
        </td>
        <td>
            <%= item.Region.Region1%>
        </td>
        <td>
            <%= item.District.DistrictName%>
        </td>
        <td>
            <%=item.VotingDate.ToShortDateString()%>
        </td>
        <td>
            <%: Html.ActionLink("Düzenle", "Edit", "Voter", new { IdentityNo = item.Voter.IdentityNo }, null)%> 
        </td>
    </tr>
<% } %>
</tbody>
</table>
</div>
<%} %>

<script type="text/javascript">

$(document).ready(function() {
$("form").validate({
					rules: {
						IdentityNo: {         
							required: true,   
							minlength: 11,
                            maxlength: 11,   
                            number: true,   
						},
					},
					messages: { 
						IdentityNo: {           
							required: "Bu alan gereklidir",   
							minlength: "11 karakter olmalıdır", 
							maxlength: "11 karakter olmalıdır",  
                            number: "Sadece rakam girilmelidir."     
						},
					},
			});
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
