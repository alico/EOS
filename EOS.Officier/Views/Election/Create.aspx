<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<EOS.Officier.Models.Election>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seçim Oluştur
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link type="text/css" rel="stylesheet" href="<%: Url.Content("~/Content/bootstrap-datetimepicker/css/datetimepicker.css") %>" />
    <script type="text/javascript" src="<%: Url.Content("~/Content/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js") %>"></script>
    <script type="text/javascript" src="<%: Url.Content("~/Content/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.tr.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <a href="#page-stats" class="block-heading" data-toggle="collapse">Seçim Oluştur</a>
    <div id="page-stats" class="block-body collapse in">
        <form method="post">
        <div class="stat-widget-container">
            <div class="stat-widget">
                <div class="stat-button">
                    <label for="Name">
                        Seçim Adı:</label>
                    <input type="text" class="required" name="Name" />
                    <label for="TypeId">
                        Seçim Tipi:</label>
                    <select name="TypeId">
                        <% foreach (var electionType in ViewData["ElectionTypes"] as List<EOS.Officier.Models.ElectionType>)
                           {%>
                        <option value="<%=electionType.ElectionTypeId %>">
                            <%=electionType.ElectionTypeName %></option>
                        <%} %>
                    </select>
                    <input class="btn btn-primary btn-large" type="submit" value="Seçimi Kaydet ve İlerle" />
                </div>
            </div>
            <div class="stat-widget">
                <div class="stat-button">
                    <div class="control-group">
                        <label class="control-label">
                            Başlangıç Tarihi</label>
                        <div id="start_date" class="controls input-append date form_datetime" data-date="1979-09-16T05:25:07Z"
                            data-date-format="yyyy-mm-dd hh:ii" data-link-field="dtp_input1" >
                            <input readonly class="required" name="StartDate" size="16" type="text" >
                            <span class="add-on"><i class="icon-remove"></i></span><span class="add-on"><i class="icon-th">
                            </i></span>
                        </div>
                        <input type="hidden" id="dtp_input1" value="" /><br />
                    </div>
                <div class="control-group">
                    <label class="control-label">
                        Bitiş Tarihi</label>
                    <div id="end_date" class="controls input-append date datetime" data-date="1979-09-16T05:25:07Z"
                        data-date-format="yyyy-mm-dd hh:ii" data-link-field="dtp_input2">
                        <input class="required" name="FinishDate" size="16" type="text" value="" readonly />
                        <span class="add-on"><i class="icon-remove"></i></span><span class="add-on"><i class="icon-th">
                        </i></span>
                    </div>
                    <input type="hidden" id="dtp_input2" value="" /><br />
                </div>
            </div>
        </div>
    </div>
    </form> 
    </div>
    
    <script type="text/javascript">
        $(function () {
            var today = new Date();
            $('#start_date').datetimepicker({
                language: 'tr',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                startDate: today
            });
            $('#start_date').on('change', function () {
                $('#end_date').datetimepicker({
                    language: 'tr',
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 2,
                    forceParse: 0,
                    startDate: $('#start_date').find('input').val()
                });
            });
        });    
    </script>
</asp:Content>
