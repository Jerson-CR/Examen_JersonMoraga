using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Examen_JersonMoraga.Clases
{
    public class DBconn1
    {
        int conexion;
        public static SqlConnection conexionUsuarios()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["Usuarios"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }
    }
}