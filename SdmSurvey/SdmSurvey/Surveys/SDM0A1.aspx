<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SDM0A1.aspx.cs" Inherits="SdmSurvey.Surveys.SDM0A1" %>

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


    <!--[if lte IE 8]><script src="../Resource/assets/js/ie/respond.min.js"></script><![endif]-->
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
                            <p>呼吸衰竭拔管失敗後，我的選擇是什麼？</p>
                            <h3 style="font-size: 18pt; color: red; margin: 0px;">您好: </h3>
                            <p style="color: red;">
                                請使用此醫療決策輔助工具與您的醫療照護團隊討論您的選擇
                            </p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">前言</h3>
                            <p>當您的家人發生呼吸衰竭時，需接受插入氣管內管來維持有效的呼吸。如果病情好轉會接受呼吸器脫離訓練並拔除氣管內管，若拔管失敗後會遇到哪些狀況?又該如何選擇？以下提供詳盡說明讓您及家人了解，以做出最適合的醫療決策。</p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">適用對象/使用時機</h3>
                            <p>經醫師評估病情穩定，且經呼吸器脫離訓練後，已達能拔除氣管內管之病人適用。</p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">疾病介紹</h3>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>何謂呼吸衰竭？
                                    <ul style="list-style-type: none;">
                                        <p>呼吸衰竭是各種原因引起的肺通氣或氣體交換功能嚴重障礙，以致無法進行有效的呼吸，導致缺氧或可能伴隨二氧化碳滯留，從而引起一系列生理功能和代謝紊亂的臨床症候群。</p>
                                    </ul>
                                </li>
                            </ul>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>何謂拔管訓練？
                                    <ul style="list-style-type: none;">
                                        <p>經醫師評估並訂定拔管訓練計畫，在病人病情穩定，並且可以自行呼吸和清除痰液時，會漸進式訓練，最終移除氣管內管。</p>
                                    </ul>
                                </li>
                            </ul>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>何謂氣管內管拔管失敗？
                                    <ul style="list-style-type: none;">
                                        <p>移除氣管內管的動作稱為拔管。拔管失敗是指：移除氣管內管後，自發性呼吸失敗而必須在48小時內重新插管。</p>
                                    </ul>
                                </li>
                            </ul>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>何謂安寧緩和治療？
                                    <ul style="list-style-type: none;">
                                        <p>是由一組專業人員，用積極且全面的症狀緩解和愛心陪伴疾病末期病人，走完人生最後一程，提供身、心、靈的全面照顧，以舒適有尊嚴的醫療處置取代無效急救，協助病人緩和疼痛與不適，有尊嚴的、自然地走向生命的終點。</p>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">呼吸衰竭拔管失敗後，治療方式介紹</h3>
                            <ol>
                                <li>接受積極治療:若拔管失敗，選擇重插氣管內管。</li>
                                <li>接受積極治療:若拔管失敗，接受氣切手術。</li>
                                <li>接受積極治療:若拔管失敗，選擇非侵襲性呼吸器使用。</li>
                                <li>選擇安寧緩和治療:若拔管失敗，不再重新插管。</li>
                            </ol>
                        </div>
                    </article>
                    <form method="post" action="javascript:;" id="cad_form" onsubmit="doSubmit()">
                        <article class="style1">
                            <h2><span style="color: red; text-align: center;">病人偏好與價值觀評估</span></h2>
                            <div style="width: 100%;">
                                <ol>
                                    <li>在這次醫療過程中，病人是否曾經表達不願意再重新插入氣管內管？
                                        <br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_1" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_1" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_1" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>病人身邊是否曾經有親友接受過氣切手術？
                                        <br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_2" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_2" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_2" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>病人是否曾經說過本身可以接受氣切手術？<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_3" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_3" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_3" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>

                                    <li>病人是否曾經口頭或書面表達不願意接受氣切手術？<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_4" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_4" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_4" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>

                                    <li>病人身邊是否曾經有親友接受過安寧緩和治療？<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_5" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_5" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_5" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>

                                    <li>病人是否曾經說過本身願意接受安寧緩和治療？
                                        <br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_6" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_6" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_6" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>病人是否曾經口頭或書面表達不願意接受安寧緩和治療？
                                        <br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_7" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_7" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_7" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>病人是否曾經口頭或書面表達不接受心肺復甦術？<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_8" class="step4_question1" value="1" required="required" />是</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_8" class="step4_question1" value="2" required="required" />否</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="1_8" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>
                                </ol>
                            </div>
                        </article>

                        <article class="style1">
                            <h2><span style="color: red; text-align: center;">請透過以下四個步驟來幫助您做決定</span></h2>
                            <h3>步驟一：<span style="text-decoration: underline;">幫助您對積極治療與安寧緩和治療做進一步的認識與比較</span></h3>
                            <table style="width: 100%;">
                                <tr>
                                    <th rowspan="2" style="width: 10%;">選擇</th>
                                    <th colspan="3" style="width: 50%;">積極治療</th>
                                    <th style="width: 40%;">安寧緩和</th>
                                </tr>
                                <tr>
                                    <th>重插氣管內管</th>
                                    <th>非侵襲性呼吸器</th>
                                    <th>接受氣切手術</th>
                                    <th style="width: 40%;">拔管後不再插管</th>
                                </tr>
                                <tr>
                                    <td>結果</td>
                                    <td colspan="3" style="text-align: left; margin: 5px;">1.呼吸器長期依賴<br />
                                        2.呼吸器成功脫離

                                    </td>
                                    <td style="text-align: left; margin: 5px;">1.大部分病人死亡<br />
                                        2.一小部分病人呼吸器成功脫離
                                    </td>
                                </tr>
                                <tr>
                                    <td>成效與風險說明</td>
                                    <td colspan="3" style="text-align: left; margin: 5px;">

                                        <ul>
                                            <li>根據中央健保局資料顯示2013年全台呼吸器使用新增個案為168,217人/年，呼吸器依賴新增個案為33,777人/年。</li>
                                            <li>以新英格蘭雜誌1998年研究為例：<br />
                                                呼吸衰竭拔管失敗後重插管率為28%。</li>
                                            <li>以台灣2008年研究為例：<br />
                                                891位亞急性呼吸照護病房呼吸器使用之病人。
                                                <ul>
                                                    <li>呼吸器脫離成功佔40.2%，呼吸器使用平均天數為32.4天，接受氣切手術41.4%。</li>
                                                    <li>呼吸器脫離失敗佔59.8%， 呼吸器使用平均天數為45.5天 ，接受氣切手術58.6%。<br />
                                                        <img src="../Resource/images/RF_01.png" style="width: 40%; height: 40%;" /><br />
                                                    </li>
                                                </ul>
                                            </li>

                                            <li>以台灣2008年研究為例：呼吸器依賴個案(呼吸器≧14天患者)，追蹤6個月，顯示6個月內死亡率約50%。</li>
                                            <li>以台灣2015年研究為例：
                                                <ul>
                                                    <li>呼吸器依賴個案平均存活時間為16.4個月。</li>
                                                    <li>呼吸器使用5年之存活率為9.6%。<br />
                                                        <img src="../Resource/images/RF_02.png" style="width: 50%; height: 40%;" /><br />
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </td>
                                    <td style="text-align: left; margin: 5px;">
                                        <ul>
                                            <li>根據健保2008-2012年近五年統計，健保IC卡登錄安寧緩和註記累計人數由2008年22,548人提高為144,986人。</li>
                                            <li>拔管失敗，代表病人之呼吸及排痰功能不足以供應身體所需，因此若拔管失敗後不再使用左列治療，大部分病人將走向呼吸衰竭而死亡。</li>
                                            <li>拔管後不再插管的決定應根據病人意願或親屬的共同決定。並簽署預立安寧緩和醫療暨維生醫療抉擇意願書或不施行心肺復甦術暨維生醫療同意書</li>
                                            <li>根拔管後不再插管，並不代表放棄任何治療，呼吸治療團隊還是會為病人翻身、拍背、抽痰、灌食，並給予氧氣及必要的藥物治療以緩解症狀。需要時可以會診安寧共同照護團隊，以舒緩病人痛苦、提升生活品質為目標。</li>
                                            <li>依健保局資料統計：
                                                <ul>
                                                    <li>使用安寧住院療護個案，由89年的871人上升至97年的6,848人；使用人數占死亡人數比率亦自89年0.70%成長至97 年4.81%。</li>
                                                    <li>依2015年資料統計，不接受左列處置者，80%在數天至數周內因呼吸衰竭而死亡。</li>
                                                    <li>但仍有20%病人在移除呼吸器後，存活時間達一個月以上。</li>
                                                    <li>病人較快面臨生命終止。</li>
                                                </ul>
                                            </li>
                                        </ul>

                                    </td>
                                </tr>




                            </table>

                            <table style="width: 100%;">
                                <tr>
                                    <th rowspan="2" style="width: 10%;">選擇</th>
                                    <th colspan="3" style="width: 60%;">積極治療</th>
                                    <th style="width: 30%;">安寧緩和</th>
                                </tr>
                                <tr>
                                    <th style="width: 20%;">重插氣管內管</th>
                                    <th style="width: 20%;">非侵襲性呼吸器</th>
                                    <th style="width: 20%;">接受氣切手術</th>
                                    <th style="width: 30%;">拔管後不再插管</th>
                                </tr>
                                <tr>
                                    <td>優點</td>
                                    <td>1.無須手術。<br />
                                        2.無傷口的併發症。<br />
                                        3.需長期照護與安置。<br />
                                    </td>
                                    <td>1.無須手術。<br />
                                        2.可說話。<br />
                                        3.可由口進食。<br />
                                        4.需長期照護與安置。
                                    </td>
                                    <td>1.降低呼吸器肺炎風險。<br />
                                        2.病人有機會說話及吞嚥。<br />
                                        3.更換管路較容易。<br />
                                        4.呼吸功較小，且減少長期使用氣管插管之併發症。<br />
                                        5.需長期照護與安置。<br />
                                        6.病人較有機會脫離呼吸器，甚至穩定後可能關閉氣切造口。
                                    </td>
                                    <td>1.維持尊嚴。<br />
                                        2.積極緩解病人不適症狀。
                                    </td>
                                </tr>
                                <tr>
                                    <td>缺點</td>
                                    <td>1.較容易發生呼吸器相關肺炎。<br />
                                        2.嘴巴無法閉合。<br />
                                        3.較容易有口腔與喉嚨痛。<br />
                                        4.聲帶受損。
                                    </td>
                                    <td>1.清醒病患才可適用。<br />
                                        2.臉部皮膚疼痛及破損。<br />
                                        3.痰液不易排出。<br />
                                        4.容易因空氣打入胃部，造成腸胃漲氣，甚至因嘔吐造成吸入性肺炎機率高。
                                    </td>
                                    <td>1.需先重插管後手術。<br />
                                        2.術後暫時性傷口疼痛。<br />
                                        3.氣切傷口感染風險。
                                    </td>
                                    <td>1.呼吸作功增加，呼吸肌肉疲乏而導致呼吸衰竭。<br />
                                        2.需配合積極安寧緩和醫療，否則病人會因呼吸喘而受苦。<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>舒適度</td>
                                    <td>口腔黏膜與臉部皮膚破損，喉嚨腫脹疼痛。</td>
                                    <td>面罩緊貼臉部受壓，導致皮膚破損疼痛。</td>
                                    <td>術後幾日，傷口部位可能疼痛。</td>
                                    <td>沒有呼吸器輔助，使其呼吸作功增加，最後呼吸肌肉疲乏需醫師積極使用鎮靜止痛藥物可讓病人不受痛苦。</td>
                                </tr>
                                <tr>
                                    <td>痰液清除</td>
                                    <td>容易</td>
                                    <td>不易</td>
                                    <td>容易</td>
                                    <td>不易</td>
                                </tr>
                                <tr>
                                    <td>外觀</td>
                                    <td>不佳</td>
                                    <td>不佳</td>
                                    <td>佳</td>
                                    <td>佳</td>
                                </tr>
                                <tr>
                                    <td>照顧難易度 </td>
                                    <td>困難</td>
                                    <td>困難</td>
                                    <td>容易</td>
                                    <td>容易</td>
                                </tr>
                                <tr>
                                    <td>生活照護 </td>
                                    <td colspan="3">大部分須長期臥床與機構安置，活動受限制，日常生活仰賴他人照顧</td>
                                    <td>存活時，可以住院治療或居家安寧。</td>
                                </tr>
                                <tr>
                                    <td>經濟 </td>
                                    <td colspan="3">每月固定長期照護費用支出。</td>
                                    <td>經濟負擔小。</td>
                                </tr>
                                <tr>
                                    <td>生命期 </td>
                                    <td colspan="3">其中10%有機會脫離呼吸器，其餘的最終因合併症死亡，平均有七個月生命期。</td>
                                    <td>可能數天或數周，較快面臨死亡。</td>
                                </tr>
                            </table>
                        </article>



                        <article class="style1">
                            <h3>步驟二: <span style="text-decoration: underline;">呼吸衰竭拔管失敗後的選擇，您在意的因素有那些?</span></h3>
                            <table style="width: 100%; margin: 0 auto;">
                                <tr>
                                    <th>考量因素</th>
                                    <th>不重要</th>
                                    <th>較不重要</th>
                                    <th>普通</th>
                                    <th>重要</th>
                                    <th>很重要</th>
                                    <th>非常重要</th>


                                </tr>

                                <tr>
                                    <td style="width: 20%">疾病預後的影響</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_1" value="0" />0</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_1" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_1" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_1" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_1" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_1" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">病人舒適度</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_2" value="0" />0</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_2" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_2" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_2" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_2" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_2" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">病人本身意願</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_3" value="0" />0</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_3" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_3" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_3" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_3" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_3" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">病人生活品質</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_4" value="0" />0</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_4" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_4" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_4" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_4" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_4" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">後續照顧考量</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_5" value="0" />0</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_5" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_5" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_5" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_5" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_5" value="5" />5</td>
                                </tr>


                                <tr>
                                    <td style="width: 20%">經濟考量</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_6" value="0" />0</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_6" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_6" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_6" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_6" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="2_6" value="5" />5</td>
                                </tr>


                            </table>
                        </article>

                        <article class="style1">
                            <h3>步驟三: <span style="text-decoration: underline;">您對於家人若面臨呼吸衰竭，拔管失敗後的選擇，是否清楚優缺點？</span></h3>
                            <p><span style="text-decoration: underline; color: red;">積極治療</span></p>
                            <div style="width: 100%;">
                                <ol>
                                    <li>選擇重插氣管內管，病人會有口腔黏膜、臉部皮膚易破損，喉嚨腫脹疼痛等問題。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_1" class="step4_question1" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_1" class="step4_question1" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_1" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>

                                    <li>選擇非侵襲性呼吸器使用，病人臉部長時間受壓，容易導致臉部皮膚破損疼痛。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_2" class="step4_question2" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_2" class="step4_question2" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_2" class="step4_question2" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>選擇氣切手術，病人若病情許可，可以由口進食、說話。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_3" class="step4_question3" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_3" class="step4_question3" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_3" class="step4_question3" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>無論選擇重插氣管內管或氣切手術，都可能面臨長期呼吸器使用，長期照護費用的產生。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_4" class="step4_question4" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_4" class="step4_question4" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="31_4" class="step4_question4" value="3" required="required" />不確定</label>
                                    </li>
                                </ol>
                            </div>
                            <p><span style="text-decoration: underline; color: red;">安寧緩和治療</span></p>
                            <div style="width: 100%;">
                                <ol>
                                    <li>選擇拔管後不再重插氣管內管，必須面臨病人較快死亡的風險，但能維持基本尊嚴，減少痛苦。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_1" class="step4_question1" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_1" class="step4_question1" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_1" class="step4_question1" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>選擇安寧緩和治療，不代表放棄所有治療，也不等於安樂死。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_2" class="step4_question2" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_2" class="step4_question2" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_2" class="step4_question2" value="3" required="required" />不確定</label>
                                    </li>
                                    <li>無論選擇何種醫療，都有成功失敗的可能性。<br />
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_3" class="step4_question3" value="1" required="required" />對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_3" class="step4_question3" value="2" required="required" />不對</label>
                                        <label style="display: inline-block;">
                                            <input type="radio" name="32_3" class="step4_question3" value="3" required="required" />不確定</label>
                                    </li>
                                </ol>

                            </div>
                        </article>


                        <article class="style1">
                            <h3>步驟四: <span style="text-decoration: underline;">您已經做好決定了嗎?</span></h3>
                            
                            <label style="display: inline-block;">
                                <input type="radio" name="4_1" class="step5_question" value="1" required="required" />接受積極治療：若拔管失敗，選擇重插氣管內管。<br />
                                <input type="radio" name="4_1" class="step5_question" value="2" required="required" />接受積極治療：若拔管失敗，接受氣切手術。<br />
                                <input type="radio" name="4_1" class="step5_question" value="3" required="required" />接受積極治療：若拔管失敗，選擇非侵襲性呼吸器使用。<br />
                                <input type="radio" name="4_1" class="step5_question" value="4" required="required" />接受緩和治療：拔管後不再重插氣管內管。<br />
                                <input type="radio" name="4_1" class="step5_question" value="5" required="required" />我還有一些問題需要和主治醫師討論，問題：
                            </label>
                        
                            <textarea name="4_desc" style="text-align: left; border:1px blue double;" cols="50" rows="5" placeholder="輸入你想要寫的內容..."></textarea>
                    
                        </article>
                        <article class="style1">

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
                url: "SDM0A1_Handler.ashx",
                data: ({
                    q: $('#cad_form').serialize()
                }),
                success: function (e) {
                    window.location.href = '../Close.html';
                }
            });
        }
    </script>
</body>
</html>
