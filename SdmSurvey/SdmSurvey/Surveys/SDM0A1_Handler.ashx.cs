using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;



namespace SdmSurvey.Surveys
{
    /// <summary>
    /// SDM0A1_Handler 的摘要描述
    /// </summary>
    public class SDM0A1_Handler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string data = HttpUtility.UrlDecode(context.Request.Form["q"].ToString());
                //string data = context.Request.Form["q"].ToString();
                string[] ary = data.Split('&');
                string step1 = "", step2 = "", step3_1 = "", step3_2 = "", step4 = "", step_4_desc = "";
                string h_ChNe = "", h_ChNo = "", h_Sn = "", h_DocNo = "", h_OrderCode = "", h_ref = "", h_SqGrid = "", h_IpAddress = "";
                //context.Response.Write(data);
                foreach (string i in ary)
                {
                    //Response.Write(i.ToString());
                    string[] k = i.Split('=');
                    //Response.Write(k[0] + " => " + k[1] + "<br>");

                    if (k[0] == "1_1" || k[0] == "1_2" || k[0] == "1_3" || k[0] == "1_4" || k[0] == "1_5" || k[0] == "1_6" || k[0] == "1_7" || k[0] == "1_8")
                    {
                        step1 += k[0] == "1_1" ? k[1] : ", " + k[1];
                  
                    }
                    else if (k[0] == "2_1" || k[0] == "2_1" || k[0] == "2_2" || k[0] == "2_3" || k[0] == "2_4" || k[0] == "2_5" || k[0] == "2_6")
                    {
                        step2 += k[0] == "2_1" ? k[1] : ", " + k[1];
                    }
                    else if (k[0] == "31_1" || k[0] == "31_2" || k[0] == "31_3" || k[0] == "31_4")
                    {
                        step3_1 += k[0] == "31_1" ? k[1] : ", " + k[1];
                    }
                    else if (k[0] == "32_1" || k[0] == "32_2" || k[0] == "32_3")
                    {
                        step3_2 += k[0] == "32_1" ? k[1] : ", " + k[1];
                    }

                    else if (k[0] == "4_1")
                    {

                        step4 += k[1];
                    }
                    else if (k[0] == "4_desc")
                    {
                        step_4_desc += k[1];
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

                        //step 2


                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "2";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step2;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();



                        //step 3_1

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "3_1";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step3_1;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();


                        //step 3_2

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "3_2";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step3_2;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();

                        //step 4_1

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = step4;
                        cmd.Parameters["@SQ_muti_value"].Value = "";
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();



                        //step 4_desc

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4_t";
                        cmd.Parameters["@SQ_Type"].Value = "4";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = "";
                        cmd.Parameters["@SQ_text_value"].Value = step_4_desc;
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
                //context.Response.Write(">step2 " + step2 + "<br>");
                //context.Response.Write(">step3 " + step3 + "<br>");
                //context.Response.Write(">step4 " + step4 + "<br>");
                //context.Response.Write(">step5 " + step5 + "<br>");
                //context.Response.Write(">step5_other " + step5_other + "<br>");
                //context.Response.Write(">pid " + pid + "<br>");
                //context.Response.Write(">p_sign " + p_ref + "<br>");
                //context.Response.Write(">d_sign " + d_sign + "<br>");
                //context.Response.Write(">p_sign_date " + p_sign_date + "<br>");
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
