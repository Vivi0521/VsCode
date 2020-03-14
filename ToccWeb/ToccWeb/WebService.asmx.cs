using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Xml;
using ToccWeb.Class;

namespace ToccWeb
{
    /// <summary>
    ///WebService 的摘要描述
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QueryIdno(String Id)
        {

            List<IdnoInfo> idnoInfos = new List<IdnoInfo>();
            wcf.BusinessLogicClient ws = new wcf.BusinessLogicClient();
            try
            {
                DataTable dt = new DataTable();
                DataTable dt2 = new DataTable();
                dt = ws.GetCloudTravelHistoryByID(Id);
                dt2 = ws.GetPatientData(Id);

                if (dt.Rows.Count > 0 && dt2.Rows.Count > 0)
                {

                    idnoInfos.Add(new IdnoInfo
                    {
                        Idno = Id,
                        Record_No = Convert.ToString(dt.Rows[0]["Record_No"]),
                        Chart_No = Convert.ToString(dt2.Rows[0]["Chart_No"]),
                        Patient_Name = Convert.ToString(dt2.Rows[0]["Patient_Name"]),
                        Contents = GetContents(Convert.ToString(dt.Rows[0]["Contents"])),
                        Memo = Convert.ToString(dt.Rows[0]["Memo"])
                    });

                }
                else {
                    idnoInfos.Add(new IdnoInfo
                    {
                        Idno = Id,
                        Record_No = "-1",
                        Chart_No = "未申請",
                        Patient_Name = "",
                        Contents = "",
                        Memo = ""
                    });
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally {
                // 永遠關閉用戶端。
                ws.Close();
            }
            return new JavaScriptSerializer().Serialize(idnoInfos);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QueryDou6Idno(String Id)
        {
            List<IdnoInfo> idnoInfos = new List<IdnoInfo>();
            wcfDou6.BusinessLogicClient ws = new wcfDou6.BusinessLogicClient();
            try
            {
                DataTable dt = new DataTable();
                DataTable dt2 = new DataTable();
                dt = ws.GetCloudTravelHistoryByID(Id);
                dt2 = ws.GetPatientData(Id);

                if (dt.Rows.Count > 0 && dt2.Rows.Count > 0)
                {

                    idnoInfos.Add(new IdnoInfo
                    {
                        Idno = Id,
                        Record_No = Convert.ToString(dt.Rows[0]["Record_No"]),
                        Chart_No = Convert.ToString(dt2.Rows[0]["Chart_No"]),
                        Patient_Name = Convert.ToString(dt2.Rows[0]["Patient_Name"]),
                        Contents = GetContents(Convert.ToString(dt.Rows[0]["Contents"])),
                        Memo = Convert.ToString(dt.Rows[0]["Memo"])
                    });

                }
                else {
                    idnoInfos.Add(new IdnoInfo
                    {
                        Idno = Id,
                        Record_No = "-1",
                        Chart_No = "未申請",
                        Patient_Name = "",
                        Contents = "",
                        Memo = ""
                    });


                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                // 永遠關閉用戶端。
                ws.Close();
            }
            return new JavaScriptSerializer().Serialize(idnoInfos);
        }



        //Get substring
        protected string GetContents(String str)
        {

            string result = "";
            if (str.Length > 0) {
                int idx = str.IndexOf("【旅遊史參考】"); 
                if (idx != -1)
                {
                    result = str.Substring(0, idx);
                }
                else {
                    result = "具旅遊史";
                }

               
            }
            return result; 
        }

    }
}


