<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryID.aspx.cs" Inherits="ToccWeb.QueryID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=11; IE=10; IE=9" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>成大醫院總院-旅遊史快速通關服務</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="Resource/images/icons/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="Resource/vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="Resource/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />

    <link rel="stylesheet" type="text/css" href="Resource/vendor/animate/animate.css" />
    <link rel="stylesheet" type="text/css" href="Resource/vendor/css-hamburgers/hamburgers.min.css" />
    <link rel="stylesheet" type="text/css" href="Resource/vendor/animsition/css/animsition.min.css" />

    <link rel="stylesheet" type="text/css" href="Resource/vendor/select2/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="Resource/vendor/daterangepicker/daterangepicker.css" />

    <link rel="stylesheet" type="text/css" href="Resource/css/util.css" />
    <link rel="stylesheet" type="text/css" href="Resource/css/main.css" />
     <link rel="stylesheet" href="Content/bootstrap-datetimepicker.css" />

    <script type="text/javascript" src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/pidCheck.js"></script>
    <script type="text/javascript" src="scripts/moment.min.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="scripts/bootstrap-datetimepicker.js"></script>


</head>
<body>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
                <span class="logo">
                    <img src="Resource/images/logo.png" alt="" />
                </span>
                <span class="login100-form-title">旅遊史快速通關服務
                </span>
                <p class="notice">(限今日有預約門診病患使用)</p>

                <!-- 輸入證號 -->
                <form class="login100-form validate-form flex-sb flex-w">
                    <!--T -->
                    <span class="txt1 p-b-11">請輸入身分證字號/居留證號</span>
                    <div class="wrap-input100 validate-input m-b-30" data-validate="請輸入正確資訊">
                        <input class="input100 " type="text" name="idno" id="idno" value="" />
                        <span class="focus-input100"></span>
                    </div>


                    <div class="container">
                        <!--fever -->
                        <span class="txt1 p-b-11">您最近14天內是否有以下症狀：</span>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: left;">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="tql_fever" id="tql_fever_0" value="0" />無</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="tql_fever" id="tql_fever_1" value="1" />發燒（≧37.5°c）</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="tql_fever" id="tql_fever_2" value="2" />類似感冒症狀</label>
                            </div>
                        </div>
                        <!--O -->

                        <span class="txt1 p-b-11">職業別（Occupation）:</span>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: left;">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_Occupation" id="tql_Occupation_0" value="0" />
                                    <label class="form-check-label" for="tql_Occupation_0">醫事機構工作者</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_Occupation" id="tql_Occupation_1" value="1" />
                                    <label class="form-check-label" for="tql_Occupation_1">交通運輸者</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_Occupation" id="tql_Occupation_2" value="2" />
                                    <label class="form-check-label" for="tql_Occupation_2">旅遊業</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_Occupation" id="tql_Occupation_3" value="3" />
                                    <label class="form-check-label" for="tql_Occupation_3">旅館業</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_Occupation" id="tql_Occupation_4" value="4" />
                                    <label class="form-check-label" for="tql_Occupation_4">航空服務業</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_Occupation" id="tql_Occupation_5" value="5" />
                                    <label class="form-check-label" for="tql_Occupation_5">其他:</label>
                                    <input type="text" class="form-control" name="tql_Occupation_Contents" id="tql_Occupation_Contents" />
                                </div>
                            </div>
                        </div>

                        <!--C -->

                        <span class="txt1 p-b-11">您近期接觸及出入場所（Contact）:</span>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: left;">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_contact" id="tql_contact_0" value="0" />
                                    <label class="form-check-label" for="tql_contact_0">無</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_contact" id="tql_contact_1" value="5" />
                                    <label class="form-check-label" for="tql_contact_1">有接觸過新冠肺炎疑似或確診案例，時間：</label>
                                    <div class="input-group date" id="datetimepicker1">
                                        <input type="text" class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                                                    
                                    <label class="form-check-label" for="tql_contact_1">地點：</label>
                                    <input type="text" class="form-control" name="tql_tql_contact_Contents2" id="tql_tql_contact_Contents2" />

                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="tql_contact" id="tql_contact_2" value="2" />
                                    <label class="form-check-label" for="tql_Occupation_2">曾與發燒或類流感症狀的患者接觸</label>
                                </div>
                            </div>
                        </div>



                        <!--C -->

                        <span class="txt1 p-b-11">您最近一個月內群聚史（Cluster）：</span>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: left;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="tql_cluster" id="tql_cluster_0" value="0" />
                                        <label class="form-check-label" for="tql_contact_0">無</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="tql_cluster" id="tql_cluster_1" value="1" />
                                        <label class="form-check-label" for="tql_contact_0">家人有發燒或呼吸道症狀</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="tql_cluster" id="tql_cluster_2" value="2" />
                                        <label class="form-check-label" for="tql_contact_0">朋友/同事/同學有發燒或呼吸道症狀</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="tql_cluster" id="tql_cluster_3" value="3" />
                                        <label class="form-check-label" for="tql_Occupation_5">其他:</label>
                                        <input type="text" class="form-control" name="tql_cluster_Contents" id="tql_cluster_Contents" />
                                    </div>
                                </div>
                            
                        </div>
                    </div>

                    <div class="container-login100-form-btn">
                        <input class="login100-form-btn" type="button" value="送出" id="btnSubmit" data-toggle="modal" />
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">查詢結果</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 無法通關 -->
                    <div id="disagreeDiv" class="alert alert-warning text-center" role="alert" style="display: none;">
                        查詢日期：<script>document.write(new Date().toLocaleDateString());</script>

                        <span class="number">病歷號碼：<span id="r1_chartNo"></span>
                        </span>
                        <div class="Forbid">
                            <i class="fa fa-ban" aria-hidden="true"></i>
                            <h2 id="r1_idno"></h2>

                            <h2>
                                <span id="r1_tab">請至認證櫃台查詢</span>
                            </h2>

                            <p class="notice">
                                <span id="r1_mark"></span>
                            </p>

                            <p id="r1" class="history" style="display: none;">
                                <i class="fa fa-exclamation-circle" aria-hidden="true"></i><span id="r1_Contents"></span>
                            </p>

                        </div>
                    </div>

                    <!-- 允許通關 -->
                    <div id="agreeDiv" class="alert alert alert-success text-center" role="alert" style="display: none;">
                        查詢日期：<script>document.write(new Date().toLocaleDateString());</script>
                        <span class="number-2">病歷號碼：<span id="r2_chartNo"></span>
                        </span>

                        <div class="Allow">
                            <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                            <h2 id="r2_idno"></h2>
                            <h2>可快速通關
                            </h2>
                            <p class="notice-2"><span id="r2_mark"></span></p>

                            <%--                    <p class="history">
                            <i class="fa fa-exclamation-circle" aria-hidden="true"></i><span id="r2_Contents"></span>
                        </p>--%>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉視窗</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        function query() {
            $('#disagreeDiv').hide();
            $('#agreeDiv').hide();

            var idstr = removeAllSpace($('#idno').val());
            if (checkID(idstr)) {
                $.ajax({
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    url: "WebService.asmx/QueryIdno",
                    dataType: "json",
                    data: JSON.stringify({ Id: idstr }),
                    success: function (data) {
                        var ans = -1
                        var contents = ""
                        var chart_No = ""
                        var patient_Name = ""
                        var json = $.parseJSON(data.d);

                        $(json).each(function (i, val) {
                            $.each(val, function (k, v) {

                                switch (k) {
                                    case 'Record_No':
                                        ans = parseInt($.trim(v));
                                        break;
                                    case 'Contents':
                                        contents = $.trim(v);
                                        break;
                                    case 'Chart_No':
                                        chart_No = $.trim(v);
                                        break;
                                    case 'Patient_Name':
                                        patient_Name = plusXing($.trim(v), 1, 1);
                                        break;
                                    default:
                                }

                            });
                        });

                        $('#r1_idno').html(idstr + '  ' + patient_Name);
                        $('#r2_idno').html(idstr + '  ' + patient_Name);

                        $('#r1_chartNo').html(chart_No);
                        $('#r2_chartNo').html(chart_No);

                        $('#idno').val("");
                        if (ans == 0) {
                            //允許進入
                            $('#disagreeDiv').hide();
                            $('#agreeDiv').show();
                            $('#r2_mark').html("今日有看診");
                        } else {
                            //不允許進入 >0 有看診, 其他等於沒看診
                            if (ans > 0) {
                                $('#r1_tab').html("");
                                $('#r1_mark').html("今日有看診");
                                $('#r1_Contents').html(contents);
                                //$('#r1_Contents').html("【旅遊史參考】");
                                $('#r1').show();
                                $('#r1').addClass("history").removeClass("notice");


                            } else {
                                $('#r1_tab').html("請至認證櫃台查詢");
                                $('#r1_mark').html("無預約掛號");
                                $('#r1').hide();
                                $('#r1_Contents').html("");
                                $('#r1').addClass("notice").removeClass("history");
                            }
                            $('#disagreeDiv').show();
                            $('#agreeDiv').hide();
                        }
                    },
                    error: function (xhr, errorType, exception) {
                        //-- handle/show error
                        alert(xhr.responseText + " " + errorType + " " + exception + " " + responseText.ExceptionType + " " + responseText.StackTrace + " " + responseText.Message);
                    }
                });
            } else {
                alert('您的身分證字號/居留證號驗證錯誤!， 請重新輸入。')

            }
        }


        $(document).ready(function () {
            $('#idno').focus();

            $("#btnSubmit").click(function () {
                var idnos = $('#idno').val()
                if (idnos.length == 10) {
                    $("#exampleModal").modal("show");
                    query();
                }

                else {
                    $("#exampleModal").modal("hide");
                    alert('您的身分證字號/居留證號驗證錯誤!， 請重新輸入。')

                }
            });

            $('#datetimepicker1').datetimepicker({
                format: "YYYY/MM/DD",
                defaultDate: new Date()
                //,
               // locale: "zh-tw"
            });
        });



    </script>


    <div id="dropDownSelect1"></div>
   <%-- <script src="Resource/vendor/jquery/jquery-3.2.1.min.js"></script>--%>
    <script src="Resource/vendor/animsition/js/animsition.min.js"></script>
    <script src="Resource/vendor/bootstrap/js/popper.js"></script>
    <script src="Resource/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="Resource/vendor/select2/select2.min.js"></script>
    <script src="Resource/vendor/daterangepicker/moment.min.js"></script>
    <script src="Resource/vendor/daterangepicker/daterangepicker.js"></script>
    <script src="Resource/vendor/countdowntime/countdowntime.js"></script>
    <script src="Resource/js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/locale/zh-tw.js"></script>


</body>
</html>
