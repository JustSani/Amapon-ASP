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
    public partial class ShowProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["prodId"] == null)
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
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}