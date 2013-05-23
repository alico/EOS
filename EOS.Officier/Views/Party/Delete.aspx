<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.PartyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Parti Sil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



<div class="container-fluid">
<style type="text/css">
table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background:#b5cfd2 url('cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	background:#dcddc0 url('cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
        <%if (ViewData["Message"] != null)
          { %>
          <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>İşlem Sonucu:</strong> <%=ViewData["Message"]%>
               </div>
        <%} %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<div class="block">
        <a href="#page-stats" class="block-heading" data-toggle="collapse">Parti Listeleme</a>
        <div id="page-stats" class="block-body collapse in">
        <form method="post">
<table class="imagetable">
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
    </tr>
    <input type="hidden" name="Party.PartyId" value="<%=Model.Party.PartyId %>" />

    <tr>
        <td>
        <img src="<%=Model.Party.ImageUrl%>" width="50px" height="50"/>
        </td>
        <td>
            <%=Model.Party.PartyAcr%>
        </td>
        <td>
              <%=Model.Party.PartyName%>
        </td>
        <td>
            <%= Model.Manager.Name%>
        </td>
        <td>
            <%= Model.Manager.Surname%>
        </td>
        <td>
            <%= Model.Party.CreatedAt.Value.ToShortDateString()%>
        </td>
    </tr>
</table>
<br />
<br />
<h2>
İlgili parti bilgisini silmek istediğinizden emin misiniz?
</h2>
<input type="submit" class="btn btn-primary btn-large" value="Evet" />
</form>
</div>
</div>
</div>

</asp:Content>
