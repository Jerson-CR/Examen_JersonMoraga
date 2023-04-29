using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Examen_JersonMoraga.Clases;

namespace Examen_JersonMoraga
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Usuarios"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Mae_Usuarios"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClsUsuarios.Login_Usuario = TextBox1.Text;
            ClsUsuarios.Clave_Usuario = TextBox2.Text;
            ClsUsuarios.Nombre_Usuario = TextBox3.Text;
            if (ClsUsuarios.AgregarUsuarios() > 0)
            {
                LlenarGrid();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ClsUsuarios.Login_Usuario = TextBox1.Text;
            if (ClsUsuarios.BorrarUsuarios() > 0)
            {
                LlenarGrid();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (ClsUsuarios.RefrescarUsuarios() > 0)
            {
                LlenarGrid();
            }
        }
    }
}