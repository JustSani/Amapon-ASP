using adoNetWebSQlServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using adoNetWebSQlServer;

namespace Amapon
{
    public partial class Private : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
                adoNet.impostaConnessione("App_Data/Amapon.mdf");

            if (Session["codice"] == null)
                Response.Redirect("Default.aspx");
        }

        protected void caricaProdotto(object sender, EventArgs e)
        {
            string sprodName = prodName.Value;
            string sprodDescription = prodDescription.Value;
            string snAvailable = nAvailable.Value;
            string sproducer = producer.Value;
            string sdaysToWait = daysToWait.Value;
            string sprize = prize.Value;
            string smacrocat = macrocat.Value;

            if(pic.FileName.Contains("jpeg") && sprodName != String.Empty && sprodDescription != String.Empty && snAvailable != String.Empty && sproducer != String.Empty && sdaysToWait != String.Empty  && sprize != String.Empty && smacrocat != String.Empty)
            {
                string strSQL = @"SELECT MAX(prodID) FROM products";
                adoNet adoWeb = new adoNet();
                string codice = adoWeb.eseguiScalar(strSQL, CommandType.Text);

                strSQL = @"INSERT INTO products (prodID, prodName, cID, prodDescription, nAvailable, producer, daysToWait, userID, prize)
                    VALUES(" + (Convert.ToInt32(codice) + 1) + ", '" + sprodName + "', " + smacrocat + ", '" + sprodDescription + "', " + snAvailable + ", '" + sproducer + "', '" + sdaysToWait + "', " + Session["codice"] + ", " + sprize + ")";

                adoWeb.eseguiNonQuery(strSQL, CommandType.Text);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Inserimento avvenuto con successo!')", true);

                    try
                    {
                        pic.PostedFile.SaveAs(Server.MapPath("img/") + (Convert.ToInt32(codice) + 1) + ".jpeg");
                    }
                    catch (Exception ex) { }
                
            }

            if(!pic.FileName.Contains("jpeg"))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Solo jpeg!!')", true);
            }

        }
    }
}