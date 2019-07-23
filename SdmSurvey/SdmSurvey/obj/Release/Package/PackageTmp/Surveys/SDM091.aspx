<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SDM091.aspx.cs" Inherits="SdmSurvey.Surveys.SDM091" %>

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
                            <p>當我得到尿毒症時，我該選擇哪種治療?</p>
                            <h3 style="font-size: 18pt; color: red; margin: 0px;">您好: </h3>
                            <p style="color: red;">
                                當您拿到這份輔助評估表時，代表您已加入醫療決策團隊的一員。我們希望提供您充分的資訊並協助您了解自己的需求，以使您能得到最適切而令您滿意的醫療服務。</span>
                            </p>
                        </div>
                        <h2><span style="text-decoration: underline; color: red; text-align: center;">末期腎病「醫病共同決策之透析模式選擇」輔助評估表</span></h2>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">前言</h3>
                            <p>「尿毒症」患者需要選擇一種適合的腎臟替代療法來取代腎臟的功能，以維持正常的生理狀態。因為透析治療是一種長期治療方式，因不同的透析治療模式會影響到個人生活型態、自我照顧及家人朋友支持方式等。當您在抉擇哪一種透析時，應先瞭解其治療方式對治療的影響。醫病共享決策透過醫療人員和病人共同討論現有的實證醫學資訊，提供病人所有可考量的選擇，一同做出符合其偏好的醫療決策，以提升您的生活與醫療品質。</p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">適用對象 / 適用狀況</h3>
                            <p>當腎臟受損超過三個月，導致其結構或功能無法恢復正常，稱為慢性腎臟病。慢性腎臟病一旦進展到第五期慢性腎臟病(腎絲球過濾率低於15 ml/min/1.73M2時)而在近期內會需要使用腎臟替代療法來治療時，即啟動「醫病共享決策之治療模式選擇」</p>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>適用對象 :
                                    <ul style="list-style-type: none;">
                                        <p>腎絲球過濾率低於15 ml/min/1.73M2，(一般而言大部會分會選擇在小於10以下)，年滿20歲(未滿20歲者，由醫療代理人參與)，可用語言溝通者。</p>
                                    </ul>
                                </li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>適用狀況 :
                                    <ul style="list-style-type: none;">
                                        <p>慢性腎臟病進展到末期的治療模式的選擇有四種：血液透析、腹膜透析、腎臟移植及安寧緩和醫療。</p>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">疾病介紹</h3>
                            <p>腎臟主要功能為藉著產生尿液而排除新陳代謝廢物及維持水分與電解質平衡。慢性腎臟病(CKD)是指腎臟的功能受損為不可逆、無法恢復的疾病，隨著病程進展最終進入末期腎臟疾病(End-stage renal disease)。當到達末期腎病時，廢物會累積在體內，也會有水分及電解質的不平衡，而產生尿毒症的症狀。此時就必須以腎臟替代療法來治療。</p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">治療方式介紹</h3>
                            <ul style="list-style-type: none;">
                                <li><i class="fa fa-square" aria-hidden="true"></i>血液透析:
                                    <ul style="list-style-type: none;">
                                        <p>將身體的血液引流出，在精密儀器控制下，將血液導流至血液透析機器，由一個半透膜製成的透析器（俗稱人工腎臟），代替人體腎臟的排泄功能、清除廢物和多餘水份，再流回血管內。因此，病人必須經由開刀建立一個血管通路，產生足夠的血流作透析治療，也因此才能有效的清除尿毒物質和水份，需開刀建立永久性的血管通路，手術通常是將病人自體的動脈與靜脈血管相連接，稱「自體動靜脈瘻管」，或以人工血管連結動靜脈，稱「人工動靜脈瘻管」。血液透析的病患，每一週必須到醫院接受2至3次治療，每次由醫護人員執行扎針（至少兩支針），一進一出，血液透析(俗稱洗腎或洗血)的過程每次需時4至6小時。短時間內可有快速且有效率的清除水分與毒素。</p>
                                    </ul>
                                </li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>腹膜透析:
                                    <ul style="list-style-type: none;">
                                        <p>腹膜透析是利用人體自己的腹膜當作半透膜(相當於血液透析的人工腎臟)，執行毒素與水份的移除方式，而這項工作病患可在家中自行操作，不須到洗腎中心由護理人員執行。執行腹膜透析治療前，須以外科手術在腹部植入一條腹膜透析導管，這根導管是提供透析液進出腹膜腔的通路，一般成人的腹腔可輕易的容納二公升的透析液。在透析液置留的過程中，血液中的廢物會通過腹膜上的微小血管進入透析液中，這些含有廢物的透析液在規律的間隔時間由腹腔中被引流出來，然後再注入另一袋新鮮的透析液，如此周而復始，每天按醫囑更換新的透析液，便可排除新陳代謝所產生的廢物。</p>
                                    </ul>
                                </li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>腎臟移植：
                                    <ul style="list-style-type: none;">
                                        <p>是在體內植入一個他人捐贈的健康腎臟，代替原有已損壞的腎臟，俗稱「換腎」。成功的腎移植可以使受腎者的腎功能恢復到似乎正常人一般。 因此病患整體的感覺及生活品質會更好。由於是異體移植，換腎後需長期服用抗排斥藥物。雖然腎臟移植是最理想的治療方式，但移植腎的來源不易，可由血親（五等親內）、配偶或腦死病人的器官捐贈而來。</p>
                                    </ul>
                                </li>
                                <li><i class="fa fa-square" aria-hidden="true"></i>安寧緩和醫療：
                                    <ul style="list-style-type: none;">
                                        <p>由一組跨各科專業的醫療團隊，以整個家庭為照顧單位，提供身、心、靈、社會的整體性照顧，提供全人全程醫療照顧計畫，緩解病人各種不適症狀，繼而尊重生命的尊嚴與臨終者的權利。2009年中央健保局將腎衰竭列入8大非癌末安寧療護疾病，腎衰竭病人若經評估有不可治癒的疾病，近期可能危及生命(如多重器官衰竭)、或即使接受治療後，仍然無法恢復可接受的生活品質時。治療病人可依自由意志，決定接受安寧緩和。</p>
                                    </ul>
                                </li>
                            </ul>
                        </div>


                    </article>

                    <form method="post" action="javascript:;" id="cad_form" onsubmit="doSubmit()">
                    <article class="style1">

                        <h2><span style="text-decoration: underline; color: red; text-align: center;">經護理人員解釋，您有初步的選擇嗎?</span></h2>
                        <table style="width: 80%; margin: 0 auto;">
                            <tr>
                                <th></th>
                                <th>不能接受</th>
                                <th>考慮中</th>
                                <th>尚能接受</th>

                            </tr>
                            <tr>
                                <td>1.血液透析</td>
                                <td>
                                    <input type="radio" name="Hemodialysis" value="1" /></td>
                                <td>
                                    <input type="radio" name="Hemodialysis" value="2" /></td>
                                <td>
                                    <input type="radio" name="Hemodialysis" value="3" /></td>
                            </tr>
                            <tr>
                                <td>2.腹膜透析</td>
                                <td>
                                    <input type="radio" name="Peritoneal" value="1" /></td>
                                <td>
                                    <input type="radio" name="Peritoneal" value="2" /></td>
                                <td>
                                    <input type="radio" name="Peritoneal" value="3" /></td>
                            </tr>
                            <tr>
                                <td>3.腎臟移植</td>
                                <td>
                                    <input type="radio" name="transplant" value="1" /></td>
                                <td>
                                    <input type="radio" name="transplant" value="2" /></td>
                                <td>
                                    <input type="radio" name="transplant" value="3" /></td>
                            </tr>
                            <tr>
                                <td>4.安寧緩和</td>
                                <td>
                                    <input type="radio" name="Peace" value="1" /></td>
                                <td>
                                    <input type="radio" name="Peace" value="2" /></td>
                                <td>
                                    <input type="radio" name="Peace" value="3" /></td>
                            </tr>

                        </table>
                    </article>

                    <article class="style1">
                        <h2><span style="color: red; text-align: center;">~接下來護理人員將引導您完成以下四個步驟~</span></h2>
                        <h3>步驟一、<span style="text-decoration: underline;">【治療模式比一比】:各類優缺點比較</span></h3>
                        <table style="width: 100%;">
                            <tr>
                                <th style="width: 15%;"></th>
                                <th>血液透析</th>
                                <th>腹膜透析</th>
                                <th>腎臟移植</th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>治療與執行者
                                    <br />
                                    <img src="../Resource/images/a.jpg" style="width: 80%; height: 70%;" />
                                </th>
                                <th>自己或家人
                                <br />
                                    <img src="../Resource/images/b.jpg" style="width: 80%; height: auto;" />
                                </th>
                                <th>專業移植團隊
                                  <br />
                                    <img src="../Resource/images/c.jpg" style="width: 80%; height: auto;" />
                                </th>
                            </tr>
                            <tr>
                                <td>扎針方式</td>
                                <td>每次至少兩針扎針</td>
                                <td>免扎針</td>
                                <td>免扎針</td>
                            </tr>
                            <tr>
                                <td>透析通路</td>
                                <td>動靜脈瘻管
                                  <br />
                                    <img src="../Resource/images/a_1.jpg" style="width: 80%; height: auto;" />
                                </td>
                                <td>腹膜透析導管
                                     <br />
                                    <img src="../Resource/images/b_1.jpg" style="width: 80%; height: 50%;" />
                                </td>
                                <td>移植健康腎臟至腹腔
                                     <br />
                                    <img src="../Resource/images/c_1.jpg" style="width: 80%; height: 50%;" />
                                </td>
                            </tr>
                            <tr>
                                <td>治療時間</td>
                                <td>須配合醫療院所的時間，每週2-3次固定接受平均4小時透析治療</td>
                                <td>在家換液，可自由安排或睡眠時執行每月須回診一次<img src="../Resource/images/b_2.jpg" style="width: 20%; height: 20%;" /></td>
                                <td>服用抗排斥藥，1-2月須回診一次<img src="../Resource/images/c_2.jpg" style="width: 20%; height: 20%;" /></td>
                            </tr>
                            <tr>
                                <td>執行地點</td>
                                <td>醫療院所血液透析室</td>
                                <td>乾淨獨立空間皆可</td>
                                <td>醫院器官移植門診</td>
                            </tr>
                            <tr>
                                <td>水份毒素清除情形</td>
                                <td>短時間內可有快速且有效率的清除</td>
                                <td>慢且持續進行毒素及水分清除</td>
                                <td>身體健康狀況到似乎正常人一般</td>
                            </tr>
                            <tr>
                                <td>治療時不適感</td>
                                <td>抽筋、頭暈、噁心、嘔吐、高/低血壓，口乾、疲倦、胃口不好</td>
                                <td>較不會有抽筋、低血壓等不舒服症狀發生，但少部分人會有脫水不適、疝氣、胸水等問題</td>
                                <td>須接受抗排斥藥治療，造成免疫力的下降會導致感染及癌症風險，部分人會有抗排斥藥物引起之不適</td>
                            </tr>
                            <tr>
                                <td>風險</td>
                                <td>血液及管路感染(感染愛滋、B肝及C肝，但風險低)</td>
                                <td>細菌感染、管路感染或腹膜炎</td>
                                <td>開刀手術、麻醉、感染風險</td>
                            </tr>
                            <tr>
                                <td>生存率</td>
                                <td>同腹膜透析</td>
                                <td>同血液透析</td>
                                <td>半年內有移植手術相關風險外，長期存活率較血液及腹膜透析好，其5年存活率達90％</td>
                            </tr>
                            <tr>
                                <td>飲食及水分</td>
                                <td>需較嚴格限制水份、含鉀食物及多補充高蛋白質</td>
                                <td>適度限制水份、醣類及多補充高蛋白質。含鉀食物攝取較不受限制</td>
                                <td>飲食及水分的攝取通常不需限制</td>
                            </tr>
                            <tr>
                                <td>殘餘腎功能</td>
                                <td>功能喪失速度較快</td>
                                <td>功能喪失較慢</td>
                                <td>身體健康狀況到接近正常人一般</td>
                            </tr>
                            <tr>
                                <td>生活品質</td>
                                <td>功時間較無彈性</td>
                                <td>日常生活、工作、旅遊能自由安排</td>
                                <td>不需再洗腎</td>
                            </tr>
                        </table>
                    </article>
                   
                        <article class="style1">
                            <h3>步驟二、<span style="text-decoration: underline;">【治療方式選擇】:會影響您選擇的因素?</span></h3>
                            <table style="width: 100%; margin: 0 auto;">
                                <tr>
                                    <th colspan="2"></th>
                                    <th colspan="6">非常在意------非常不在意</th>

                                </tr>
                                <tr>
                                    <td style="width: 5%">1</td>
                                    <td style="width: 45%">怕痛、害怕打針</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_1" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_1" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_1" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_1" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_1" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">2</td>
                                    <td style="width: 45%">擔心動靜脈手術，影響外觀</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_2" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_2" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_2" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_2" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_2" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">3</td>
                                    <td style="width: 45%">透析時間無法配合</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_3" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_3" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_3" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_3" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_3" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">4</td>
                                    <td style="width: 45%">治療時的不適感(抽筋、頭暈、噁心、嘔吐等)</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_4" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_4" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_4" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_4" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_4" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">5</td>
                                    <td style="width: 45%">可能風險(血液、管路感染如愛滋、BC肝)</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_5" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_5" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_5" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_5" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_5" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">6</td>
                                    <td style="width: 45%">透析造成血液流失而產生貧血</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_6" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_6" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_6" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_6" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_6" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">7</td>
                                    <td style="width: 45%">需嚴格限制水份、含鉀食物</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_7" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_7" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_7" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_7" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_7" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">8</td>
                                    <td style="width: 45%">時間無法自由安排，對工作生活及旅遊影響較大</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_8" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_8" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_8" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_8" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="21_8" value="5" />5</td>
                                </tr>
                            </table>

                            <p>(此項5、6題為反向題)</p>
                            <table style="width: 100%; margin: 0 auto;">
                                <tr>
                                    <th colspan="2"></th>
                                    <th colspan="6">非常在意------非常不在意</th>

                                </tr>
                                <tr>
                                    <td style="width: 5%">1</td>
                                    <td style="width: 45%">因個人自我照護能力不足而導致感染等併發症</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_1" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_1" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_1" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_1" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_1" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">2</td>
                                    <td style="width: 45%">擔心無法正確執行腹膜換液技術及操作(學習能力及操作能力不足)</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_2" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_2" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_2" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_2" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_2" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">3</td>
                                    <td style="width: 45%">缺少其他家屬親友的照顧及協助</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_3" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_3" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_3" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_3" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_3" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">4</td>
                                    <td style="width: 45%">擔心腹部植管，影響外觀</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_4" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_4" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_4" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_4" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_4" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">5</td>
                                    <td style="width: 45%">時間可自由安排(如上班、上課、旅遊)</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_5" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_5" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_5" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_5" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_5" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">6</td>
                                    <td style="width: 45%">飲食較不受限制</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_6" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_6" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_6" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_6" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_6" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">7</td>
                                    <td style="width: 45%">可能的風險(如腹膜炎)</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_7" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_7" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_7" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_7" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_7" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">8</td>
                                    <td style="width: 45%">無適當換液場所</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_8" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_8" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_8" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_8" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="22_8" value="5" />5</td>
                                </tr>
                            </table>

                            <p>無適合五等親可做親屬捐贈(更選此項者，表示短時間內無法做腎移植)</p>
                            <table style="width: 100%; margin: 0 auto;">
                                <tr>
                                    <th colspan="2"></th>
                                    <th colspan="6">非常在意------非常不在意</th>

                                </tr>
                                <tr>
                                    <td style="width: 5%">1</td>
                                    <td style="width: 45%">需長期等待器官捐贈的機會</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_1" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_1" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_1" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_1" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_1" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">2</td>
                                    <td style="width: 45%">需等長期至腎移植門診檢查與評估</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_2" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_2" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_2" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_2" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_2" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">3</td>
                                    <td style="width: 45%">害怕開刀手術及麻醉</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_3" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_3" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_3" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_3" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_3" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">4</td>
                                    <td style="width: 45%">擔心移植後發生排斥不適</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_4" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_4" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_4" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_4" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_4" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">5</td>
                                    <td style="width: 45%">需終身使用抗排斥藥</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_5" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_5" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_5" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_5" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_5" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">6</td>
                                    <td style="width: 45%">排斥藥可能造成免疫力的下降及導致一些癌症的產生</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_6" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_6" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_6" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_6" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_6" value="5" />5</td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">7</td>
                                    <td style="width: 45%">擔心術後發生感染或發炎</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_7" value="1" />1</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_7" value="2" />2</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_7" value="3" />3</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_7" value="4" />4</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="23_7" value="5" />5</td>
                                </tr>

                            </table>
                        </article>
                        <article class="style1">
                            <h3>步驟三、<span style="text-decoration: underline;">【治療模式接受度】:您對治療方式的接受度與認知有多少?</span></h3>
                            <p>您對治療方式的認知有多少？請試著回答下列問題:</p>
                            <table style="width: 80%; margin: 0 auto;">

                                <tr>
                                    <td style="width: 5%">1</td>
                                    <td style="width: 75%">兩種透析治療都必須要經手術建立透析通路，如腹膜透析導管、血液透析瘻管</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_1" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_1" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">2</td>
                                    <td style="width: 75%">兩種透析治療都必須注意水分控制，飲食上在蔬菜水果的限制腹膜透析較血液透析少</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_2" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_2" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">3</td>
                                    <td style="width: 75%">尿毒症病人的腎替代療法為腎臟移植或血液或腹膜透析，偏方與健康食品無法取代</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_3" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_3" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">4</td>
                                    <td style="width: 75%">血液透析病人較容易有血液流失的機會，貧血程度較嚴重</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_4" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_4" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">5</td>
                                    <td style="width: 75%">血液透析由醫護人員執行較安全，將自我健康照護的責任交給醫院即可</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_5" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_5" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">6</td>
                                    <td style="width: 75%">較能依照自己作息來調整治療的是腹膜透析，透析環境也相對有彈性</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_6" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_6" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">7</td>
                                    <td style="width: 75%">腹膜透析需每日執行換液、傷口換藥。血液透析要維持瘻管通暢，禁患肢治療與提重</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_7" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_7" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">8</td>
                                    <td style="width: 75%">腹膜透析治療是不需要打針的持續性透析，水分與毒素的變動較為平穩</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_8" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_8" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">9</td>
                                    <td style="width: 75%">接受腎臟移植後，可以改善生活品質</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_9" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_9" value="N" />否
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">10</td>
                                    <td style="width: 75%">腎臟移植後需要一輩子服用抗排斥藥</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_10" value="Y" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="3_10" value="N" />否
                                    </td>
                                </tr>
                            </table>

                        </article>
                        <article class="style1">
                            <h3>步驟四、<span style="text-decoration: underline;">【治療模式】 您現在確認好治療方式了嗎？</span></h3>
                            <p>(一).對治療模式的了解程度</p>
                            <table style="width: 80%; margin: 0 auto;">

                                <tr>
                                    <td style="width: 15%">1.知識</td>
                                    <td style="width: 50%">你清楚每一項治療的風險與優勢嗎?</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_1" value="1" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_1" value="2" />否
                                    </td>
                                    <td style="width: 25%">
                                        <input type="radio" name="41_1" value="3" />不確定
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">2.價值</td>
                                    <td style="width: 50%">對你清楚每一項治療的風險與優勢，哪一個對你最重要?</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_2" value="1" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_2" value="2" />否
                                    </td>
                                    <td style="width: 25%">
                                        <input type="radio" name="41_2" value="3" />不確定
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">3.支持</td>
                                    <td style="width: 50%">你有足夠的支持系統來支持你的決策嗎?</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_3" value="1" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_3" value="2" />否
                                    </td>
                                    <td style="width: 25%">
                                        <input type="radio" name="41_3" value="3" />不確定
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%">4.確定</td>
                                    <td style="width: 50%">你確定這個選擇對你來說是最好的嗎?</td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_4" value="1" />是
                                    </td>
                                    <td style="width: 10%">
                                        <input type="radio" name="41_4" value="2" />否
                                    </td>
                                    <td style="width: 25%">
                                        <input type="radio" name="41_4" value="3" />不確定
                                    </td>
                                </tr>
                            </table>
                            <p>(二) 您能夠下決定了嗎？</p>
                            <label>
                                <input type="radio" name="42_1" class="step5_question" value="1" required="required" />我想再和家人或朋友討論並思考一下</label>
                            <label>
                                <input type="radio" name="42_1" class="step5_question" value="2" required="required" />我有一些問題想再詢問醫師。我的問題</label>
                            <label>
                                <input type="radio" name="42_1" class="step5_question" value="3" required="required" />是的，我已經能夠決定了</label>
                            <p>(三) 確認選擇</p>
                            <table style="width: 80%; margin: 0 auto;">

                                <tr>
                                    <td style="width: 50%">
                                        <input type="radio" name="43_1" class="step5_question" value="1" required="required" />血液透析，不等待換腎</td>
                                    <td style="width: 50%">
                                        <input type="radio" name="43_1" class="step5_question" value="2" required="required" />血液透析，等待換腎</td>

                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        <input type="radio" name="43_1" class="step5_question" value="3" required="required" />腹膜透析，不等待換腎</td>
                                    <td style="width: 50%">
                                        <input type="radio" name="43_1" class="step5_question" value="4" required="required" />腹膜透析，等待換腎</td>

                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        <input type="radio" name="43_1" class="step5_question" value="5" required="required" />安寧緩和</td>
                                    <td style="width: 50%"></td>

                                </tr>
                            </table>

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
                url: "SDM091_Handler.ashx",
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
