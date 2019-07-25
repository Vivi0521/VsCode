<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SDM231.aspx.cs" Inherits="SdmSurvey.Surveys.SDM231" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NCKUH SDM Survey</title>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="IE=7,9,10,11" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="../Resource/assets/js/ie/html5shiv.js"></script><![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="../Resource/assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="../Resource/assets/css/ie8.css" /><![endif]-->
    <link rel="stylesheet" href="../Resource/assets/css/main.css" />
    <script src="../Scripts/default.js"></script>
    <script src="../Resource/assets/js/jquery.min.js"></script>
    <script src="../Resource/assets/js/skel.min.js"></script>
    <script src="../Resource/assets/js/util.js"></script>


    <!--[if lte IE 8]><script src="../Resource/assets/js/ie../Respond.min.js"></script><![endif]-->
    <script src="../Resource/assets/js/main.js"></script>
    <script src="../Resource/assets/js/ie/jquery.mousewheel.js"></script>
    <script src="../Resource/assets/js/ie/jquery.inputNumber.js"></script>
    <link rel="stylesheet" href="../Resource/assets/css/inputNumber.css" />

    <% 
        string SqGrid = Request.Form["SqGrid"];  //outpatient_sn
        string DocNo = Request.Form["MainDrNo"];  // doctor_code
        string Sn = Request.Form["OutpatientSn"];  //outpatient_sn
        string ChNo = Request.Form["ChartNo"]; // chart_no
        string ChNe = Request.Form["PatientName"]; //patient_name
        string OrderCode = Request.Form["SqGrid"]; //quest_no,Order_Code
        string IpAddress = Request.Form["IpAddress"]; //ipAddress

    %>
</head>
<body>
    <script>

        $(function () {
            //alert("page_load first!");
            $('input.num').inputNumber();
            $('input.numNegative').inputNumber({
                positive: false //deny positive numbers
            });
            $('input.numPositive').inputNumber({
                negative: false //deny negative numbers
            });
        });

    </script>

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Header -->
        <header id="header">
            <div class="inner">
                <!-- Logo -->
                <a href="index.html" class="logo" style="width: 100%; text-align: center; margin: 0px;">
                    <span class="title">
                        <h1>醫病共享決策輔助表</h1>
                    </span>
                </a>
            </div>
        </header>

        <!-- Main -->
        <div id="main">
            <div class="inner" style="/*background-color: #c4d6ff; */">
                <span style="display: inline-block;">病歷號:
                            <input type="text" name="pid" id="pid" style="width: auto; display: inline-block;" size="15" value="<%=ChNo%>" /></span>
                <span style="display: inline-block;">稱呼: 
                            <input type="text" name="p_ChNe" id="p_ChNe" style="width: auto; display: inline-block;" size="15" value="<%=ChNe%>" /></span>
                <span style="display: inline-block;">關係:
                    <select name="p_ref" id="p_ref" style="width: 200px; display: inline-block;">
                        <option value="1">本人</option>
                        <option value="2">親屬</option>
                    </select></span>
                <section class="tiles">
                    <article class="style1">
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">主題</h3>
                            <p>關於冠狀動脈阻塞疾病的治療我有什麼選擇？</p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">前言</h3>
                            <p>民國98年至102年之近5年健保住院資料分析發現，國人急性心肌梗塞標準化發生率每十萬人57.0人。且男性心肌梗塞的發生率是女性的2.8倍以上，罹患此疾病時表示供應心臟的血管已經開始阻塞，嚴重阻塞者會造成心臟功能的惡化，嚴重甚至心臟衰竭。
