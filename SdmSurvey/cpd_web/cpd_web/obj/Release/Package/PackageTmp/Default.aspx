<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cpd_web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cold Process Data</title>
    <script src="Scripts/jquery-easyui-1.4.5/jquery.min.js"></script>
    <script src="Scripts/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
    <!-- HighCharts -->
    <script src="Scripts/Highcharts-4.2.3/js/highcharts.js"></script>
    <script src="Scripts/Highcharts-4.2.3/canvas-tools-fix.js"></script>
    <!-- Other dependencies -->
    <script src="Scripts/Highcharts-4.2.3/js/modules/exporting.js"></script>
    <script src="Scripts/Highcharts-4.2.3/js/modules/canvas-tools.js"></script>
    <script src="Scripts/Highcharts-4.2.3/export-csv.js"></script>
    <script src="Scripts/Highcharts-4.2.3/jspdf.min.js"></script>
    <script src="Scripts/Highcharts-4.2.3/grouped-categories.js"></script>
    <!-- This module, after the dependencies -->
    <script src="Scripts/Highcharts-4.2.3/highcharts-export-clientside.js"></script>
    <script src="Scripts/default.js"></script>
    <style type="text/css" scoped="scoped">
        .w-content {
            font-size: 24px;
            text-align: center;
        }
    </style>
    <link href="Scripts/jquery-easyui-1.4.5/themes/default/easyui.css" rel="stylesheet" />
    <link href="Scripts/jquery-easyui-1.4.5/themes/icon.css" rel="stylesheet" />
</head>
<body>
    <h2>Cold洗淨槽導電率 v1.2</h2>
    <div style="margin: 20px 0;"></div>
    <div class="easyui-panel" style="width: 860px; height: 90px; padding: 10px;" title="請輸入查詢條件">
        <table>
            <tr>
                <td>
                    <label>Start Date:</label>
                </td>
                <td>
                    <input id="txtStartDate" data-options="sharedCalendar:'#cc'" />
                </td>
                <td>End Date:</td>
                <td>
                    <input id="txtEndDate" data-options="sharedCalendar:'#cc'" />
                </td>
                <td>Line:
                </td>
                <td>
                    <select id="cbLine" name="line" style="width: 100px">
                        <option value="TC2">TC2</option>
                        <option value="TC3">TC3</option>
                        <option value="TC4">TC4</option>
                        <option value="TC5">TC5</option>
                        <option value="TC6">TC6</option>
                        <option value="TC7">TC7</option>
                        <option value="TC8">TC8</option>
                    </select>
                </td>
                <td>
                    Type:
                </td>
                <td>
                    <select id="cbType" name="type" style="width: 100px">
                        <option value="1">洗淨槽導電率</option>
                        <option value="2">DB電流值</option>
                    </select>
                </td>
                <td>
                    <a id="btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width: 100px">Search</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="cc" class="easyui-calendar"></div>
    <div style="margin: 20px 0;"></div>
    <div id="container"></div>
    <div id="processing" style="width: 400px; height: 90px; padding: 5px;">
        <p class="w-content">資料處理中...</p>
    </div>
</body>
</html>
