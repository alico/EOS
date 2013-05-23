<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Merhaba, <strong><%: Page.User.Identity.Name %></strong>!
        [ <%: Html.ActionLink("Çıkış Yap", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Giriş Yap", "LogOn", "Account") %> ]
<%
    }
%>
