using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Newtonsoft.Json;

namespace cpd_web
{
    /// <summary>
    /// Summary description for DefaultHandler
    /// </summary>
    public class DefaultHandler : IHttpHandler
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
                    case "GETCHART":
                        GetChart(context);
                        break;
                    default:
                        break;
                }
            }
        }

        private void GetData(HttpContext context)
        {
            List<string> datetime = new List<string>();
            List<decimal> value = new List<decimal>();

            List<ReturnData> series = new List<ReturnData>();
            List<Grouped> xAxis = new List<Grouped>();

            Dictionary<string, List<string>> categories = new Dictionary<string, List<string>>();

            string start_date = context.Request["start_date"];
            string end_date = context.Request["end_date"];
            string line = context.Request["line"];
            string col_index = context.Request["col_index"];
            string col_name = context.Request["col_name"];

            string vSQL = string.Empty;
            //vSQL += "select Column0, isnull(Column" + col_index + ",0) as Column" + col_index;
            //vSQL += "  from ProcessData";
            //vSQL += " where Column0 between @P1 and @P2";
            //vSQL += "   and Column99 = @P3";

            vSQL += "SELECT MAX(ProcessData.Column0) as Column0,";
            vSQL += "       AVG(CONVERT(DECIMAL(10,2), ISNULL(ProcessData.Column" + col_index + ",0))) as Column" + col_index;
            vSQL += "  FROM dbo.ProcessData";
            vSQL += " WHERE ProcessData.Column0 BETWEEN @P1 AND @P2";
            vSQL += "   AND ProcessData.Column99 = @P3";
            vSQL += " GROUP BY DATEPART(MI,ProcessData.Column0) / 5, SUBSTRING(ProcessData.Column0,1,14)";
            vSQL += " ORDER BY MAX(ProcessData.Column0)";

            SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.Text;
            sqlcmd.CommandText = vSQL;
            sqlcmd.Parameters.AddWithValue("@P1", string.Format("{0} 00:00:00", start_date));
            sqlcmd.Parameters.AddWithValue("@P2", string.Format("{0} 23:59:59", end_date));
            sqlcmd.Parameters.AddWithValue("@P3", line);
            sqlcmd.Connection = sqlcon;
            SqlDataReader sqldr = null;

            Options option = new Options();

            try
            {
                sqlcon.Open();

                sqldr = sqlcmd.ExecuteReader();

                if (sqldr.HasRows)
                {
                    while (sqldr.Read())
                    {
                        datetime.Add(sqldr.GetString(sqldr.GetOrdinal("Column0")));
                        value.Add(Math.Round(sqldr.GetDecimal(sqldr.GetOrdinal("Column" + col_index)),2));
                    }

                    categories = datetime.GroupBy(r => r.Substring(0, 10)).ToDictionary(g => g.Key, g => g.ToList());

                    foreach (KeyValuePair<string, List<string>> item in categories)
                    {
                        xAxis.Add(new Grouped
                        {
                            name = item.Key,
                            categories = item.Value.Select(s => s.Substring(11,8)).ToList()
                        });
                    }

                    series.Add(new ReturnData()
                    {
                        name = col_name,
                        data = value
                    });

                    option.title = col_name;
                    option.xAxis = xAxis;
                    option.series = series;
                }

                string json = JsonConvert.SerializeObject(option);
                context.Response.Write(json);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (sqlcon.State != ConnectionState.Closed)
                {
                    sqldr.Close();
                    sqldr.Dispose();
                    sqlcon.Close();
                    sqlcon.Dispose();
                }
            }
        }

        private void GetChart(HttpContext context)
        {
            List<Charts> chartList = new List<Charts>();

            string line = context.Request["line"];

            string vSQL = "select ColIndex, ColName from ColdParameter where line = @P1 and ColIndex > 1 order by ColIndex";
            SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.Connection = sqlcon;
            sqlcmd.CommandType = CommandType.Text;
            sqlcmd.CommandText = vSQL;
            sqlcmd.Parameters.AddWithValue("@P1", line);
            SqlDataReader sqldr = null;

            try
            {
                sqlcon.Open();

                sqldr = sqlcmd.ExecuteReader();

                if (sqldr.HasRows)
                {
                    while (sqldr.Read())
                    {
                        int colindex = sqldr.GetInt32(sqldr.GetOrdinal("ColIndex"));
                        string colname = sqldr.GetString(sqldr.GetOrdinal("ColName"));

                        chartList.Add(new Charts
                        {
                            colIndex = colindex,
                            colName = colname
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (sqlcon.State != ConnectionState.Closed)
                {
                    sqldr.Close();
                    sqldr.Dispose();
                    sqlcon.Close();
                    sqlcon.Dispose();
                }
            }

            string json = JsonConvert.SerializeObject(chartList);
            context.Response.Write(json);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    public class Charts
    {
        public int colIndex { get; set; }
        public string colName { get; set; }
    }

    public class Options
    {
        public string title { get; set; }
        public List<Grouped> xAxis { get; set; }
        public List<ReturnData> series { get; set; }
    }

    public class ReturnData
    {
        public string name;
        public List<decimal> data; // 一定要用decimal數值單位
    }

    public class Grouped
    {
        public string name { get; set; }
        public List<string> categories { get; set; }
    }
}