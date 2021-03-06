﻿using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using SdmSurvey.Class;
using SdmSurvey.ServiceReference;
using System.Net;
using SsoUtil;
using System.Xml;

namespace SdmSurvey
{

    /// <summary>
    ///Service1 的摘要描述
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
    [System.Web.Script.Services.ScriptService]
    public class ServicePortal : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Routing(String SqGrid)
        {
            Master ms = new Master();



            string str_conn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
            try
            {
                // Create new SqlConnection object.
                //
                using (SqlConnection connection = new SqlConnection(str_conn))
                {
                    connection.Open();
                    //
                    // Create new SqlCommand object.
                    //
                    using (SqlCommand command = new SqlCommand("select * From SDM_Question_master where SQ_GRID=@SqGrid", connection))
                    {
                        command.Parameters.AddWithValue("@SqGrid", SqGrid);
                        //
                        // Invoke ExecuteReader method.
                        //
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            ms.SqGrid = Convert.ToString(reader["SQ_GRID"]);
                            ms.ChartNo = Convert.ToString(reader["Chart_No"]);
                            ms.OutpatientSn = Convert.ToString(reader["Outpatient_Sn"]);
                            ms.PatientName = Convert.ToString(reader["Patient_Name"]);
                            ms.MainDrNo = Convert.ToString(reader["Main_Dr_No"]);
                            ms.QuestId = Convert.ToString(reader["Quest_ID"]);
                            ms.IpAddress = GetIPAddress();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return new JavaScriptSerializer().Serialize(ms);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string ProdRouting(String SqGrid, String ChartNo)
        {
            Master ms = new Master();


            string str_conn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
            try
            {
                // Create new SqlConnection object.
                //
                using (SqlConnection connection = new SqlConnection(str_conn))
                {
                    connection.Open();
                    //
                    // Create new SqlCommand object.
                    //
                    using (SqlCommand command = new SqlCommand("select * From SDM_Question_master where SQ_GRID=@SqGrid and Chart_No=@ChartNo ", connection))
                    {
                        command.Parameters.AddWithValue("@SqGrid", SqGrid);
                        command.Parameters.AddWithValue("@ChartNo", ChartNo);
                        //
                        // Invoke ExecuteReader method.
                        //
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            ms.SqGrid = Convert.ToString(reader["SQ_GRID"]);
                            ms.ChartNo = Convert.ToString(reader["Chart_No"]);
                            ms.OutpatientSn = Convert.ToString(reader["Outpatient_Sn"]);
                            ms.PatientName = Convert.ToString(reader["Patient_Name"]);
                            ms.MainDrNo= Convert.ToString(reader["Main_Dr_No"]);
                            ms.QuestId = Convert.ToString(reader["Quest_ID"]);
                            ms.IpAddress = GetIPAddress();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return new JavaScriptSerializer().Serialize(ms);
        }



        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public int CreateSDMQ(Master input)

        //{
        //    int key = 0;
        //    UserClient client = new UserClient();
        //    // 使用 'client' 變數來呼叫服務上的作業。
        //    key = client.createSDMQ(input.ChartNo, input.OutpatientSn, input.MainDrNo, input.QuestId);
        //    // 永遠關閉用戶端。
        //    client.Close();
        //    return key;
        //}









        //[WebMethod]
        [WebMethod(EnableSession =true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Verification(UserInfo userInfo) {
            LogHelper lh = new LogHelper();
           

            // 檢核SSO
            WinSsoUtil sso = new WinSsoUtil();
            string info = sso.GetUserInfo("http://hisweb.hosp.ncku/WebSiteSSO", userInfo.UserID, userInfo.Password);

            //取得根節點內的子節點
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(info);

            XmlNode activate = doc.SelectSingleNode("nckuh-info/ad-user/user-activate");

            if (activate == null) return "N";

            if (!bool.Parse(activate.InnerText))
            {
                XmlNode ErrMessage = doc.SelectSingleNode("nckuh-info/ad-user/user-ErrMessage");
                lh.WriteLog("[Verification empId]", ErrMessage.InnerText);
                return "N";
            }

            //註記為登入狀態
            Session["isLogined"] = "Y";
            Session["userName"] = doc.SelectSingleNode("nckuh-info/ad-user/user-name").InnerText;
            Session["userId"] = doc.SelectSingleNode("//user-id").InnerText;



            return "Y";
        }



        //Get Ip Address
        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }
            return context.Request.ServerVariables["REMOTE_ADDR"];
        }



        //以下Session的使用
        [WebMethod(enableSession: true)]
        public string RemoveSession()
        {

            Session.Remove("test");
            return "移除Session : 測試Session裡的值為: " + Session["test"];
        }
        [WebMethod(enableSession: true)]
        public string ShowSession()
        {
            String id = (String)Session["userId"];
            if (id == null)
                id = "0";
            String name = (String)Session["userName"];
            if (name == null)
                name = "GUEST";
            return id+"_"+name;
        }

        [WebMethod(enableSession: true)]
        public string SetSession()
        {
           Session["test"] = "helloworld";
            return "設定Session成功!";
        }

    }


}
