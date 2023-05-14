using adoNetWebSQlServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Amapon
{
    public partial class Pagamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["totale"] == null || Session["codice"] == null)
                Response.Redirect("cart.aspx");

            btn.InnerText = "Totale " + Session["totale"] + ",00€";
        }

        protected void conferma(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Credito insufficiente, riprovare.')", true);
            string strSQL = string.Empty;
            adoNet adoWeb = new adoNet();


            //verifichiamo la presenza di soldi
            strSQL = @"SELECT * from users WHERE userID=" + Session["codice"] + " AND wallet > " + Session["totale"];
            DataTable serverData = new DataTable();
            serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);

            if (serverData.Rows.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Credito insufficiente, riprovare.')", true);
            }
            else
            {
                int wallet = Convert.ToInt32(serverData.Rows[0]["wallet"]);
                // prendiamo l'orderID da usare
                strSQL = @"SELECT MAX(orderID) FROM orders";
                int orderID = Convert.ToInt32(adoWeb.eseguiScalar(strSQL, CommandType.Text));
                orderID++;

                //prendiamo gli elementi dall carrello
                strSQL = @"SELECT * FROM cart INNER JOIN product ON cart.prodID = product.prodID WHERE cart.userID=1";
                serverData = new DataTable();
                serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);

                foreach (DataRow cart in serverData.Rows)
                {
                    // inseriamo negli ordini
                    strSQL = @"INSERT INTO orders (orderID, userID, prodID, nOrdered, totOrder, dateOrder)
                            VALUES(" + orderID + ", " + Session["codice"] + ", " + cart["prodID"] + ", " + cart["nAdded"] + ", " + (Convert.ToInt32(cart["nAdded"]) * Convert.ToInt32(cart["prize"])) + ", GETDATE()) ";
                    adoWeb.eseguiNonQuery(strSQL, CommandType.Text);

                }

                //rimuoviamo dal carrello
                strSQL = @"DELETE FROM cart WHERE userID=" + Session["codice"];
                adoWeb.eseguiNonQuery(strSQL, CommandType.Text);

                strSQL = @"UPDATE users " +
                    "SET wallet=" +  (wallet - Convert.ToInt32(Session["totale"])) + " WHERE userID=" + Session["codice"] + "";

                adoWeb.eseguiNonQuery(strSQL, CommandType.Text);


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Transazione andata a buon fine.')", true);
                Response.Redirect("Orders.aspx");
            }



        }
    }
}