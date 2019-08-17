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
    /// SDM231_Handler 的摘要描述
    /// </summary>
    public class SDM231_Handler : IHttpHandler
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
                string step2 = "", step2_other = "", step3 = "", step4_1 = "", step4_1_other = "", step4_2 = "", step4_2_other = "";
                string h_ChNe = "", h_ChNo = "", h_Sn = "", h_DocNo = "", h_OrderCode = "", h_ref = "", h_SqGrid = "", h_IpAddress = "";
                //context.Response.Write(data);
                foreach (string i in ary)
                {
                    //Response.Write(i.ToString());
                    string[] k = i.Split('=');
                    
                    if (k[0] == "q2")  //step2 

                    {
                        string tt = k[1] != null ? k[1].ToString().Replace("q2_", "") : "";
                        step2 += "" + tt;
                    }
                    if (k[0] == "q2_reason")  

                    {
                        step2_other += "" + k[1];
                    }
                    else if (k[0] == "q3_1") //step3
                    {
                        step3 = k[1];
                    }
                    else if (k[0] == "q3_2" || k[0] == "q3_3" || k[0] == "q3_4" || k[0] == "q3_5")
                    {
                        step3 += ", " + k[1];
                    }
                    else if (k[0] == "q4_1")
                    {
                        step4_1 += "" + k[1];
                    }
                    else if (k[0] == "q4_1_reason")
                    {
                        step4_1_other += "" + k[1];
                    }
                    else if (k[0] == "q4_2")
                    {
                        step4_2 += "" + k[1];
                    }
                    else if (k[0] == "q4_2_reason")
                    {
                        step4_2_other += "" + k[1];
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


                try
                {



                    SqlConnection conn = new SqlConnection(str_conn);
                    conn.Open();



                    //Master
                    StringBuilder Msql = new StringBuilder();
                    Msql.Append("UPDATE SDM_Question_master ");
                    Msql.Append(" SET Patient_relation_type = @Patient_relation_type, ");
                    Msql.Append("     Patient_Sign_Time = getdate(), ");
                    Msql.Append("     ip_adress = @ip_adress, ");
                    Msql.Append("     Modified_Time = getdate(), ");
                    Msql.Append("     Modified_User = 'AppUser' ");
                    Msql.Append("WHERE SQ_GRID = @SQ_GRID");






                    //detail
                    StringBuilder Dsql = new StringBuilder();
                    Dsql.Append("INSERT INTO SDM_Question_Detail");
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
                        //step 2
                        cmd.Parameters.Add("@SQ_GRID", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_seqNo", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_Type", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_single_value", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_muti_value", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_text_value", SqlDbType.NVarChar);

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "2";
                        cmd.Parameters["@SQ_Type"].Value = "5";   //主問題類型 1.input, 2.radio, 3.checkbox, 4.textarea, 5.order
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step2;
                        cmd.Parameters["@SQ_text_value"].Value = step2_other;
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
                        cmd.Parameters["@SQ_text_value"].Value = step4_1_other;
                        cmd.ExecuteNonQuery();



                        //step 4_2

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4_2";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step4_2;
                        cmd.Parameters["@SQ_text_value"].Value = step4_2_other;
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
