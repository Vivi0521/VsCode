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
            string type = context.Request["type"];
            string text = context.Request["text"];
            string col_index = context.Request["col_index"];
            string col_name = context.Request["col_name"];

            Data data = GetType(type);

            string vSQL = string.Empty;
            vSQL += "SELECT MIN(" + data.Time + ") as Column0,";
            vSQL += "       AVG(CONVERT(DECIMAL(10,2), ISNULL(Column" + col_index + ",0))) as Column" + col_index;
            vSQL += "  FROM dbo." + data.Table;
            vSQL += " WHERE " + data.Time + " BETWEEN @P1 AND @P2";
            vSQL += "   AND " + data.Line + " = @P3";
            vSQL += " GROUP BY DATEPART(MI," + data.Time + ") / " + data.Interval + ", SUBSTRING(" + data.Time + ",1,14)";
            vSQL += " ORDER BY MAX(" + data.Time + ")";

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
                        value.Add(Math.Round(sqldr.GetDecimal(sqldr.GetOrdinal("Column" + col_index)), 2));
                    }

                    categories = datetime.GroupBy(r => r.Substring(0, 10)).ToDictionary(g => g.Key, g => g.ToList());

                    foreach (KeyValuePair<string, List<string>> item in categories)
                    {
                        xAxis.Add(new Grouped
                        {
                            name = item.Key,
                            categories = item.Value.Select(s => s.Substring(11, 8)).ToList()
                        });
                    }

                    series.Add(new ReturnData()
                    {
                        name = col_name,
                        data = value
                    });

                    option.title = col_name;
                    option.text = text;
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
            string type = context.Request["type"];

            Data data = GetType(type);

            string vSQL = "select ColIndex, ColName from ColdParameter where line = @P1 and ColIndex > 1 and Attribute1 = @P2 order by ColIndex";
            SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.Connection = sqlcon;
            sqlcmd.CommandType = CommandType.Text;
            sqlcmd.CommandText = vSQL;
            sqlcmd.Parameters.AddWithValue("@P1", line);
            sqlcmd.Parameters.AddWithValue("@P2", data.Table);
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

        public Data GetType(string type) {

            Data data = new Data();

            switch (type)
            {
                case "1":
                    data.Time = "Column0";
                    data.Line = "Column125";
                    data.Table = "ProcessData";
                    data.Interval = 5;
                    break;
                case "2":
                    data.Time = "Column0";
                    data.Line = "Column25";
                    data.Table = "DB";
                    data.Interval = 1;
                    break;
                default:
                    data.Time = "Column0";
                    data.Line = "Column125";
                    data.Table = "ProcessData";
                    data.Interval = 5;
                    break;
            }

            return data;
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
        public string text { get; set; }
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

    public class Data
    {
        public string Table { get; set; }
        public string Time { get; set; }
        public string Line { get; set; }
        public int Interval { get; set; }
    }
}