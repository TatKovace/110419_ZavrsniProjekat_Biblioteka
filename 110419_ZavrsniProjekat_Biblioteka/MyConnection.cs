using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace _110419_ZavrsniProjekat_Biblioteka
{
    public class MyConnection
    {
        static public SqlConnection Connect()
        {
            // Class that provides connection

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["libraryCS"].ConnectionString);
            return conn;            
        }
    }
}