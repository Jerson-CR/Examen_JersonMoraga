using Examen_JersonMoraga.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_JersonMoraga
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (ClsLogin.ValidarLogin(TextBox3.Text, TextBox1.Text) > 0)
            {
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                lmensaje.Text = "Usuario no existe";


            }
        }
    }
}