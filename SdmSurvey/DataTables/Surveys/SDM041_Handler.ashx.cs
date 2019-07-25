using System;
using System.Text;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
//using Newtonsoft.Json;


namespace DataTables.Surveys
{
    /// <summary>
    /// SDM041_Handler 的摘要描述
    /// </summary>
    public class SDM041_Handler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.QueryString["action"] != null)
            {
                string action = context.Request.QueryString["action"].ToString().ToUpper();

                switch (action)
                {
                    case "GETDATA":
                        //GetData(context.Request.Form["q"].ToString());
                        break;
                    case "SAVE":
                        save(context.Request.Form["q"].ToString());
                        break;
                    default:
                        break;
                }
            }
        }


       

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        //private void GetData(HttpContext context)
        //{
        //    System.Collections.Generic.List<string> datetime = new List<string>();
        //    List<decimal> value = new List<decimal>();

        //    List<ReturnData> series = new List<ReturnData>();
        //    List<Grouped> xAxis = new List<Grouped>();

        //    Dictionary<string, List<string>> categories = new Dictionary<string, List<string>>();

        //    string start_date = context.Request["start_date"];
        //    string end_date = context.Request["end_date"];
        //    string line = context.Request["line"];
        //    string type = context.Request["type"];
        //    string text = context.Request["text"];
        //    string col_index = context.Request["col_index"];
        //    string col_name = context.Request["col_name"];

        //    Data data = GetType(type);

        //    string vSQL = string.Empty;
        //    vSQL += "SELECT MIN(" + data.Time + ") as Column0,";
        //    vSQL += "       AVG(CONVERT(DECIMAL(10,2), ISNULL(Column" + col_index + ",0))) as Column" + col_index;
        //    vSQL += "  FROM dbo." + data.Table;
        //    vSQL += " WHERE " + data.Time + " BETWEEN @P1 AND @P2";
        //    vSQL += "   AND " + data.Line + " = @P3";
        //    vSQL += " GROUP BY DATEPART(MI," + data.Time + ") / " + data.Interval + ", SUBSTRING(" + data.Time + ",1,14)";
        //    vSQL += " ORDER BY MAX(" + data.Time + ")";

        //    SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
        //    SqlCommand sqlcmd = new SqlCommand();
        //    sqlcmd.CommandType = CommandType.Text;
        //    sqlcmd.CommandText = vSQL;
        //    sqlcmd.Parameters.AddWithValue("@P1", string.Format("{0} 00:00:00", start_date));
        //    sqlcmd.Parameters.AddWithValue("@P2", string.Format("{0} 23:59:59", end_date));
        //    sqlcmd.Parameters.AddWithValue("@P3", line);
        //    sqlcmd.Connection = sqlcon;
        //    SqlDataReader sqldr = null;

        //    Options option = new Options();

        //    try
        //    {
        //        sqlcon.Open();

        //        sqldr = sqlcmd.ExecuteReader();

        //        if (sqldr.HasRows)
        //        {
        //            while (sqldr.Read())
        //            {
        //                datetime.Add(sqldr.GetString(sqldr.GetOrdinal("Column0")));
        //                value.Add(Math.Round(sqldr.GetDecimal(sqldr.GetOrdinal("Column" + col_index)), 2));
        //            }

        //            categories = datetime.GroupBy(r => r.Substring(0, 10)).ToDictionary(g => g.Key, g => g.ToList());

        //            foreach (KeyValuePair<string, List<string>> item in categories)
        //            {
        //                xAxis.Add(new Grouped
        //                {
        //                    name = item.Key,
        //                    categories = item.Value.Select(s => s.Substring(11, 8)).ToList()
        //                });
        //            }

        //            series.Add(new ReturnData()
        //            {
        //                name = col_name,
        //                data = value
        //            });

        //            option.title = col_name;
        //            option.text = text;
        //            option.xAxis = xAxis;
        //            option.series = series;
        //        }

        //        string json = JavaScriptSerializer().Serialize(q);
        //        context.Response.Write(JavaScriptSerializer().Serialize(q));
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //    finally
        //    {
        //        if (sqlcon.State != ConnectionState.Closed)
        //        {
        //            sqldr.Close();
        //            sqldr.Dispose();
        //            sqlcon.Close();
        //            sqlcon.Dispose();
        //        }
        //    }
        //}

        private void save (string data)
        {
            try
            {
                string[] ary = data.Split('&');
                string step2 = "", step3 = "", step4 = "", step5 = "", step5_other = "", step6 = "", step6_other = "";
                string h_ChNe = "", h_ChNo = "", h_Sn = "", h_DocNo = "", h_OrderCode = "", h_ref = "", h_SqGrid = "", h_IpAddress = "";
                //context.Response.Write(data);
                foreach (string i in ary)
                {
                    //Response.Write(i.ToString());
                    string[] k = i.Split('=');
                    //Response.Write(k[0] + " => " + k[1] + "<br>");
                    if (k[0] == "care1")
                    {
                        step2 += "" + k[1];
                    }
                    else if (k[0] == "care2" || k[0] == "care3" || k[0] == "care4" || k[0] == "care5")
                    {
                        step2 += ", " + k[1];
                    }
                    else if (k[0] == "risk")
                    {
                        step3 = k[1];
                    }
                    else if (k[0] == "q1")
                    {
                        step4 += "" + k[1];
                    }
                    else if (k[0] == "q2" || k[0] == "q3" || k[0] == "q4" || k[0] == "q5")
                    {
                        step4 += ", " + k[1];
                    }
                    else if (k[0] == "ready_cure")
                    {
                        step5 += "" + k[1];
                    }
                    else if (k[0] == "not_ready_cure")
                    {
                        step6 += "" + k[1];
                    }
                    else if (k[0] == "ready_cure_4_reason" && step5 == "4")
                    {
                        step5_other += k[1];
                    }
                    else if (k[0] == "not_ready_cure_3_reason" && step6 == "3")
                    {
                        step6_other += k[1];
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
                        //step 2
                        cmd.Parameters.Add("@SQ_GRID", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_seqNo", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_Type", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_single_value", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_muti_value", SqlDbType.NVarChar);
                        cmd.Parameters.Add("@SQ_text_value", SqlDbType.NVarChar);

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "2";
                        cmd.Parameters["@SQ_Type"].Value = "3";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step2;
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


                        //step 4

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "4";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step4;
                        cmd.Parameters["@SQ_text_value"].Value = "";
                        cmd.ExecuteNonQuery();


                        //step 5

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "5";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step5;
                        cmd.Parameters["@SQ_text_value"].Value = step5_other;
                        cmd.ExecuteNonQuery();

                        //step 6

                        cmd.Parameters["@SQ_GRID"].Value = curr_grid;
                        cmd.Parameters["@SQ_seqNo"].Value = "6";
                        cmd.Parameters["@SQ_Type"].Value = "2";
                        cmd.Parameters["@SQ_single_value"].Value = "";
                        cmd.Parameters["@SQ_muti_value"].Value = step6;
                        cmd.Parameters["@SQ_text_value"].Value = step6_other;
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
                Console.WriteLine(ex.Message);
            }
        }
    }
}