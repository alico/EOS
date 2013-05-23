<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.Voter>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Voter</legend>

    <div class="display-label">RegionId</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.RegionId) %>
    </div>

    <div class="display-label">BiometricPath</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.BiometricPath) %>
    </div>

    <div class="display-label">CreatedBy</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CreatedBy) %>
    </div>

    <div class="display-label">CreatedAt</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CreatedAt) %>
    </div>

    <div class="display-label">CreatedFrom</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CreatedFrom) %>
    </div>

    <div class="display-label">VoterStatus</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.VoterStatus) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
