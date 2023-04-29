using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Examen_JersonMoraga.Clases
{
    public class DBconn
    {
        int conexion;
        public static SqlConnection conexionLogin()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["Login"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }
    }
}