using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace SdmSurvey.Cs
{
    public class CommonFunction
    {

        public DataTable ConnGetDataTable(string strQuery, String[] paraN, String[] paraV, String type)
        {
            string cn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
            SqlDataAdapter dap = new SqlDataAdapter(strQuery, cn);
            if (type == "StoredProcedure")
            {
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                dap.SelectCommand.CommandType = CommandType.Text;
            }
            for (int i = 0; i < paraN.Length; i++)
            {
                dap.SelectCommand.Parameters.AddWithValue(paraN[i], paraV[i]);
            }

            DataSet ds = new DataSet();
            dap.Fill(ds);
            return ds.Tables[0];
        }

        public DataSet ConnGetDataSet(string strQuery, String[] paraN, String[] paraV, String type)
        {
            string cn = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
            SqlDataAdapter dap = new SqlDataAdapter(strQuery, cn);
            if (type == "StoredProcedure")
            {
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                dap.SelectCommand.CommandType = CommandType.Text;
            }


            for (int i = 0; i < paraN.Length; i++)
            {
                dap.SelectCommand.Parameters.AddWithValue(paraN[i], paraV[i]);
            }

            DataSet ds = new DataSet();
            dap.Fill(ds);
            return ds;
        }
    }
}