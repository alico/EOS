<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Controllers.CandidateModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Aday Düzenleme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Seçmen Bilgisi Güncelle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="POST">
        <td>
            <div class="stat-widget-container">
                <div class="stat-widget">
                    <div class="stat-button">
                        <label for="IdentityNo">
                            TC Kimlik NO:</label>
                        <input readonly="readonly" type="text" name="Citizen.IdentityNo" value="<%= Model == null ? "" : Model.Citizen.IdentityNo %>" />
                        <input class="btn btn-primary btn-large" type="submit" value="Seçmen Bilgilerini Güncelle" />
                    </div>
                </div>
                <% if (Model != null)
                   { %>
                <div class="stat-widget">
                    <div class="stat-button">
                        <label for="Name">
                            Adı:</label>
                        <input type="text" readonly="readonly" name="Citizen.Name" value="<%= Model.Citizen.Name %>" />
                        <label for="Surname">
                            Soyadı:</label>
                        <input type="text" readonly="readonly" name="Citizen.Surname" value="<%= Model.Citizen.Surname %>" />
                        <label for="BirthPlace">
                            Doğum Yeri:</label>
                        <input type="text" readonly="readonly" name="Citizen.BirthPlace" value="<%= Model.Citizen.BirthPlace %>" />
                        <label for="BirthDate">
                            Doğum Tarihi:</label>
                        <input type="text" readonly="readonly" name="Citizen.BirthDate" name="BirthPlace"
                            value="<%= Model.Citizen.BirthDate.Value.ToShortDateString() %>" />
                        <label for="MotherName">
                            Anne Adı:</label>
                        <input type="text" readonly="readonly" name="Citizen.MotherName" name="BirthPlace"
                            value="<%= Model.Citizen.MotherName %>" />
                    </div>
                </div>
                <div class="stat-widget">
                    <div class="stat-button">
                        <label for="FatherName">
                            Baba Adı:</label>
                        <input type="text" readonly="readonly" name="Citizen.FatherName" value="<%= Model.Citizen.FatherName %>" />
                        <label for="City">
                            İl:</label>
                        <input type="text" readonly="readonly" name="Citizen.City" value="<%= Model.Citizen.City %>" />
                        <label for="District">
                            İlçe:</label>
                        <input type="text" readonly="readonly" name="Citizen.District" value="<%= Model.Citizen.District %>" />
                        <label for="Address">
                            Adres:</label>
                        <input type="text" readonly="readonly" name="Citizen.Address" value="<%= Model.Citizen.Address %>" />
                        <label for="Telephone">
                            Telefon:</label>
                        <input type="text" readonly="readonly" name="Citizen.Telephone" value="<%= Model.Citizen.Telephone %>" />
                    </div>
                </div>
                <div class="stat-widget">
                    <div class="stat-button">
                        <label for="Candidate.ElectionId">
                            Seçim Adı:</label>
                        <input id="slcElection" type="hidden" name="Candidate.ElectionId" value="<%=Model.Candidate.ElectionId %>" />
                        <input type="text" value="<%= ViewData["Election"]  %>" readonly="readonly" />
                        <label for="Candidate.PartyId">
                            Parti:</label>
                        <select id="slcParty" name="Candidate.PartyId" <% if (ViewData["PartyId"] != null)
                                                                    { %> readonly <% } %>>
                            <% foreach (var party in ViewData["Parties"] as List<EOS.Officier.Models.Party>)
                               { %>
                            <option <% if (party.PartyId == Model.Candidate.PartyId)
                                               { %> selected <% } %> value="<%= party.PartyId %>">
                                <%= party.PartyName %></option>
                            <% } %>
                        </select>
                        <label for="Candidate.RegionId">
                            Seçim Bölgesi:</label>
                        <select id="slcRegion" name="Candidate.RegionId">
                            <% foreach (var region in ViewData["Regions"] as List<EOS.Officier.Models.Region>)
                               { %>
                            <option <% if (region.RegionId == Model.Candidate.RegionId)
                                               { %> selected <% } %> value="<%= region.RegionId %>">
                                <%= region.Region1 %></option>
                            <% } %>
                        </select>
                        <label for="Candidate.OrderNo">
                            Adaylık Sırası:</label>
                        <select id="slcOrder" name="Candidate.OrderNo">
                        </select>
                    </div>
                </div>
                <% }%>
            </div>
        </form>
    </div>
    <div>
    </div>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript">
        function setOrders() {
            $.get("/candidate/orders?electionId=" + $("#slcElection").val() + "&partyId=" + $("#slcParty").val() + "&regionId=" + $("#slcRegion").val(), function (result) {
                $("#slcOrder option").remove();
                $("#slcOrder").append(result);
            });
        }
        $(setOrders);
        $("#slcParty").on('change', setOrders);
        $("#slcElection").on('change', setOrders);
        $("#slcRegion").on('change', setOrders);
    </script>
</asp:Content>
