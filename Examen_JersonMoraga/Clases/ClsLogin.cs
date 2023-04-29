using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen_JersonMoraga.Clases
{
    public class ClsLogin
    {
        public static string Login_Usuario { get; set; }
        public static String Clave_Usuario { get; set; }

        public static int ValidarLogin(string usuario, string clave)
        {

            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.conexionLogin())
                {
                    SqlCommand cmd = new SqlCommand("ValidarLogin", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Login_Usuari", usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave_Usuario", clave));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;
                            Login_Usuario = usuario;
                        }

                    }


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;

        }
    }
}