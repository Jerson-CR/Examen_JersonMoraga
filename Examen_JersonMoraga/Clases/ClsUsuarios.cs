using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen_JersonMoraga.Clases
{
    public class ClsUsuarios
    {
        public static string Login_Usuario { get; set; }
        public static string Clave_Usuario { get; set; }
        public static string Nombre_Usuario { get; set; }
        public static int AgregarUsuarios()
        {

            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn1.conexionUsuarios())
                {
                    SqlCommand cmd = new SqlCommand("SP_IngresarMae_Usuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Login_Usuario", Login_Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave_Usuario", Clave_Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Nombre_Usuario", Nombre_Usuario));



                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;

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
        public static int BorrarUsuarios()
        {

            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn1.conexionUsuarios())
                {
                    SqlCommand cmd = new SqlCommand("sp_BorrarMae_Usuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Login_Usuario", Login_Usuario));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;

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
        public static int RefrescarUsuarios()
        {

            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn1.conexionUsuarios())
                {
                    SqlCommand cmd = new SqlCommand("SP_ListadoMae_Usuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;

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