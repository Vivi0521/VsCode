using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using DataTables.Class;
using System.Collections.Generic;
using System.Data;

namespace DataTables.Views
{
    /// <summary>
    ///SummaryService 的摘要描述
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
    [System.Web.Script.Services.ScriptService]
    public class SummaryService : System.Web.Services.WebService
    {



        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QueryOrderTable(String chartNo, String stpeVal)
        {

            List<OrderTable> questions = new List<OrderTable>();


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
                    using (SqlCommand command = new SqlCommand("SDM_OrderTable", connection))
                    {


                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@p_chart_no", chartNo);
                        command.Parameters.AddWithValue("@p_sq_seqNo", stpeVal);

                        //
                        // Invoke ExecuteReader method.
                        //
                        SqlDataReader sqldr = command.ExecuteReader();

                        if (sqldr.HasRows)
                        {
                            while (sqldr.Read())
                            {
                                questions.Add(new OrderTable
                                {
                                    yN = Convert.ToString(sqldr["y_n"]),
                                    order1 = Convert.ToInt16(sqldr["order1"]),
                                    order2 = Convert.ToInt16(sqldr["order2"]),
                                    order3 = Convert.ToInt16(sqldr["order3"]),
                                    order4 = Convert.ToInt16(sqldr["order4"]),
                                    order5 = Convert.ToInt16(sqldr["order5"])
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
        public List<object> getLineChartData(String chartNo, String stpeVal)
        {
            List<object> iData = new List<object>();
            List<string> labels = new List<string>();
            List<int> datas = new List<int>();
            //First get distinct Month Name for select Year.
            string strQuery = "SDM_OrderTable";


            string[] paraN = { "@p_chart_no", "@p_sq_seqNo"};
            string[] paraV = { chartNo, stpeVal};


            DataTable dtLabels = commonFuntionGetData(strQuery, paraN, paraV);
           
            foreach (DataRow drow in dtLabels.Rows)
            {
                labels.Add(drow["y_n"].ToString());
                int dv = Convert.ToInt32(drow["order1"].ToString())*5 + Convert.ToInt32(drow["order2"].ToString())*4 + Convert.ToInt32(drow["order3"].ToString())*3
                    + Convert.ToInt32(drow["order4"].ToString())*2 + Convert.ToInt32(drow["order5"].ToString())*1;
                datas.Add(dv);

            }
            iData.Add(labels);
            iData.Add(datas);
            return iData;
        }
        public DataTable commonFuntionGetData(string strQuery, String[] paraN, String[] paraV)
        {
            string cn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
            SqlDataAdapter dap = new SqlDataAdapter(strQuery, cn);
            dap.SelectCommand.CommandType = CommandType.StoredProcedure;

            for (int i = 0; i < paraN.Length; i++)
            {
                dap.SelectCommand.Parameters.AddWithValue(paraN[i], paraV[i]);
            }

            DataSet ds = new DataSet();
            dap.Fill(ds);
            return ds.Tables[0];
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QueryRadioTable(String chartNo, String stpeVal, String position, String questId)
        {

            List<RadioTable> radios = new List<RadioTable>();


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
                    using (SqlCommand command = new SqlCommand("SDM_RadioTable", connection))
                    {


                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@p_chart_no", chartNo);
                        command.Parameters.AddWithValue("@p_sq_seqNo", stpeVal);
                        command.Parameters.AddWithValue("@p_position", position);
                        command.Parameters.AddWithValue("@p_quest_id", questId);

                        //
                        // Invoke ExecuteReader method.
                        //
                        SqlDataReader sqldr = command.ExecuteReader();

                        if (sqldr.HasRows)
                        {
                            while (sqldr.Read())
                            {
                                radios.Add(new RadioTable
                                {
                                    position = Convert.ToString(sqldr["position"]),
                                    value = Convert.ToString(sqldr["value"]),
                                    v_t = Convert.ToInt16(sqldr["v_t"]),
                                    c_p = Convert.ToDecimal(sqldr["c_p"])
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
            return new JavaScriptSerializer().Serialize(radios);

        }



        [WebMethod]
        public List<object> getDoughnutChartData(String chartNo, String stpeVal, String position,String questId)
        {
            List<object> iData = new List<object>();
            List<string> labels = new List<string>();
            List<int> datas = new List<int>();
            //First get distinct Month Name for select Year.
            string strQuery = "SDM_RadioTable";


            string[] paraN = { "@p_chart_no", "@p_sq_seqNo", "@p_position", "@p_quest_id" };
            string[] paraV = { chartNo, stpeVal, position, questId };


            DataTable dtLabels = commonFuntionGetData(strQuery, paraN, paraV);

            foreach (DataRow drow in dtLabels.Rows)
            {
                labels.Add(drow["value"].ToString());
                datas.Add(Convert.ToInt32(drow["v_t"].ToString()));

            }
            iData.Add(labels);
            iData.Add(datas);
            return iData;
        }




        //end


    }



}