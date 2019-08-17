using System;
using System.Text;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Data;
using Newtonsoft.Json;
using SdmSurvey.Class;
using SdmSurvey.Cs;

namespace SdmSurvey.Surveys
{
    /// <summary>
    /// SDM091_Handler 的摘要描述
    /// </summary>
    public class SDM091_Handler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.QueryString["action"] != null)
            {
                string action = context.Request.QueryString["action"].ToString().ToUpper();

                switch (action)
                {
                    case "GETDATA":
                        GetData(context);
                        break;
                    case "SETDATA":
                        SetData(context);
                        break;
                    default:
                        break;
                }
            }
        }
        private void GetData(HttpContext context)
        {
            string SqGrid = HttpUtility.UrlDecode(context.Request.Form["SqGrid"].ToString());

            string datas = "[]";

            //sqlQuery 
            StringBuilder strQuery = new StringBuilder();
            strQuery.Append("select * from SDM_Question_Detail where SQ_GRID =@SQ_GRID");

            string[] paraN = { "@SQ_GRID" };
            string[] paraV = { SqGrid };

            CommonFunction link = new CommonFunction();
            DataSet dts = link.ConnGetDataSet(strQuery.ToString(), paraN, paraV, "Text");


            //撈取data
            if (dts.Tables.Count >= 0)
            {
                datas = JsonConvert.SerializeObject(dts.Tables[0]);
            }
            context.Response.Write(datas);

        }

        private void SetData(HttpContext context)
        {
            
            try
            {
                string data = HttpUtility.UrlDecode(context.Request.Form["q"].ToString());
                string[] ary = data.Split('&');
                string step1 = "", step2_1 = "", step2_2 = "", step2_3 = "", step3 = "", step4_1 = "", step4_2 = "", step4_3 = "";
                string h_ChNe = "", h_ChNo = "", h_Sn = "", h_DocNo = "", h_OrderCode = "", h_ref = "", h_SqGrid = "", h_IpAddress = "";

                //context.Response.Write(data);
                foreach (string i in ary)
                {
                    //Response.Write(i.ToString());
                    string[] k = i.Split('=');
                    //Response.Write(k[0] + " => " + k[1] + "<br>");

                    if (k[0] == "Hemodialysis" || k[0] == "Peritoneal" || k[0] == "transplant" || k[0] == "Peace")
                    {

                        step1 += k[0] == "Hemodialysis" ? k[1] : ", " + k[1];
                       // step1 += ", " + k[1];
                    }
                    else if (k[0] == "21_1" || k[0] == "21_2" || k[0] == "21_3" || k[0] == "21_4" || k[0] == "21_5" || k[0] == "21_6" || k[0] == "21_7" || k[0] == "21_8")
                    {
                        step2_1 += k[0] == "21_1" ? k[1] : ", " + k[1];
                       // step2_1 += ", " + k[1];
                    }
                    else if (k[0] == "22_1" || k[0] == "22_2" || k[0] == "22_3" || k[0] == "22_4" || k[0] == "22_5" || k[0] == "22_6" || k[0] == "22_7" || k[0] == "22_8")
                    {
                        step2_2 += k[0] == "22_1" ? k[1] : ", " + k[1];
                        //step2_2 += ", " + k[1];
                    }
                    else if (k[0] == "23_1" || k[0] == "23_2" || k[0] == "23_3" || k[0] == "23_4" || k[0] == "23_5" || k[0] == "23_6" || k[0] == "23_7")
                    {
                        step2_3 += k[0] == "23_1" ? k[1] : ", " + k[1];
                        //step2_3 += ", " + k[1];
                    }
                    else if (k[0] == "3_1" || k[0] == "3_2" || k[0] == "3_3" || k[0] == "3_4" || k[0] == "3_5" || k[0] == "3_6" || k[0] == "3_7" || k[0] == "3_8" || k[0] == "3_9" || k[0] == "3_10")
                    {
                        step3 += k[0] == "3_1" ? k[1] : ", " + k[1];

                        //step3 += ", " + k[1];
                    }
                    else if (k[0] == "41_1" || k[0] == "41_2" || k[0] == "41_3" || k[0] == "41_4")
                    {

                        step4_1 += k[0] == "41_1" ? k[1] : ", " + k[1];
                        //step4_1 += ", " + k[1];
                    }
                    else if (k[0] == "42_1" )
                    {
                        step4_2 += k[0] == "42_1" ? k[1] : ", " + k[1];
                       //step4_2 += ", " + k[1];
                    }

                    else if (k[0] == "43_1" )
                    {
                        step4_3 += k[0] == "43_1" ? k[1] : ", " + k[1];
                        //step4_3 += ", " + k[1];
                    }


                    // get master info 
                    else if (k[0] == "h_ChNo")
                    {
                        h_ChNo += k[1];
                    }
                    else if (k[0] == "h_Sn")
                    {
                        h_Sn += k[1];
                    }
                    else if (k[0] == "h_DocNo")
                    {
                        h_DocNo += k[1];
                    }

                    else if (k[0] == "h_OrderCode")
                    {
                        h_OrderCode += k[1];
                    }
                    else if (k[0] == "h_ref")
                    {
                        h_ref += k[1];
                    }
                    else if (k[0] == "h_ChNe")
                    {
                        h_ChNe += k[1];
                    }
                    else if (k[0] == "h_SqGrid")
                    {
                        h_SqGrid += k[1];
                    }
                    else if (k[0] == "h_IpAddress")
                    {
                        h_IpAddress += k[1];
                    }
                }



                string str_conn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
                int curr_grid = Convert.ToInt32(h_SqGrid);
                //try
                //{
                //    // Create new SqlConnection object.
                //    //
                //    using (SqlConnection connection = new SqlConnection(str_conn))
                //    {
                //        connection.Open();
                //        //
                //        // Create new SqlCommand object.
                //        //
                //        using (SqlCommand command = new SqlCommand("SELECT IDENT_CURRENT('SDM_Question_master')+1 as max_grid", connection))
                //        {
                //            //
                //            // Invoke ExecuteReader method.
                //            //
                //            SqlDataReader reader = command.ExecuteReader();
                //            while (reader.Read())
                //            {
                //                curr_grid = Convert.ToInt16(reader["max_grid"]);
                //            }
                //        }
                //    }

                //}
                //catch (Exception ex)
                //{
                //    Console.WriteLine(ex);
                //}

                try
                {



                    SqlConnection conn = new SqlConnection(str_conn);
                    conn.Open();

                    //master
                    //StringBuilder Msql = new StringBuilder();
                    //Msql.Append("SET IDENTITY_INSERT sdm.SDM_Question_master ON; ");
                    //Msql.Append("INSERT INTO sdm.SDM_Question_master ");
                    //Msql.Append("           (SQ_GRID ");
                    //Msql.Append("           ,Chart_No ");
                    //Msql.Append("           ,Outpatient_Sn ");
                    //Msql.Append("           ,Main_Dr_No ");
                    //Msql.Append("           ,Quest_ID ");
                    //Msql.Append("           ,Patient_Name ");

                    //Msql.Append("           ,Patient_Sign_Time ");
                    //Msql.Append("           ,Patient_relation_type ");
                    //Msql.Append("           ,Modified_Time ");
                    //Msql.Append("           ,Create_Time ");
                    //Msql.Append("           ,Dc) ");
                    //Msql.Append("     VALUES ");
                    //Msql.Append("           (@SQ_GRID ");
                    //Msql.Append("           ,@Chart_No ");
                    //Msql.Append("           ,@Outpatient_Sn ");
                    //Msql.Append("           ,@Main_Dr_No ");
                    //Msql.Append("           ,@Quest_ID ");
                    //Msql.Append("           ,@Patient_Name ");
                    //Msql.Append("           ,getdate() ");
                    //Msql.Append("           ,@Patient_relation_type ");
                    //Msql.Append("           ,getdate() ");
                    //Msql.Append("           ,getdate() ");
                    //Msql.Append("           ,'N') ");
                    //Msql.Append("SET IDENTITY_INSERT sdm.SDM_Question_master OFF; ");

                    //Master
                    StringBuilder Msql = new StringBuilder();
                    Msql.Append("UPDATE sdm.SDM_Question_master ");
                    Msql.Append(" SET Patient_relation_type = @Patient_relation_type, ");
                    Msql.Append("     Patient_Sign_Time = getdate(), ");
                    Msql.Append("     ip_adress = @ip_adress, ");
                    Msql.Append("     Modified_Time = getdate(), ");
                    Msql.Append("     Modified_User = 'AppUser' ");
                    Msql.Append("WHERE SQ_GRID = @SQ_GRID");






                    //detail
                    StringBuilder Dsql = new StringBuilder();
                    Dsql.Append("INSERT INTO sdm.SDM_Question_Detail");
                    Dsql.Append("           (SQ_GRID");
                    Dsql.Append("           ,SQ_seqNo");
                    Dsql.Append("           ,SQ_Type");
                    Dsql.Append("           ,SQ_single_value");
                    Dsql.Append("           ,SQ_muti_value");
                    Dsql.Append("           ,SQ_text_value");
                    Dsql.Append("           ,Modified_Time");
                    Dsql.Append("           ,Create_Time");
                    Dsql.Append("           ,Dc)");
                    Dsql.Append("     VALUES");
                    Dsql.Append("           (@SQ_GRID");
                    Dsql.Append("           ,@SQ_seqNo");
                    Dsql.Append("           ,@SQ_Type");
                    Dsql.Append("           ,@SQ_single_value");
                    Dsql.Append("           ,@SQ_muti_value");
                    Dsql.Append("           ,@SQ_text_value");
                    Dsql.Append("           ,getdate()");
                    Dsql.Append("           ,getdate()");
                    Dsql.Append("           ,'N')");

                    //update master
                    SqlCommand cmd = new SqlCommand(Msql.ToString(), conn);
                    SqlTransaction trans = conn.BeginTransaction();
                    cmd.Transaction = trans;
                    //try
                    //{
                    //    cmd.Parameters.Add("@SQ_GRID", SqlDbType.Int);
                    //    cmd.Parameters.Add("@Chart_No", SqlDbType.NVarChar);
                    //    cmd.Parameters.Add("@Outpatient_Sn", SqlDbType.NVarChar);
                    //    cmd.Parameters.Add("@Main_Dr_No", SqlDbType.NVarChar);
                    //    cmd.Parameters.Add("@Quest_ID", SqlDbType.NVarChar);
                    //    cmd.Parameters.Add("@Patient_relation_type", SqlDbType.NVarChar);
                    //    cmd.Parameters.Add("@Patient_Name", SqlDbType.NVarChar);

                    //    cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                    //    cmd.Parameters["@Chart_No"].Value = h_ChNo;
                    //    cmd.Parameters["@Outpatient_Sn"].Value = h_Sn;
                    //    cmd.Parameters["@Main_Dr_No"].Value = h_DocNo;
                    //    cmd.Parameters["@Quest_ID"].Value = h_OrderCode;
                    //    cmd.Parameters["@Patient_relation_type"].Value = h_ref;
                    //    cmd.Parameters["@Patient_Name"].Value = h_ChNe;

                    //    cmd.ExecuteNonQuery();
                    //    //Response.Write((Int32)cmd.ExecuteScalar()); 


                    //    trans.Commit();
                    //}
                    //catch (Exception ex)
                    //{
                    //    try
                    //    {
                    //        trans.Rollback();
                    //    }
                    //    catch { }
                    //}

                    try
                    {
                        cmd.Parameters.Add("@Patient_relation_type", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@ip_adress", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_GRID", SqlDbType.Int);

                        cmd.Parameters["@Patient_relation_type"].Value = h_ref;
                        cmd.Parameters["@ip_adress"].Value = h_IpAddress;
                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.ExecuteNonQuery();

                        trans.Commit();
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            trans.Rollback();
                        }
                        catch { }
                    }
                    //insert detail

                    cmd = new SqlCommand(Dsql.ToString(), conn);

                    try
                    {
                        cmd.Parameters.Add("@SQ_GRID", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_seqNo", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_Type", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_single_value", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_muti_value", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_text_value", SqlDbType.NVarChar);

                        //step 1
                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "1";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step1;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();


                        //step 2_1


                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "2_1";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step2_1;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();


                        //step 2_2


                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "2_2";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step2_2;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();

                        //step 2_3


                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "2_3";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step2_3;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();

                        //step 3

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "3";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step3;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();


                        //step 4_1

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4_1";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step4_1;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();



                        //step 4_2

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4_2";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step4_2;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();



                        //step 4_3

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4_3";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step4_3;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();


                        trans.Commit();
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            trans.Rollback();
                        }
                        catch { }
                    }
                }
                catch { }
            }
            catch (Exception ex)
            {
                context.Response.Write(ex + " Exception caught.");
            }
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }



    }
}
