<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seçim Sonuç Ekranı
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/javascript" src="<%: Url.Content("~/Scripts/FusionCharts.js") %>"></script>
        <script type="text/javascript" src="<%: Url.Content("~/Scripts/FusionCharts.jqueryplugin.js") %>"></script>
        <div class="printable">
         <a href="#page-stats" class="block-heading" data-toggle="collapse">Seçim Sonucu</a>
            <div id="page-stats" class="block-body collapse in">
            <a id="print" class="btn">Raporla</a>
            <div class="row">
            <div class="span7" id="chartContainer1"></div>
            <div class="span3">
                <div class="well">
                Genel seçim sonuclarını göstermektedir.
                </div>
            </div>
            
            </div>
            <div class="row">
                <div class="span7" id="chartContainer2"></div>                  
            <div class="span3">
                <form id="datas"></form>
                <form method="post" id="cityForm">
                    <div class="stat-widget">
                        <div class="stat-button">
                            <label ></label>
                            <label for="ElectionId">İl:</label>
                            <select id="slcCity" name="CityId">
                            <% foreach (var city in EOS.Officier.Models.Globals.GetCities())
                                {%>
                                <option value="<%=city.CityId %>">
                                    <%=city.CityName %>
                                </option>
                                <%} %>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="well">
                Seçilmiş olan il bazındaki seçim sonuclarını göstermektedir.
                </div>
            </div>
            </div>
            <div class="row">            
             <div class="span7" id="chartContainer3"></div>
            <div class="span3">
            
                <form method="post" id="regionForm">
                    <div class="stat-widget">
                        <div class="stat-button">
                            <label for="RegionId">Seçim Bölgesi:</label>
                            <select id="slcRegion" name="RegionId">
                            <option value="0">---</option>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="well">
                Seçilmiş olan bölge bazındaki seçim sonuclarını göstermektedir.
                </div>
            </div>
            </div>
            <div class="row">            
             <div class="span7" id="chartContainer4"></div>
            <div class="span3">
                <form method="post" id="districtForm">
                    <div class="stat-widget">
                        <div class="stat-button">
                            <label for="DistrictId">İlçe:</label>
                            <select id="slcDistrict" name="DistrictId">
                            <option value="0">---</option>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="well">
                Seçilmiş olan ilçe bazındaki seçim sonuclarını göstermektedir.
                </div>
            </div>
            </div>
             
    <script type="text/javascript">
        $(function () {
            $("#datas").append('<input id="ElectionId" type="hidden" value="' + <%=ViewData["ElectionId"]%> +'">');
        });
        function setChart1() {
            $.get("/election/getcityresult?ElectionId=" + <%=ViewData["ElectionId"]%> + "&CityId=" + $("#slcCity").val(), function (result) {
                var data = [];
                $.each(result.Votes, function(key, obj){
                    data[key] = {"label": obj.PartyAcr , "value":  obj.VoteCount };
                });
                $.each(result.Regions, function(key, obj){
                    $("#slcRegion").append('<option value="' + obj.RegionId + '">' + obj.Region1+ '</option>');
                });
                $("#chartContainer2").insertFusionCharts({
                    type: "Column3D",
                    width: "600",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Seçim Sonucu",
                            "subcaption": $("#slcCity option:selected").text(),
                            "xAxisName": "Partiler",
                            "yAxisName": "Oy",
                            "numberSuffix": " oy",
                            "bgcolor": "ffffff"
                        },
                        "data": data,
                        "trendlines": [{
                            "line": [{
                                "startValue": "1",
                                "displayValue": "Seçim sonuçları {br}",
                                "valueOnRight": "1",
                                "color": "999999"
                            }]
                        }]
                    }
                });
            });
        }
        function setChart2() {
            $.get("/election/getregionresult?ElectionId=" + <%=ViewData["ElectionId"]%> + "&RegionId=" + $("#slcRegion").val(), function (result) {
                var data = [];
                console.log(result);
                $.each(result.Votes, function(key, obj){
                    data[key] = {"label": obj.PartyAcr , "value":  obj.VoteCount };
                });
                $.each(result.Districts, function(key, obj){
                    $("#slcDistrict").append('<option value="' + obj.DistrictId + '">' + obj.DistrictName+ '</option>');
                });
                $("#chartContainer3").insertFusionCharts({
                    type: "Column3D",
                    width: "600",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Seçim Sonucu",
                            "subcaption": $("#slcRegion option:selected").text(),
                            "xAxisName": "Partiler",
                            "yAxisName": "Oy",
                            "numberSuffix": " oy",
                            "bgcolor": "ffffff"
                        },
                        "data": data,
                        "trendlines": [{
                            "line": [{
                                "startValue": "1",
                                "displayValue": "Seçim sonuçları {br}",
                                "valueOnRight": "1",
                                "color": "999999"
                            }]
                        }]
                    }
                });
            });
        }
        function setChart3() {
            $.get("/election/getdistrictresult?ElectionId=" + <%=ViewData["ElectionId"]%> + "&DistrictId=" + $("#slcDistrict").val(), function (result) {
                var data = [];
                $.each(result, function(key, obj){
                    data[key] = {"label": obj.PartyAcr , "value":  obj.VoteCount };
                });
                $("#chartContainer4").insertFusionCharts({
                    type: "Column3D",
                    width: "600",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Seçim Sonucu",
                            "subcaption": $("#slcDistrict option:selected").text(),
                            "xAxisName": "Partiler",
                            "yAxisName": "Oy",
                            "numberSuffix": " oy",
                            "bgcolor": "ffffff"
                        },
                        "data": data,
                        "trendlines": [{
                            "line": [{
                                "startValue": "1",
                                "displayValue": "Seçim sonuçları {br}",
                                "valueOnRight": "1",
                                "color": "999999"
                            }]
                        }]
                    }
                });
            });
        }
        $("#slcCity").on('change', setChart1);
        $("#slcRegion").on('change', setChart2);
        $("#slcDistrict").on('change', setChart3);
    </script>

            <script type="text/javascript">
                $("#chartContainer1").insertFusionCharts({
                    type: "Pie3D",
                    width: "600",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Seçim Sonucu",
                            "subcaption": '<%= ViewData["ElectionName"] %>',
                            "xAxisName": "Partiler",
                            "yAxisName": "Oy",
                            "numberSuffix": " oy",
                            "bgcolor": "ffffff"
                        },
                        "data": [
                        <% foreach(var item in ViewData["result"] as List<EOS.Officier.Models.VGenelVote>) { %>
	                    { "label": "<%=item.PartyAcr %>", "value": "<%=item.VoteCount %>" },
                         <%} %>
                                ],
                        "trendlines": [{
                            "line": [{
                                "startValue": "1",
                                "displayValue": "Seçim sonuçları {br}",
                                "valueOnRight": "1",
                                "color": "999999"
                            }]
                        }]
                    }
                });
		
            </script>
</asp:Content>
