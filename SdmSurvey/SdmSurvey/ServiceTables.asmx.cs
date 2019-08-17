using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using SdmSurvey.Class;
using System.Collections.Generic;
using System.Data;
using Newtonsoft.Json;
using System.Text;
using SdmSurvey.Cs;

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

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT Quest_ID, \n");
            sql.Append("       Quest_Name, \n");
            sql.Append("       (SELECT Count(*) \n");
            sql.Append("        FROM   SDM_Question_master \n");
            sql.Append("        WHERE  Quest_ID = s.Quest_ID) Open_count, \n");
            sql.Append("       (SELECT Count(Patient_Sign_Time) \n");
            sql.Append("        FROM   SDM_Question_master \n");
            sql.Append("        WHERE  Quest_ID = s.Quest_ID) Write_count, \n");
            sql.Append("       Modified_Time, \n");
            sql.Append("       Modified_User, \n");
            sql.Append("       Creater_User, \n");
            sql.Append("       Create_Time, \n");
            sql.Append("       Dc, \n");
            sql.Append("       Status, \n");
            sql.Append("       effect_date \n");
            sql.Append("FROM   SDM_Question s \n");
            sql.Append("ORDER  BY Quest_ID");

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
                    using (SqlCommand command = new SqlCommand(sql.ToString(), connection))
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
                                    Dc = Convert.ToString(sqldr["Dc"]),
                                    OpenCount = Convert.ToInt32(sqldr["Open_count"]),
                                    WriteCount = Convert.ToInt32(sqldr["Write_count"]),
                                    EffectDate = Convert.ToString(sqldr["Effect_date"]),
                                    Status = Convert.ToString(sqldr["Status"]),
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

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public string QueryMasters(String QuestId)
        //{

        //    List<Master> masters = new List<Master>();


        //    StringBuilder sqlstr = new StringBuilder();
        //    sqlstr.Append("SELECT Chart_No, \n");
        //    sqlstr.Append("       Patient_Name, \n");
        //    sqlstr.Append("       Main_Dr_No + '_' + Main_Dr_Name dr_info, \n");
        //    sqlstr.Append("       Outpatient_Sn, \n");
        //    sqlstr.Append("       Count(*)                        create_count, \n");
        //    sqlstr.Append("       Count(Patient_Sign_Time)        write_count, \n");
        //    sqlstr.Append("       Min(Create_Time)                first_create_time, \n");
        //    sqlstr.Append("       Max(Patient_Sign_Time)          current_write_date \n");
        //    sqlstr.Append("FROM   [OPDDB].[dbo].[SDM_Question_master] \n");
        //    sqlstr.Append("WHERE  Quest_ID = @QuestId \n");
        //    sqlstr.Append("GROUP  BY Chart_No, \n");
        //    sqlstr.Append("          Patient_Name, \n");
        //    sqlstr.Append("          Main_Dr_No, \n");
        //    sqlstr.Append("          Main_Dr_Name, \n");
        //    sqlstr.Append("          Outpatient_Sn");

        //    string str_conn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
        //    try
        //    {
        //        // Create new SqlConnection object.
        //        //
        //        using (SqlConnection connection = new SqlConnection(str_conn))
        //        {
        //            connection.Open();
        //            //
        //            // Create new SqlCommand object.
        //            //
        //            using (SqlCommand command = new SqlCommand(sqlstr.ToString(), connection))
        //            {
        //                command.Parameters.AddWithValue("@QuestId", QuestId);
        //                //
        //                // Invoke ExecuteReader method.
        //                //
        //                SqlDataReader sqldr = command.ExecuteReader();

        //                if (sqldr.HasRows)
        //                {
        //                    while (sqldr.Read())
        //                    {
        //                        masters.Add(new Master
        //                        {
        //                            SqGRID = Convert.ToString(sqldr["Sq_GRID"]),
        //                            ChartNo = Convert.ToString(sqldr["Chart_No"]),
        //                            OutpatientSn = Convert.ToString(sqldr["Outpatient_Sn"]),
        //                            PatientName = Convert.ToString(sqldr["Patient_Name"]),
        //                            MainDrNo = Convert.ToString(sqldr["Main_Dr_No"]),
        //                            MainDrName = Convert.ToString(sqldr["Main_Dr_Name"]),
        //                            QuestId = Convert.ToString(sqldr["Quest_Id"]),
        //                            DrSignNo = Convert.ToString(sqldr["Dr_Sign_No"]),
        //                            DrSignTime = $"{sqldr["Dr_Sign_Time"]:yyyy-MM-dd hh:mm:ss}",
        //                            PatientSignNo = Convert.ToString(sqldr["Patient_Sign_No"]),
        //                            PatientSignTime = $"{sqldr["Patient_Sign_Time"]:yyyy-MM-dd hh:mm:ss}",
        //                            PatientRelationType = Convert.ToString(sqldr["Patient_Relation_Type"]),
        //                            IpAdress = Convert.ToString(sqldr["Ip_Adress"]),
        //                            ModifiedTime = $"{sqldr["Modified_Time"]:yyyy-MM-dd hh:mm:ss}",
        //                            ModifiedUser = Convert.ToString(sqldr["Modified_User"]),
        //                            CreaterUser = Convert.ToString(sqldr["Creater_User"]),
        //                            CreateTime = $"{sqldr["Create_Time"]:yyyy-MM-dd hh:mm:ss}",
        //                            Dc = Convert.ToString(sqldr["Dc"])

        //                        });
        //                    }
        //                }
        //            }
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //    return new JavaScriptSerializer().Serialize(masters);

        //}


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<object> QuerCase(String QuestId)
        {
            List<object> iData = new List<object>();
            string datas = "[]";

            //sqlQuery 
            StringBuilder strQuery = new StringBuilder();
            strQuery.Append("SELECT chart_No, \n");
            strQuery.Append("       patient_Name, \n");
            strQuery.Append("       main_Dr_No + '_' + main_Dr_Name dr_info, \n");
            strQuery.Append("       outpatient_Sn, \n");
            strQuery.Append("       Count(*)                        create_count, \n");
            strQuery.Append("       Count(Patient_Sign_Time)        write_count, \n");
            strQuery.Append("       Min(Create_Time)                first_create_time, \n");
            strQuery.Append("       Max(Patient_Sign_Time)          current_write_date, \n");
            strQuery.Append(" \n");
            strQuery.Append("  STUFF(( \n");
            strQuery.Append("            SELECT ',' + A.Patient_relation_type+':'+rtrim(isnull(A.Patient_Sign_No,''))+':'+convert(char(10),Patient_Sign_Time,112) \n");
            strQuery.Append("            FROM SDM_Question_master A \n");
            strQuery.Append("    where A.Quest_ID =　B.Quest_ID \n");
            strQuery.Append("    and  A.Chart_No = B.Chart_No \n");
            strQuery.Append("    and  A.Outpatient_Sn = B.Outpatient_Sn \n");
            strQuery.Append("            FOR XML PATH('') \n");
            strQuery.Append("            ), 1, 1, '') AS detail \n");
            strQuery.Append("FROM  SDM_Question_master B \n");
            strQuery.Append("WHERE  Quest_ID = @QuestId \n");
            strQuery.Append("GROUP  BY Quest_ID, Chart_No, \n");
            strQuery.Append("          Patient_Name, \n");
            strQuery.Append("          Main_Dr_No, \n");
            strQuery.Append("          Main_Dr_Name, \n");
            strQuery.Append("          Outpatient_Sn");



            string[] paraN = { "@QuestId" };
            string[] paraV = { QuestId };

            CommonFunction link = new CommonFunction();
            DataSet dts = link.ConnGetDataSet(strQuery.ToString(), paraN, paraV,"Text");


            //撈取data
            if (dts.Tables.Count >= 0)
            {
                datas = JsonConvert.SerializeObject(dts.Tables[0]);
            }


            iData.Add(datas);
            return iData;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<object> QueryRawData(String QuestId)
        {
            List<object> iData = new List<object>();
            string labels ="";
            string datas ="[]";
            //First get distinct Month Name for select Year.
            string strQuery = "SDM_RawData_091";


            string[] paraN = {"@p_quest_id"};
            string[] paraV = { QuestId };

            CommonFunction link = new CommonFunction();
            DataSet dts = link.ConnGetDataSet(strQuery, paraN, paraV, "StoredProcedure");
            //撈取column
            DataTable dt = new DataTable();
            dt.Columns.Add("title");
            dt.Columns.Add("data");
            foreach (DataRow drow in dts.Tables[0].Rows)
            {
                DataRow dr = dt.NewRow();
                dr["title"] = drow["title"].ToString();
                dr["data"] = drow["data"].ToString();
                dt.Rows.Add(dr);
            }
            labels = JsonConvert.SerializeObject(dt);

            //撈取data
            if (dts.Tables.Count >=2) {
                datas = JsonConvert.SerializeObject(dts.Tables[1]);
            }

            iData.Add(labels);
            iData.Add(datas);
            return iData;
        }







    }
}

