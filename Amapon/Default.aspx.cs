using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using adoNetWebSQlServer;

namespace Amapon
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                adoNet.impostaConnessione("App_Data/Amapon.mdf");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strSQL = string.Empty;
            adoNet adoWeb = new adoNet();
            string codice = string.Empty;

            // Controllo i caratteri in Input
            if (TextBox1.Text.Contains("'") || TextBox1.Text.Contains("\"") ||
                TextBox2.Text.Contains("'") || TextBox2.Text.Contains("\""))
            {
                return;
            }
            else
            {
                string campoDaUsare = "";

                if (TextBox1.Text.Contains("@") == true) //mail 
                    campoDaUsare = "email";
                else
                    campoDaUsare = "username";

                strSQL = @"select * from users where "+ campoDaUsare +" = '"+ TextBox1.Text + "' AND password = '"+ TextBox2.Text + "'";
                
                
                
                codice = adoWeb.eseguiScalar(strSQL, CommandType.Text);
                if (codice == string.Empty)
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Attenzione: " + campoDaUsare + " o Password non valido !!')", true);
                else
                {
                    // Salvo nella Session il Codice del Correntista
                    Session["Codice"] = codice;
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}