一旦確診後，有包括口服抗血小板藥物、經皮冠狀動脈氣球擴張術，冠狀動脈支架置放、冠狀動脈繞道手術的治療方式，至於要選擇何種方法，需經由醫師評估後會予適當建議。</p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">適用對象 / 適用狀況</h3>
                            <p>診斷為冠狀動脈阻塞疾病，需要與您討論治療(檢查)的方式。</p>
                        </div>
                        <div style="width: 100%; position: relative; display: inline-block;">
                            <span class="dis_intro" style="width: 25%; position: relative; display: inline-block; font-weight: bold;">疾病介紹<br />
                                <br />
                            </span>
                            <span style="width: 24%; position: relative; display: inline-block; text-align: center;">國語<br />
                                <a href="https://sdm.patientsafety.mohw.gov.tw/Public/MediaInfo?sn=11&id=1170" target="_blank">
                                    <img src="../Resource/images/CAD_chinese.svg" style="width: 80%; height: auto;" /></a></span>
                            <span style="width: 24%; position: relative; display: inline-block; text-align: center;">台語<br />
                                <a href="https://sdm.patientsafety.mohw.gov.tw/Public/MediaInfo?sn=11&id=1169" target="_blank">
                                    <img src="../Resource/images/CAD_taiwanese.svg" style="width: 80%; height: auto;" /></a></span>
                            <span style="width: 24%; position: relative; display: inline-block; text-align: center;">客語<br />
                                <a href="https://sdm.patientsafety.mohw.gov.tw/Public/MediaInfo?sn=11&id=1168" target="_blank">
                                    <img src="../Resource/images/CAD_hakka.svg" style="width: 80%; height: auto;" /></a></span>
                        </div>
                        <div>
                            <h3 style="text-decoration: underline; font-size: 18pt; margin: 0px;">什麼是心絞痛(冠心症) ?</h3>
                            <p>冠心症 (coronary artery disease，CAD) 是一種因輸送血液和氧氣到心肌的血管有脂肪物質沉積，導致血管狹窄，臨床上會引起胸口悶痛，俗稱心絞痛。此疾病會增加您心臟病發作(心肌梗塞)和猝死的風險。</p>
                        </div>
                        <div>
                            <h3 style="text-decoration: underline; font-size: 18pt; margin: 0px;">冠心症會有那些症狀?</h3>
                            <p>冠狀動脈疾病可能不會引起任何症狀，也有可能第一次出現症狀就是心肌梗塞，若出現症狀時，最常見的症狀之一是胸部不舒服。您可能會感到：</p>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>胸口緊繃或沉重</li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>胸口出現擠壓感、壓迫感或燒灼感</li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>一隻(或雙)手臂、單(或雙)肩、背部、脖頸、頜(下巴)或胃部疼痛或不適，除了胸口不舒服外， 還可能有以下症狀：
                                    <ul style="list-style-type: none;">
                                        <li><i class="fa fa-square" aria-hidden="true"></i>呼吸短促</li>
                                        <li><i class="fa fa-square" aria-hidden="true"></i>噁心、嘔吐、打嗝</li>
                                        <li><i class="fa fa-square" aria-hidden="true"></i>冒冷汗、皮膚蒼白</li>
                                        <li><i class="fa fa-square" aria-hidden="true"></i>心臟不正常跳動</li>
                                        <li><i class="fa fa-square" aria-hidden="true"></i>感覺頭昏</li>
                                    </ul>
                                </li>
                            </ul>
                            <p>因為您的症狀以及醫師幫您做的檢查，顯示您極有可能患有冠心症，所以需要進一步討論治療方式。</p>
                        </div>
                    </article>
                    <article class="style1">
                        <div>
                            <h2 style="font-size: 22pt; margin: 0px; text-align: center; font-weight: bold;">治療方式介紹</h2>
                            <h3 style="text-decoration: underline; font-size: 18pt; margin: 0px;">改變生活型態</h3>
                            <p>
                                您可以做幾件事來降低您發生心肌梗塞及死亡的風險
                                <ul style="list-style-type: none;">
                                    <li><i class="fa fa-square" aria-hidden="true"></i>如果您有抽菸，請戒菸</li>
                                    <li><i class="fa fa-square" aria-hidden="true"></i>多食用蔬菜水果，減少食用肉類及含脂量高食物</li>
                                    <li><i class="fa fa-square" aria-hidden="true"></i>每星期盡量天天都有走路或運動</li>
                                    <li><i class="fa fa-square" aria-hidden="true"></i>如果身體過重，請減重</li>
                                </ul>
                            </p>
                        </div>
                        <div>
                            <h3 style="text-decoration: underline; font-size: 18pt; margin: 0px;">藥品</h3>
                            <p>
                                定期服用藥物及生活型態改變是治療穩定心絞痛最重要的治療。藥物可以降低您心肌梗塞的風險，並能讓您活得更久。但是您必須每天依照醫囑服用這些藥物。您的醫師可能開立的藥物包括：
                                <ul style="list-style-type: none;">
                                    <li><i class="fa fa-square" aria-hidden="true"></i>降低膽固醇的藥物，例如史他汀類 (statins)</li>
                                    <li><i class="fa fa-square" aria-hidden="true"></i>降低血壓的藥物</li>
                                    <li><i class="fa fa-square" aria-hidden="true"></i>阿斯匹靈(Aspirin)或其他藥物來協助預防血栓</li>
                                    <li><i class="fa fa-square" aria-hidden="true"></i>治療糖尿病的藥物</li>
                                </ul>
                            </p>
                            <p>如果您有因為冠心症而產生胸口不舒服，醫師也可能給您緩解的藥物，這些藥物包括”硝化甘油”，“乙型阻斷劑”或其他藥物。</p>
                        </div>
                        <div>
                            <h3 style="text-decoration: underline; font-size: 18pt; margin: 0px;">放置支架</h3>
                            <p>醫師會將末端有氣球的細塑膠管置入阻塞的血管，並用小氣球撐開阻塞的地方，接著會將一個細小的網狀支架留置在血管處以保持血管通暢，術後仍需定期服用藥物及保持良好生活型態。</p>
                        </div>
                        <div>
                            <h3 style="text-decoration: underline; font-size: 18pt; margin: 0px;">心臟血管繞道手術</h3>
                            <p>如果無法或不合適進行支架置放，醫師可能會建議此手術。外科醫師會自您的身體他處取一段血管然後用此血管接通已經阻塞的心臟血管。</p>
                        </div>
                        <div style="width: 100%; font-size: 18pt; text-align: center; border-top: 1px solid black; border-bottom: 1px solid black; padding: 10px; margin: 0px;">
                            <h3 style="margin: 0px;">請透過以下四個步驟來幫助您做決定</h3>
                        </div>
                    </article>
                    <article class="style1">
                        <h3>步驟一、<span style="text-decoration: underline;">比較每一項選擇的優點、風險、副作用、費用、替代方案</span></h3>
                        <table style="width: 100%;">
                            <tr>
                                <th rowspan="2" style="width: 15%;">治療方式<br />
                                    <br />
                                    考量因素</th>
                                <th>A</th>
                                <th>B</th>
                                <th>C</th>
                            </tr>
                            <tr>
                                <th>藥物治療+生活型態改變</th>
                                <th>心導管檢查，必要時放置金屬祼支架+藥物治療</th>
                                <th>心導管檢查，必要時放置塗藥支架+藥物治療</th>
                            </tr>
                            <tr>
                                <td>生活品質</td>
                                <td>一年內每100個病人，約有46個病人可緩解心絞痛，但運動量需限制。當心絞痛無法以藥物控制時，仍需選擇心導管支架治療。</td>
                                <td>一年內每100個病人，約有79個病人可減緩心絞痛;可恢復平日運動，但一年內每100個病人，有20-30個病人可能發生再狹窄。</td>
                                <td>一年內每100個病人，約有79個病人可減緩心絞痛;可恢復平日運動，一年內每100個病人，可能發生再狹窄少於5人。</td>
                            </tr>
                            <tr>
                                <td>經濟考量</td>
                                <td>門診費用</td>
                                <td>門診加住院費用(自行部份負擔10%，若不符合健保給付條件，另自費支架費用)。<br />
                                    <span style="background-color: gray; color: white;">**金屬裸支架<br />
                                        10%健保部分負擔，一支約1409元(以檢查當時定價為主)</span></td>
                                <td>門診加住院費用(自行部份負擔10%)，另自費支架費用，費用較裸支架高。<br />
                                    <span style="background-color: gray; color: white;">**塗藥支架扣除健保給付後，一支約 55900 元(以檢查當時定價為主)</span></td>
                            </tr>
                            <tr>

                                <td>病人舒適性</td>
                                <td>不需住院</td>
                                <td>需住院2至5天，若從股動脈進行，術後可能需平躺6小時。</td>
                                <td>與B方式相同</td>
                            </tr>
                            <tr>
                                <td>手術併發症</td>
                                <td>無</td>
                                <td>可能有血管損傷、腦中風、心肌梗塞或死亡(每1000個病人，死亡率少於5人)。</td>
                                <td>與B方式相同</td>
                            </tr>
                            <tr>
                                <td>追蹤期間死亡率和心肌梗塞</td>
                                <td>A與B方式無明顯差異。</td>
                                <td>A與B方式無明顯差異。</td>
                                <td>追蹤每100個病人，新一代的塗藥支架可比A方式減少25-48個病人發生。</td>
                            </tr>
                        </table>
                    </article>
                    <form method="post" action="javascript:;" id="cad_form" onsubmit="doSubmit()">
                        <article class="style1">
                            <h3>步驟二、<span style="text-decoration: underline;">您選擇治療方式會在意的因素有什麼?以及在意的程度</span></h3>
                            <p>請填寫下列考量因素優先順序( 1代表最優先，5代表最不優先 )</p>
                            <table style="width: 80%; margin: 0 auto;">
                                <tr>
                                    <th>考量因素</th>
                                    <th>優先順序</th>
                                </tr>
                                <tr>
                                    <td>醫療費用</td>
                                    <td>
                                        <input type="text" id="care1" name="care1" class="num" max="5" min="1" required="required" /></td>
                                </tr>
                                <tr>
                                    <td>較好生活品質</td>
                                    <td>
                                        <input type="text" id="care2" name="care2" class="num" max="5" min="1" required="required" /></td>
                                </tr>
                                <tr>
                                    <td>治療的方便性</td>
                                    <td>
                                        <input type="text" id="care3" name="care3" class="num" max="5" min="1" required="required" /></td>
                                </tr>
                                <tr>
                                    <td>住院的天數</td>
                                    <td>
                                        <input type="text" id="care4" name="care4" class="num" max="5" min="1" required="required" /></td>
                                </tr>
                                <tr>
                                    <td>手術的風險與後遺症</td>
                                    <td>
                                        <input type="text" id="care5" name="care5" class="num" max="5" min="1" required="required" /></td>
                                </tr>
                            </table>
                        </article>
                        <article class="style1">
                            <h3>步驟三、<span style="text-decoration: underline;">認識穩定性心絞痛(冠心病)的每年風險</span></h3>
                            <p>
                                根據美國心臟學院與美國心臟學會2012年發佈的穩定性心絞痛治療指引，每年發生心肌梗塞及死亡的風險，心絞痛患者可以依據心導管術前非侵犯性檢查 (心臟超音波，核醫心肌灌注檢查，運動心電圖，負荷性心超音波檢查及多切面電腦斷層等等) 的結果分為三類：
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>高度風險類：每年發生心肌梗塞及死亡的風險超過3%</li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>中度風險類：每年發生心肌梗塞及死亡的風險為1-3%</li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>低度風險類：每年發生心肌梗塞及死亡的風險小於1%</li>
                            </ul>
                            </p>
                            <p>
                                如果您的檢查結果屬於中高度風險類建議需要進行侵入性的心導管檢查，如果屬於低度風險類則可以考慮不需要進行心導管檢查。<br />
                                依據心導管術前非侵犯性檢查，您的醫師判斷您的您個人的每年風險為：
                            </p>
                            <div style="width: 100%; text-align: center;">
                                <label style="display: inline-block;">
                                    <input type="radio" id="risk1" name="risk" class="step3_question" value="1" required="required" />高度風險類</label>
                                <label style="display: inline-block;">
                                    <input type="radio" id="risk2" name="risk" class="step3_question" value="2" required="required" />中度風險類</label>
                                <label style="display: inline-block;">
                                    <input type="radio" id="risk3" name="risk" class="step3_question" value="3" required="required" />低度風險類</label>
                            </div>
                        </article>
                        <article class="style1">
                            <h3>步驟四、<span style="text-decoration: underline;">您對治療方式的認知有多少？</span></h3>
                            <div style="width: 100%;">
                                <p>
                                    1. 接受心導管檢查及支架手術，能有效降低高風險心絞痛患者的死亡率。<br />
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q1_1" name="q1" class="step4_question1" value="1" required="required" />對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q1_2" name="q1" class="step4_question1" value="2" required="required" />不對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q1_3" name="q1" class="step4_question1" value="3" required="required" />不確定</label>
                                </p>
                                <p>
                                    2. 心導管檢查及支架置放併發症，如腦中風、心肌梗塞或死亡的風險是很高的。<br />
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q2_1" name="q2" class="step4_question2" value="1" required="required" />對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q2_2" name="q2" class="step4_question2" value="2" required="required" />不對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q2_3" name="q2" class="step4_question2" value="3" required="required" />不確定</label>
                                </p>
                                <p>
                                    3. 接受心導管檢查及支架置放手術後，可改善病人的生活品質。<br />
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q3_1" name="q3" class="step4_question3" value="1" required="required" />對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q3_2" name="q3" class="step4_question3" value="2" required="required" />不對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q3_3" name="q3" class="step4_question3" value="3" required="required" />不確定</label>
                                </p>
                                <p>
                                    4. 接受心導管檢查及支架置放手術後，就可以不用服用藥物。<br />
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q4_1" name="q4" class="step4_question4" value="1" required="required" />對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q4_2" name="q4" class="step4_question4" value="2" required="required" />不對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q4_3" name="q4" class="step4_question4" value="3" required="required" />不確定</label>
                                </p>
                                <p>
                                    5. 定期服用藥物及生活型態改變是治療穩定心絞痛最重要的治療。<br />
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q5_1" name="q5" class="step4_question5" value="1" required="required" />對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q5_2" name="q5" class="step4_question5" value="2" required="required" />不對</label>
                                    <label style="display: inline-block;">
                                        <input type="radio" id="q5_3" name="q5" class="step4_question5" value="3" required="required" />不確定</label>
                                </p>
                            </div>
                        </article>
                        <article class="style1">
                            <h3>步驟五、<span style="text-decoration: underline;">您現在確認好治療方式了嗎？</span></h3>
                            <p>我已經確認好想要的治療方式，我決定選擇：（下列擇一）</p>
                            <label>
                                <input type="radio" id="ready_cure1" name="ready_cure" class="step5_question" value="1" required="required" />藥物治療+生活型態改變。</label>
                            <label>
                                <input type="radio" id="ready_cure2" name="ready_cure" class="step5_question" value="2" required="required" />心導管檢查，必要時放置裸支架+藥物治療。</label>
                            <label>
                                <input type="radio" id="ready_cure3" name="ready_cure" class="step5_question" value="3" required="required" />心導管檢查，必要時放置藥物支架+藥物治療。</label>
                            <label>
                                <input type="radio" id="ready_cure4" name="ready_cure" class="step5_question" value="4" required="required" />不進行任何治療，原因：<input type="text" id="ready_cure_4_reason" name="ready_cure_4_reason" class="step5_question" style="width: auto; display: inline-block;" size="50" /></label>
                            <p>我目前還無法決定</p>
                            <label>
                                <input type="radio" id="not_ready_cure1" name="not_ready_cure" class="step5_question" value="1" required="required" />我想要再與我的主治醫師討論我的決定。</label>
                            <label>
                                <input type="radio" id="not_ready_cure2" name="not_ready_cure" class="step5_question" value="2" required="required" />我想要再與其他人（包含配偶、家人、朋友或第二意見提供者…）討論我的決定。</label>
                            <label>
                                <input type="radio" id="not_ready_cure3" name="not_ready_cure" class="step5_question" value="3" required="required" />對於以上治療方式，我想要再瞭解更多，我的問題有：<input type="text" id="not_ready_cure_3_reason" name="not_ready_cure_3_reason" class="step5_question" style="width: auto; display: inline-block;" size="50" /></label>
                        </article>
                        <article class="style1">
                            <div style="position: relative; float: right;" class="footer_qr">
                                <!--
                            <p><a href="https://goo.gl/g5qnxy" target="_blank" style="float:right;"><img src="resource/images/feedback.svg" style="width:10vw;" /></a>
                                完成以上評估後，您可以攜帶此份結果與您的主治醫師討論。<br />
                                若您方便，請您撥空填寫滿意度調查，感謝您。</p>
                            -->
                            </div>
                            <div>
                                <input type="hidden" id="h_ChNo" name="h_ChNo" value="<%=ChNo%>" />
                                <input type="hidden" id="h_Sn" name="h_Sn" value="<%=Sn%>" />
                                <input type="hidden" id="h_DocNo" name="h_DocNo" value="<%=DocNo%>" />
                                <input type="hidden" id="h_OrderCode" name="h_OrderCode" value="<%=OrderCode%>" />
                                <input type="hidden" id="h_ref" name="h_ref" value="" />
                                <input type="hidden" id="h_ChNe" name="h_ChNe" value="<%=ChNe%>" />
                                <input type="hidden" id="h_SqGrid" name="h_SqGrid" value="<%=SqGrid%>" />
                                <input type="hidden" id="h_IpAddress" name="h_IpAddress" value="<%=IpAddress%>" />
                            </div>
                            <div style="text-align: center; margin: 0 auto;">
                                <hr />
                                <!--<a href="javascript:;" class="btn btn-primary" aria-label="送出" style="background: #2282e4;padding: 10px 30px;border-radius: 10px;color: white;font-weight: bold;" onclick="doSubmit()">
                              送出
                            </a>-->
                                <input type="submit" style="background: #2282e4; padding: 0px 30px; border-radius: 10px; color: white !important; font-weight: bold;" value="送出" />
                            </div>
                        </article>
                    </form>
                </section>
            </div>
        </div>
    </div>

    <!-- Scripts -->


    <script>


        $("#inputNumber").on("keydown", function (event) {
            var event = event.which ? event.which : window.event.keyCode;
            if (event == 8 || event == 9 || event == 109 || event == 110 || (event >= 48 && event <= 57) || (event >= 96 && event <= 105)) {
                return true;
            } else {
                return false;
            }
        });

        $("#h_ref").val($('#p_ref option:selected').val());


        function doSubmit() {
            $.ajax({
                type: "POST",
                url: "SDM041_Handler.ashx",
                data: ({
                    q: $('#cad_form').serialize()
                }),
                success: function (e) {
                    //if (e == "success") {
                    //    console.log(e);
                    //} else if (e == "error") {
                    //    console.log(e);
                    //}
                    window.location.href = '../Close.html';
                }
            });
        }
    </script>
</body>
</html>

