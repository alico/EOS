<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Controllers.CandidateModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Aday Ekle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Aday Ekle</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post">
        <table>
            <tr>
                <td>
                    <div class="stat-widget-container">
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="IdentityNo">
                                    TC Kimlik NO:</label>
                                <input type="text" class="required" name="Citizen.IdentityNo" value="<%=Model==null ? "" : Model.Citizen.IdentityNo%>" <%if(Model!=null){ %> readonly="readonly"<%} %> />
                                <%if (Model == null)
                                  { %>
                                <label for="Candidate.ElectionId">
                                    Seçim Adı:</label>
                                <select class="required"  id="Select1" name="Candidate.ElectionId">
                                    <% foreach (var election in ViewData["Elections"] as List<EOS.Officier.Models.Election>)
                                       {%>
                                    <option value="<%=election.ElectionId %>">
                                        <%=election.Name%></option>
                                    <%} %>
                                </select>
                                <%} %>
                                <input class="btn btn-primary btn-large" type="submit" value="<%=Model==null ? "Nüfus Bilgilerini Görüntüle" :"Adayı Kaydet"%>" />
                            </div>
                        </div>
                        <%if (Model != null)
                          {%>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Name">
                                    Adı:</label>
                                <input readonly="readonly" type="text" name="Citizen.Name" value="<%=Model.Citizen.Name%>" />
                                <label for="Surname">
                                    Soyadı:</label>
                                <input readonly="readonly" type="text" name="Citizen.Surname" value="<%=Model.Citizen.Surname%>" />
                                <label for="BirthPlace">
                                    Doğum Yeri:</label>
                                <input readonly="readonly" type="text" name="Citizen.BirthPlace" value="<%=Model.Citizen.BirthPlace%>" />
                                <label for="BirthDate">
                                    Doğum Tarihi:</label>
                                <input readonly="readonly" type="text" name="Citizen.BirthDate" name="BirthPlace"
                                    value="<%=Model.Citizen.BirthDate.Value.ToShortDateString()%>" />
                                <label for="MotherName">
                                    Anne Adı:</label>
                                <input readonly="readonly" type="text" name="Citizen.MotherName" name="BirthPlace"
                                    value="<%=Model.Citizen.MotherName%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="FatherName">
                                    Baba Adı:</label>
                                <input readonly="readonly" type="text" name="Citizen.FatherName" value="<%=Model.Citizen.FatherName%>" />
                                <label for="City">
                                    İl:</label>
                                <input readonly="readonly" type="text" name="Citizen.City" value="<%=Model.Citizen.City%>" />
                                <label for="District">
                                    İlçe:</label>
                                <input readonly="readonly" type="text" name="Citizen.District" value="<%=Model.Citizen.District%>" />
                                <label for="Address">
                                    Adres:</label>
                                <input readonly="readonly" type="text" name="Citizen.Address" value="<%=Model.Citizen.Address%>" />
                                <label for="Telephone">
                                    Telefon:</label>
                                <input readonly="readonly" type="text" name="Citizen.Telephone" value="<%=Model.Citizen.Telephone%>" />
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <label for="Candidate.ElectionId">
                                    Seçim Adı:</label>
                                <input  type="text" value="<%=ViewData["Election"]%>" readonly="readonly" />
                                <input id="slcElection" type="hidden" name="Candidate.ElectionId" value="<%=Model.Candidate.ElectionId%>"
                                    readonly="readonly" />
                                <label for="Candidate.PartyId">
                                    Parti:</label>
                                <select id="slcParty" name="Candidate.PartyId" <% if(ViewData["PartyId"] != null) {%>
                                    readonly="readonly" <%}%>>
                                    <% foreach (var party in ViewData["Parties"] as List<EOS.Officier.Models.Party>)
                                       {%>
                                    <option <% if (ViewData["PartyId"] == party.PartyId.ToString())
                                                        { %> selected <% }%> value="<%=party.PartyId %>">
                                        <%=party.PartyName%></option>
                                    <%} %>
                                </select>
                                <label for="Candidate.RegionId">
                                    Seçim Bölgesi:</label>
                                <select readonly="readonly" id="slcRegion" name="Candidate.RegionId">
                                    <% foreach (var region in ViewData["Regions"] as List<EOS.Officier.Models.Region>)
                                       {%>
                                    <option value="<%=region.RegionId %>">
                                        <%=region.Region1%></option>
                                    <%} %>
                                </select>
                                <label for="Candidate.OrderNo">
                                    Adaylık Sırası:</label>
                                <select id="slcOrder" name="Candidate.OrderNo">
                                </select>
                            </div>
                        </div>
                        <%} %>
                        <%else
                          { %>
                        <div class="stat-widget">
                            <div class="stat-button">
                            </div>
                        </div>
                        <div class="stat-widget">
                            <div class="stat-button">
                                <p>
                                    Lütfen kaydetmek istediğiniz vatandaşın nüfus bilgilerine erişmek için kimlik numarasını
                                    giriniz.</p>
                            </div>
                        </div>
                        <%} %>
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
    <div class="row-fluid">
        <div class="block span6">
            <a href="#tablewidget" class="block-heading" data-toggle="collapse">Yeni Kayıt Olan
                Seçmenler<span class="label label-warning"></span></a>
            <div id="tablewidget" class="block-body collapse in">
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                First Name
                            </th>
                            <th>
                                Last Name
                            </th>
                            <th>
                                Username
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                Mark
                            </td>
                            <td>
                                Tompson
                            </td>
                            <td>
                                the_mark7
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ashley
                            </td>
                            <td>
                                Jacobs
                            </td>
                            <td>
                                ash11927
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Audrey
                            </td>
                            <td>
                                Ann
                            </td>
                            <td>
                                audann84
                            </td>
                        </tr>
                        <tr>
                            <td>
                                John
                            </td>
                            <td>
                                Robinson
                            </td>
                            <td>
                                jr5527
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Aaron
                            </td>
                            <td>
                                Butler
                            </td>
                            <td>
                                aaron_butler
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Chris
                            </td>
                            <td>
                                Albert
                            </td>
                            <td>
                                cab79
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p>
                    <a href="users.html">More...</a></p>
            </div>
        </div>
        <div class="block span6">
            <a href="#widget1container" class="block-heading" data-toggle="collapse">Yardım
            </a>
            <div id="widget1container" class="block-body collapse in">
                <h2>
                    Seçmen Nasıl Eklenir?</h2>
                <p>
                    This template was developed with <a href="http://middlemanapp.com/" target="_blank">
                        Middleman</a> and includes .erb layouts and views.</p>
                <p>
                    All of the views you see here (sign in, sign up, users, etc) are already split up
                    so you don't have to waste your time doing it yourself!</p>
                <p>
                    The layout.erb file includes the header, footer, and side navigation and all of
                    the views are broken out into their own files.</p>
                <p>
                    If you aren't using Ruby, there is also a set of plain HTML files for each page,
                    just like you would expect.</p>
            </div>
        </div>
    </div>
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
