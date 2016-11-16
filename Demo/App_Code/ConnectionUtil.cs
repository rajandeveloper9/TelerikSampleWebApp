# region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
# endregion

namespace Demo
{
    public class ConnectionUtil
    {
        public static SqlConnection getConnection()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Demo"].ToString();
            return new SqlConnection(connStr);

        }
    }
}