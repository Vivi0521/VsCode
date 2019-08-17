<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SDM231.aspx.cs" Inherits="SdmSurvey.Surveys.SDM231" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NCKUH SDM Survey</title>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="IE=7,9,10,11" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    
    <!--[if lte IE 8]><script src="../Resource/assets/js/ie/html5shiv.js"></script><![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="../Resource/assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="../Resource/assets/css/ie8.css" /><![endif]-->

    <link rel="stylesheet" href="../Resource/assets/css/main.css" />
    <%--<link rel="stylesheet" href="../Resource/assets/css/inputNumber.css" />--%>
    <script src="../Scripts/default.js"></script>
    <script src="../Resource/assets/js/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script src="../Resource/assets/js/skel.min.js"></script>
    <script src="../Resource/assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="../Resource/assets/js/ie../Respond.min.js"></script><![endif]-->

    <% 
        string Action = Request.Form["Action"];  //action GatData, SetData
        string SqGrid = Request.Form["SqGrid"];  //SqGrid
        string DocNo = Request.Form["MainDrNo"];  // doctor_code
        string Sn = Request.Form["OutpatientSn"];  //outpatient_sn
        string ChNo = Request.Form["ChartNo"]; // chart_no
        string ChNe = Request.Form["PatientName"]; //patient_name
        string OrderCode = Request.Form["QuestId"]; //quest_no,Order_Code
        string IpAddress = Request.Form["IpAddress"]; //ipAddress
    %>
    <style>
        hr.style13 {
            height: 10px;
            border: 0;
            box-shadow: 0 10px 10px -10px #8c8b8b inset;
        }



        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            width: 350px;
            margin: 60px auto;
            line-height: 0;
        }

            .container:after {
                content: "";
                display: block;
                clear: both;
            }

        .drag {
            width: 100%;
            height: 60px;
            float: left;
            margin: -8px 0;
        }

        ul li {
            list-style: none;
        }

        .innerdiv {
            padding: 10px;
            height: 100%;
        }

        .innerdiv2 {
            border: 1px solid #bdb9b9;
            background: #fff;
            height: 100%;
        }

        .move {
            width: 65px;
            height: 100%;
            background: pink;
            float: right;
            cursor: pointer;
        }

        .msg {
            display: inline-block;
            width: 250px;
            padding: 6px 6px 6px 12px;
            vertical-align: top;
        }
    </style>
    <script>
        $(function () {
            $(".sortable").sortable({
                handle: ".move",
                delay: 0,
                cursor: 'move',
                revert: true
                //,
                //stop: bttn.click(function (event) {
                //    //记录sort后的id顺序数组
                //    var arr = $(".sortable").sortable('toArray');
                //    console.log(arr);
            })

        })
    </script>
</head>
<body>


    <!-- Wrapper -->
    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Header -->
        <header id="header">
            <div class="inner">
                <!-- Logo -->
                <a href="javascript:void(0);" class="logo" style="width: 100%; text-align: center; margin: 0px;">
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
                            <p>
                                民國98年至102年之近5年健保住院資料分析發現，國人急性心肌梗塞標準化發生率每十萬人57.0人。且男性心肌梗塞的發生率是女性的2.8倍以上，罹患此疾病時表示供應心臟的血管已經開始阻塞，嚴重阻塞者會造成心臟功能的惡化，嚴重甚至心臟衰竭。
