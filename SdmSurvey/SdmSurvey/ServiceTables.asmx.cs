using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using SdmSurvey.Class;
using System.Collections.Generic;


namespace SdmSurvey
{
    /// <summary>
    ///ServiceTables 的摘要描述
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
    [System.Web.Script.Services.ScriptService]
    public class ServiceTables : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QueryQuestions()
        {

            List<Question> questions = new List<Question>();


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
                    using (SqlCommand command = new SqlCommand("select * From SDM_Question", connection))
                    {
                        //command.Parameters.AddWithValue("@SqGrid", SqGrid);
                        //
                        // Invoke ExecuteReader method.
                        //
                        SqlDataReader sqldr = command.ExecuteReader();

                        if (sqldr.HasRows)
                        {
                            while (sqldr.Read())
                            {
                                questions.Add(new Question
                                {
                                    QuestID = Convert.ToString(sqldr["Quest_ID"]),
                                    QuestName = Convert.ToString(sqldr["Quest_Name"]),
                                    ModifiedUser = Convert.ToString(sqldr["Modified_User"]),
                                    ModifiedTime = Convert.ToString(sqldr["Modified_Time"]),
                                    CreaterUser = Convert.ToString(sqldr["Creater_User"]),
                                    CreateTime = Convert.ToString(sqldr["Creater_User"]),
                                    Dc = Convert.ToString(sqldr["Dc"])
                                });
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return new JavaScriptSerializer().Serialize(questions);

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QueryMasters(String QuestId)
        {

            List<Master> masters = new List<Master>();


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
                    using (SqlCommand command = new SqlCommand("select * From SDM_Question_master where Quest_id=@QuestId", connection))
                    {
                        command.Parameters.AddWithValue("@QuestId", QuestId);
                        //
                        // Invoke ExecuteReader method.
                        //
                        SqlDataReader sqldr = command.ExecuteReader();

                        if (sqldr.HasRows)
                        {
                            while (sqldr.Read())
                            {
                                masters.Add(new Master
                                {
                                    SqGRID = Convert.ToString(sqldr["Sq_GRID"]),
                                    ChartNo = Convert.ToString(sqldr["Chart_No"]),
                                    OutpatientSn = Convert.ToString(sqldr["Outpatient_Sn"]),
                                    PatientName = Convert.ToString(sqldr["Patient_Name"]),
                                    MainDrNo = Convert.ToString(sqldr["Main_Dr_No"]),
                                    MainDrName = Convert.ToString(sqldr["Main_Dr_Name"]),
                                    QuestId = Convert.ToString(sqldr["Quest_Id"]),
                                    DrSignNo = Convert.ToString(sqldr["Dr_Sign_No"]),
                                    DrSignTime = $"{sqldr["Dr_Sign_Time"]:yyyy-MM-dd hh:mm:ss}",
                                    PatientSignNo = Convert.ToString(sqldr["Patient_Sign_No"]),
                                    PatientSignTime = $"{sqldr["Patient_Sign_Time"]:yyyy-MM-dd hh:mm:ss}",
                                    PatientRelationType = Convert.ToString(sqldr["Patient_Relation_Type"]),
                                    IpAdress = Convert.ToString(sqldr["Ip_Adress"]),
                                    ModifiedTime = $"{sqldr["Modified_Time"]:yyyy-MM-dd hh:mm:ss}",
                                    ModifiedUser = Convert.ToString(sqldr["Modified_User"]),
                                    CreaterUser = Convert.ToString(sqldr["Creater_User"]),
                                    CreateTime = $"{sqldr["Create_Time"]:yyyy-MM-dd hh:mm:ss}",
                                    Dc = Convert.ToString(sqldr["Dc"])

                                });
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return new JavaScriptSerializer().Serialize(masters);

        }
    }
}

