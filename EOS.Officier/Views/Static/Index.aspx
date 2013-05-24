<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.Vote>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Oy Teyit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="dialog">
            <div class="block">
                <p class="block-heading">
                    Oy Teyit Ekranı</p>
                <div class="block-body">
                    <form method="post">
                    <%if (Model == null)
                      { %>
                    <label>
                        Teyit Kodu</label>
                    <input name="TrackingCode" type="text" class="span6">
                    <label>
                        Seçim Adı</label>
                    <select name="ElectionId">
                        <%foreach (EOS.Officier.Models.VElectionDetail item in ViewData["FinishedElections"] as List<EOS.Officier.Models.VElectionDetail>)
                          {%>
                        <option value="<%= item.ElectionId %>">
                            <%=item.Name%></option>
                        <%} %>
                    </select>
                    <input type="submit" value="Sorgula" class="btn btn-primary pull-right" />
                    <%} %>
                    <%else {%> 
                            <div class="well">
                            <%=Model.TrackingCode.Value %> Numaralı Oyunuz <%=Model.UsedAt.Value %> Tarihinde 
                            Kullanılmış ve Sürece Dahil Edilmiştir.
                            </div>
                      <%} %>
                    <div class="clearfix">
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