一旦確診後，有包括口服抗血小板藥物、經皮冠狀動脈氣球擴張術，冠狀動脈支架置放、冠狀動脈繞道手術的治療方式，至於要選擇何種方法，需經由醫師評估後會予適當建議。
                            </p>
                        </div>
                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">適用對象 / 適用狀況</h3>
                            <p>診斷為冠狀動脈阻塞疾病，需要與您討論治療(檢查)的方式。</p>
                        </div>

                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">疾病介紹</h3>
                            <p>
                                冠狀動脈是供應心臟本身氧氣及養份的血管，一般人的冠狀動脈主要有三條血管，此血管發生動脈粥樣硬化的病變時，血管會逐漸狹窄而阻塞，當血管阻塞缺血到達某種程度時，心臟肌肉細胞會開始壞死，此情形為心肌梗塞，我們稱這種狀況為<b>“冠狀動脈阻塞疾病-缺血性心臟病”或是“心絞痛”。</b>
                                <br>
                                此疾病的常見症狀有胸悶(如:緊繃沉重感)、胸痛、呼吸喘、心跳加速、頭暈、冒冷汗(皮膚蒼白)，嚴重心臟衰竭、心律不整，甚至有猝死情況。
                                <br>
                                另外也可能出現較不典型的上述症狀：如一肢或雙手臂、單或雙肩、背部、脖頸、頜(下巴)或胃部疼痛、麻或其他不適感。
                            </p>
                        </div>
                        <div style="width: 100%;position: relative; display: inline-block;">
                            <span><img src="../Resource/images/sdm231_1.jpg"/ style="position:relative;display:inline-block;width:300px;height:auto;"/></span>
                            <span><img src="../Resource/images/sdm231_2.jpg"/ style="position:relative;display:inline-block;width:300px;height:auto;float:right;"/></span>
                            <br />
                            <div>資料出處:<a href="https://health.tvbs.com.tw/medical/314259" target="_blank">https://health.tvbs.com.tw/medical/314259</a></div>
                            <div>資料出處:<a href="http://www.yidianzixun.com/article/0JG470U4?" target="_blank">http://www.yidianzixun.com/article/0JG470U4?</a></div>
                            
                        </div>


                        <div>
                            <h3 style="font-size: 18pt; margin: 0px;">治療方式介紹</h3>
                            <p>冠狀動脈疾病可能不會引起任何症狀，也有可能第一次出現症狀就是心肌梗塞，若出現症狀時，最常見的症狀之一是胸部不舒服。您可能會感到：</p>
                            <ul style="list-style-type: none;">
                                <li>(1) 調整生活習慣：戒菸、健康飲食、規則運動、維持適當體重、避免處在壓力情境。</li>
                                <li>(2) 藥物治療：目的為控制血壓、心跳、血脂、血糖。
                                    <ul style="list-style-type: none;">
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i>抗血小板凝集藥物(抑制血小板凝集降低血栓)。</li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i>抗心肌缺氧藥物(減少心臟負荷，減少心絞痛發生)。</li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i>血管擴張劑(增加冠狀動脈血流)。</li>
                                    </ul>
                                </li>
                                <li>(3)再灌流治療：醫師會安排侵入性的冠狀動脈攝影，如：心導管檢查，此檢查可明確知道血管狹窄情形(病兆的位置、嚴重度、數量、長度、鈣化、彎曲程度等)，可作為決定後續治療策略。</li>
                            </ul>
                            <p>此檢查方式可由手部或鼠蹊部動脈穿刺，傳送特製導管至冠狀動脈開口，注射顯影劑並配合X光照射，記錄冠狀動脈影像，若血管狹窄程度達70%，通常建議需要再灌流治療，包括<b>冠狀動脈介入術治療、冠狀動脈繞道手術。</b></p>
                            <p><b>*內科治療 - 冠狀動脈介入術治療：</b>由周邊動脈穿刺，傳送氣球導管至冠狀動脈，將狹窄阻塞的斑塊以氣球擴張或置放支架的方式，打通阻塞的病灶以恢復正常血流。</p>
                            <p><b>*外科治療 - 冠狀動脈繞道術：</b>手術採正中開胸方式，繞過被阻塞的冠狀動脈，開啟一條新的通道。血管選擇有手、腳或胸部取出一部分的動脈(內乳動脈、橈動脈)或靜脈(隱靜脈)的血管作為繞道使用。術後胸骨癒合復原大約需要三個月。</p>
                        </div>
                    </article>
                    <article class="style1">
                            <h2 style="font-size: 24pt; margin: 0px; text-align: center; font-weight: bold;">醫療選項簡介</h2>
                            <h2 style="font-size: 20pt; margin: 0px; text-align: center; font-weight: bold;color:darkblue">~請透過以下四個步驟來幫助您做決定~</h2>
                            <h3>步驟一、<span style="text-decoration: underline;">比較每一項選擇的優點、風險、副作用、費用、替代方案及治療方式</span></h3>
                        <table style="width: 100%">
                            <tr>
                               <th>&nbsp</th>
                                <th colspan="2" style="width: 15%; text-align: center;">心臟內科</th>
                                <th style="text-align: center;">心臟外科</th>
                            </tr>
                            <tr>
                                <th>&nbsp</th>
                                <th style="text-align: left;">藥物治療</th>
                                <th style="text-align: left;">金屬祼/塗藥支架置放手術+藥物治療</th>
                                <th style="text-align: left;">冠狀動脈繞道手術</th>
                            </tr>
                            <tr>
                                <td style="width:10%">示意圖</td>
                                <td style="width:25%">
                                    <div style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;">
                                    <span><img src="../Resource/images/sdm231_4.jpg"/ style="width:200px;height:200px;"/></span><br/>
                                    <span>資料出處:<a href="http://b303094004.pixnet.net/blog/post/161811423" target="_blank">http://b303094004.pixnet.net/blog/post/161811423</a></span>
                                    </div>
                                </td>
                                <td style="width:30%">
                                    <div style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;">
                                    <span><img src="../Resource/images/sdm231_5.jpg"/ style="width:200px;height:200px;"/></span><br/>
                                    <span>資料出處:<a href="https://kknews.cc/health/j6qx43q.html" target="_blank">https://kknews.cc/health/j6qx43q.html</a></span>
                                    </div>
                                </td>
                                <td style="width:35%">
                                    <div style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;">
                                    <span><img src="../Resource/images/sdm231_6.jpg"/ style="width:200px;height:200px;"/></span><br/>
                                    <span>資料出處 成大醫院心臟血管外科網站:<a href="Http://140.116.61.98" target="_blank">Http://140.116.61.98</a></span>  
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>適用對象</td>
                                <td>穩定型心絞痛</td>
                                <td>經心臟內科醫師判斷符合條件的患者。</td>
                                <td>
                                    <div>
                                        <ul style="list-style-type: none;">
                                            <li>-冠狀動脈三個主要血管皆有阻塞的情形</li>
                                            <li>-冠狀動脈有兩條以上主要血管阻塞，並伴有心臟功能低下者。</li>
                                            <li>-冠狀動脈的左主支幹有阻塞情形，有猝死危險者。</li>
                                            <li>-冠狀動脈阻塞疾病在經內科藥物治療或氣球擴張術之後仍有症狀或併發症者。</li>
                                            <li>-冠狀動脈阻塞疾病有併發症如心室中隔缺損，瓣膜閉鎖不全，心室瘤形成，心包膜填塞等。</li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>優點</td>
                                <td>不需住院</td>
                                <td>需住院 2~5 天，若從股動脈進行，術後可能需平躺 6 小時</td>
                                <td>需住院 7~14 天，病患大約一星期就大致可回復正常生活與出院。</td>
                            </tr>
                            <tr>
                                <td>缺點</td>
                                <td>若是阻塞嚴重，無法僅靠藥物改善</td>
                                <td>需要定期回診檢查，避免血管再塞（一年內每 100 個病人當中有 20~30 個病人會發生在狹窄）</td>
                                <td>胸骨的癒合大約需要三個月，所以短時期不要作擴胸運動直至三個月後</td>
                            </tr>
                            <tr>
                                <td>手術後併發症</td>
                                <td>無</td>
                                <td>可能有血管損傷、腦中風、心肌梗塞或死亡（每 1000 個病人，死亡率少於 5 人）</td>
                                <td>
                                    <div>
                                        <ul style="list-style-type: none;">
                                            <li>手術後併發症：依照每位病人風險值評估而有不同，並可能導致死亡。
                                              <ul style="list-style-type: none;">
                                                    <li>(1)手術後出血：可能再次手術止血。</li>
                                                    <li>(2)心肌衰竭及低心博出、急性心肌梗塞、心律不整等：以強心劑治療，可能使用主動脈內氣球幫浦，體外循環人工心肺器、心室輔助器、或心臟移植，死亡率為 48%。</li>
                                                    <li>(3)腦血管病變（即腦中風或腦出血）或低氧性腦病變：可能會有後遺症，半身不遂、或成為植物人。</li>
                                                    <li>(4)腎臟衰竭、呼吸衰竭或肺炎（可能使用人工呼吸器、作氣管切開術）、神經病變、精神異常、消化道病變、肝功能異常或衰竭、胰臟炎、內分泌系統病變。</li>
                                                    <li>(5)感染。</li>
                                                    <li>(6)其他偶發之病變或與手術無關之疾病手術後併發症等。</li>
                                                </ul>
                                             </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>經濟考量</td>
                                <td>門診費用</td>
                                <td>門診+住院費用(自行部分負擔 10%) 金屬裸支架，一支約 1409 元<br>塗藥支架扣除健保給付，一支約 55900元（價錢會浮動，以檢查當時定價為主）</td>
                                <td>門診+住院費用(自行部分負擔 10%)<br/>可能需負擔手術自費醫材(測溫導尿管、腦血氧飽和測定貼片、皮膚縫合釘大約4~10 </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <th colspan="4" style="text-align:center;">
                                    <p>無論選擇何種治療方式都需要改變生活型態及按時服藥</p>
                                </th>
                            </tr>
                            <tr>
                                <td>生活型態</td>
                                <td colspan="3" style="width:80%">盡量減少心臟病的危險因素，如戒菸，控制高血壓和糖尿病，及高膽固醇的改善，改變生活方式包括減少重量和油脂飲食，多做運動。</td>
                            </tr>
                            <tr>
                                <td>藥物治療
                                </td>
                                <td colspan="3" style="width:80%">藥物的治療對病患有特定的幫助抗血小板治療（如：阿司匹靈）常常用來幫助防止血凝塊的形成，可以減緩血管阻塞的程度，降血脂治療如他汀類藥物是用來降低膽固醇，可以延缓血管粥樣硬化的進展。其它如用來治療高血壓的血管緊張素轉換？抑製劑，可減少經繞道術後患者的各種心肌梗塞，缺血性腦中風等事件</td>
                            </tr>
                            <tr>
                                <td>未接受治療</td>
                                <td colspan="3" style="width:80%">冠狀動脈阻塞將造成心絞痛，甚至心肌梗塞，使心肌細胞產生不可逆的缺血性傷害，使得心臟功能受損以致生活品質及功能下降，並可能導致危及生命的心律不整，瓣膜功能不全心臟破裂等嚴重併發症。</td>
                            </tr>
                        </table>
                    </article>
                    <form method="post" action="javascript:;" id="cad_form" onsubmit="doSubmit()">
                        <article class="style1">
                            <h3>步驟二、<span style="text-decoration: underline;">您選擇的治療方式會在意的因素有什麼？請排序 1、2、3、4、5</span></h3>
                            <div style="position: relative; display: inline-block; border: 1px solid #C4C4C4; width: 50%;height:300px;">
                                
                                <span class="badge badge-secondary">在意因素：</span>(請點粉色框上下拖拉，最在意的排最上面!)
                                <ul class="sortable" id="sortable">
                                    <li id="q2_1" class="drag">
                                        <div class="innerdiv">
                                            <div class="innerdiv2">
                                                <div class="move"></div>
                                                <span class="msg">醫療費用</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li id="q2_2" class="drag">
                                        <div class="innerdiv">
                                            <div class="innerdiv2">
                                                <div class="move"></div>
                                                <span class="msg">較好生活品質</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li id="q2_3" class="drag">
                                        <div class="innerdiv">
                                            <div class="innerdiv2">
                                                <div class="move"></div>
                                                <span class="msg">治療的方便性</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li id="q2_4" class="drag">
                                        <div class="innerdiv">
                                            <div class="innerdiv2">
                                                <div class="move"></div>
                                                <span class="msg">住院的天數</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li id="q2_5" class="drag">
                                        <div class="innerdiv">
                                            <div class="innerdiv2">
                                                <div class="move"></div>
                                                <span class="msg">手術的風險與後遺症</span>
                                            </div>
                                        </div>
                                    </li>                                   
                                </ul>
                            </div>
                            <div class="ex" style="display: inline-block; position: relative; border: 1px solid #C4C4C4; width:45%;height:300px;">
                                 <span class="badge badge-secondary">其他您在意的因素請詳述：</span>
                                <textarea id="q2_reason" name="q2_reason" style="height:70%;border: 1px solid #E1E100;box-sizing: border-box;margin:10px 10px 50px 10px; width:95%;background: #F5FFFA;overflow: auto;"></textarea>
                            </div>
                        </article>
                        <article class="style1">
                            <h3>步驟三、<span style="text-decoration: underline;">對於上面提供的資訊，您是否已經了解呢？</span></h3>
                            <div style="width: 100%;">
                                 <p> 1. 接受冠狀動脈繞道手術,能有效降低高風險冠狀動脈阻塞患者的死亡率。  </p>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_1_1" name="q3_1" value="1" required="required"/>
                                        <label class="custom-control-label" for="q3_1_1">對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_1_2" name="q3_1" value="2" required="required"/>
                                        <label class="custom-control-label" for="q3_1_2">不對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_1_3" name="q3_1" value="3" required="required"/>
                                        <label class="custom-control-label" for="q3_1_3">不確定</label>
                                    </div>

                                <p>  2. 冠狀動脈繞道手術，手術可能引發的併發症,如腦中風、心肌梗塞或死亡的風險是很高的。</p>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_2_1" name="q3_2" value="1" required="required"/>
                                        <label class="custom-control-label" for="q3_2_1">對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_2_2" name="q3_2" value="2" required="required"/>
                                        <label class="custom-control-label" for="q3_2_2">不對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_2_3" name="q3_2" value="3" required="required"/>
                                        <label class="custom-control-label" for="q3_2_3">不確定</label>
                                    </div>
                               <p>  3. 接受冠狀動脈繞道手術後,可改善病人的生活品質。</p>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_3_1" name="q3_3" value="1" required="required"/>
                                        <label class="custom-control-label" for="q3_3_1">對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_3_2" name="q3_3" value="2" required="required"/>
                                        <label class="custom-control-label" for="q3_3_2">不對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_3_3" name="q3_3" value="3" required="required"/>
                                        <label class="custom-control-label" for="q3_3_3">不確定</label>
                                    </div>
                                 <p>  4. 接受冠狀動脈繞道手術後,就可以不用服用藥物。</p>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_4_1" name="q3_4" value="1" required="required"/>
                                        <label class="custom-control-label" for="q3_4_1">對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_4_2" name="q3_4" value="2" required="required"/>
                                        <label class="custom-control-label" for="q3_4_2">不對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_4_3" name="q3_4" value="3" required="required"/>
                                        <label class="custom-control-label" for="q3_4_3">不確定</label>
                                    </div>                          
                                  <p> 5. 定期服用藥物及生活型態改變是治療冠狀動脈疾病最重要的治療。</p>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_5_1" name="q3_5" value="1" required="required"/>
                                        <label class="custom-control-label" for="q3_5_1">對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_5_2" name="q3_5" value="2" required="required"/>
                                        <label class="custom-control-label" for="q3_5_2">不對</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="q3_5_3" name="q3_5" value="3" required="required"/>
                                        <label class="custom-control-label" for="q3_5_3">不確定</label>
                                    </div>                                
                                


                                <div style="width: 100%;" class="alert alert-primary" role="alert">
                                   <span class="badge badge-secondary">資料出處:</span>
                                    Singh, N., Gimpel, D., Parkinson, G., Conaglen, P., Meikle, F., Lin, Z., ... & El-Gamel, A. (2018). Assessment of the EuroSCORE II in a New Zealand Tertiary Centre. Heart, Lung and Circulation.
                                </div>
                            </div>
                        </article>
                        <article class="style1">
                            <h3>步驟四、<span style="text-decoration: underline;">您現在確認好治療方式了嗎？</span></h3>
                            <p>我已經確認好想要的治療方式，我決定選擇：（下列擇一）</p>
                            <div style="width: 100%;">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_1_1" name="q4_1" value="1" required="required"/>
                                    <label class="custom-control-label" for="q4_1_1">藥物治療+生活型態改變。</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_1_2" name="q4_1" value="2" required="required"/>
                                    <label class="custom-control-label" for="q4_1_2">心導管檢查，必要時放置裸支架+藥物治療。</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_1_3" name="q4_1" value="3" required="required"/>
                                    <label class="custom-control-label" for="q4_1_3">心導管檢查，必要時放置藥物支架+藥物治療。</label>
                                </div>

                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_1_4" name="q4_1" value="4" required="required"/>
                                    <label class="custom-control-label" for="q4_1_4">接受冠狀動脈繞道手術</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_1_5" name="q4_1" value="5" required="required"/>
                                    <label class="custom-control-label" for="q4_1_5">
                                        不進行任何治療，原因：
                                            <input type="text" id="q4_1_reason" name="q4_1_reason"  style="width: auto; display: inline-block;" size="50" />
                                    </label>
                                </div>
                            </div>

                            <p>我目前還無法決定</p>
                            <div style="width: 100%;">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_2_1" name="q4_2" value="1" required="required"/>
                                    <label class="custom-control-label" for="q4_2_1">我想要再與我的主治醫師討論我的決定。</label>
                                </div>

                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_2_2" name="q4_2" value="2" required="required"/>
                                    <label class="custom-control-label" for="q4_2_2">我想要再與其他人（包含配偶、家人、朋友或第二意見提供者…）討論我的決定。</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="q4_2_3" name="q4_2" value="3" required="required"/>
                                    <label class="custom-control-label" for="q4_2_3">
                                        對於以上治療方式，我想要再瞭解更多，我的問題有：
                                            <input type="text" id="q4_2_reason" name="q4_2_reason" style="width: auto; display: inline-block;" size="50" />
                                    </label>
                                </div>
                            </div>
                        </article>
                        
                        <article class="style1">
                              <div style="width: 100%;" class="alert alert-warning" role="alert">
                                   <span class="badge badge-secondary">NOTE:</span>
                                   完成以上評估後，您可以列印及攜帶此份結果與您的主治醫師討論。
                               </div>
                            <div>
                                <input type="hidden" id="h_action" name="h_action" value="<%=Action%>" />
                                <input type="hidden" id="h_ChNo" name="h_ChNo" value="<%=ChNo%>" />
                                <input type="hidden" id="h_Sn" name="h_Sn" value="<%=Sn%>" />
                                <input type="hidden" id="h_DocNo" name="h_DocNo" value="<%=DocNo%>" />
                                <input type="hidden" id="h_OrderCode" name="h_OrderCode" value="<%=OrderCode%>" />
                                <input type="hidden" id="h_ref" name="h_ref" value="" />
                                <input type="hidden" id="h_ChNe" name="h_ChNe" value="<%=ChNe%>" />
                                <input type="hidden" id="h_SqGrid" name="h_SqGrid" value="<%=SqGrid%>" />
                                <input type="hidden" id="h_IpAddress" name="h_IpAddress" value="<%=IpAddress%>" />
                            </div>
                                  <hr class="style13"/>
                            <div style="text-align: center; margin: 0 auto;">
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
        function doSubmit() {

            var result = 'q2=' + $("#sortable").sortable('toArray')+'&';
            result += $('#cad_form').serialize();
            alert(result);
            //$.ajax({
            //    type: "POST",
            //    url: "SDM231_Handler.ashx",
            //    data: ({
            //        q1: result
            //    }),
            //    success: function (e) {
            //        //if (e == "success") {
            //        //    console.log(e);
            //        //} else if (e == "error") {
            //        //    console.log(e);
            //        //}
            //        window.location.href = '../Close.html';
            //    }
            //});
        }


        function doSubmit() {
            var result = 'q2=' + $("#sortable").sortable('toArray') + '&';
            result += $('#cad_form').serialize();
            $.ajax({
                type: "POST",
                url: "SDM231_Handler.ashx?action=SetData",
                data: ({
                    q: result
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
        function getDate() {
            $.ajax({
                type: "POST",
                url: "SDM091_Handler.ashx?action=GetData",
                data: ({
                    SqGrid: $('#h_SqGrid').val()
                }),
                success: function (data) {
                    alert(data);
                }
            });



        }

        $(document).ready(function () {
            if ($('#h_action').val() == 'GetData') {
                //View 
                $('input[type=submit]').hide();
                $("input").attr("disabled", "disabled");
                //塞入資料
                getDate();
            } else {
                $('input[type=submit]').show();
            }




        });

    </script>
</body>
</html>

