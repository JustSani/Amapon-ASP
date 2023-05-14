using adoNetWebSQlServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Amapon
{
    public partial class ShowProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["prodId"] == null || Session["Codice"] == null)
                Response.Redirect("Home.aspx");
            else
            {
                string strSQL = string.Empty;
                adoNet adoWeb = new adoNet();

                strSQL = @"SELECT * FROM products
                              WHERE prodID=" + Session["prodId"];

                /*grdMovimenti.AutoGenerateColumns = false;
                grdMovimenti.DataSource = adoWeb.eseguiQuery(strSQL, CommandType.Text);
                grdMovimenti.DataBind();*/

                DataTable serverData = new DataTable();
                serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);

                prodName.InnerText = serverData.Rows[0]["prodName"].ToString();
                smallProduct.InnerText = "Produttore: " + serverData.Rows[0]["producer"].ToString();
                prize.InnerText = serverData.Rows[0]["prize"].ToString() + "€";
                prodDesc.InnerText = serverData.Rows[0]["prodDescription"].ToString();
                prize2.InnerText = serverData.Rows[0]["prize"].ToString() + "€";
                tempo.InnerText = serverData.Rows[0]["daysToWait"].ToString() + " giorni";
                img.Attributes.Add("src", "https://sanino.altervista.org/Amapon/productsImages/" + serverData.Rows[0]["prodId"] + ".jpeg");
                venditore.InnerText = "Amazon \n" + serverData.Rows[0]["producer"].ToString();

                int nAvailable = Convert.ToInt32(serverData.Rows[0]["nAvailable"]);
                for(int i = 1; i < nAvailable; i++)
                {
                    quantiSelect.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }


                strSQL = @"SELECT * FROM cart 
                              WHERE userID= " + Session["Codice"] + " AND prodID="+ Session["prodId"];// + Session["userID"];
                
                serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);
                if(serverData.Rows.Count != 0)
                {
                    addToCartBtn.Enabled = false;
                    addToCartBtn.Text = "Gia nel carrello";
                    foreach(DataRow crow in serverData.Rows) { 
                        quantiSelect.Value = crow["nAdded"].ToString();
                    }
                    quantiSelect.Disabled = true;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void addToCart(object sender, EventArgs e)
        {
            string strSQL = string.Empty;
            adoNet adoWeb = new adoNet();
            
            strSQL = @"INSERT INTO cart(userID, prodID, nAdded) VALUES(" + Session["Codice"] +", " + Session["prodID"] +", "+ quantiSelect.Value +")";

            int done = adoWeb.eseguiNonQuery(strSQL, CommandType.Text);

            Response.Redirect("Cart.aspx");

        }
    }
}