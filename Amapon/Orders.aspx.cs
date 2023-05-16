using adoNetWebSQlServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Amapon
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
                adoNet.impostaConnessione("App_Data/Amapon.mdf");

            if (Session["codice"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            string strSQL = string.Empty;
            adoNet adoWeb = new adoNet();

            strSQL = @"SELECT DISTINCT orderID, dateOrder FROM orders WHERE orders.userID = " + Session["codice"] + "ORDER BY dateOrder DESC";
            DataTable serverData = new DataTable();
            serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);

            if (serverData.Rows.Count == 0)
            {
                ordini.InnerText = "Nessun ordine:(";
            }

            int i = 0;
            //ordine
            foreach (DataRow serverDataRow in serverData.Rows)
            {
               
                /*
                 * <div class='topOrder'> 
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-2">
                                <b>Ordine effetuato il:</b>
                                2023-03-27        </div>
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-4">
                                <b>Codice Ordine:</b><br>
                                26        </div>
                            <div class="col-md-2">
                                <b>Totale Ordine:</b><br>
                                199 €
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                */

                int totaleOrdine = 0;

                strSQL = "SELECT * FROM orders INNER JOIN products as product ON orders.prodID = product.prodID WHERE orderID=" + serverDataRow["orderID"] + " ";

                DataTable order = new DataTable();
                order = adoWeb.eseguiQuery(strSQL, CommandType.Text);

                HtmlGenericControl centerOrder = new HtmlGenericControl("div");
                centerOrder.Attributes.Add("class", "centerOrder");
                // prodotti
                foreach (DataRow DatacurrentOrder in order.Rows)
                {
                    totaleOrdine += Convert.ToInt32(DatacurrentOrder["prize"]) * Convert.ToInt32(DatacurrentOrder["nOrdered"]);

                    HtmlGenericControl padd = new HtmlGenericControl("div");
                    padd.Attributes.Add("style", "padding: 20px;");

                    HtmlGenericControl row = new HtmlGenericControl("div");
                    row.Attributes.Add("class", "row");

                    HtmlGenericControl col3 = new HtmlGenericControl("div");
                    col3.Attributes.Add("class","col-md-3");

                    LinkButton imgLinkButton = new LinkButton();
                    imgLinkButton.ID = "img-n" + i + "-" + DatacurrentOrder["prodID"];
                    imgLinkButton.Click += new EventHandler(showProd);

                        HtmlGenericControl img = new HtmlGenericControl("img");
                        img.Attributes.Add("src", "/img/" + DatacurrentOrder["prodID"] + ".jpeg");
                        img.Attributes.Add("class", "img-fluid");
                    imgLinkButton.Controls.Add(img);

                    HtmlGenericControl col5 = new HtmlGenericControl("div");
                    col5.Attributes.Add("class", "col-md-5");

                    HtmlGenericControl h5 = new HtmlGenericControl("h5");

                    LinkButton nameLinkButton = new LinkButton();
                    nameLinkButton.ID = "name-" + i + "-" + DatacurrentOrder["prodID"];
                    nameLinkButton.Click += new EventHandler(showProd);
                    nameLinkButton.Text = DatacurrentOrder["prodName"].ToString();
                    nameLinkButton.Attributes.Add("class", "linkProd");

                    h5.Controls.Add(nameLinkButton);

                    HtmlGenericControl br1 = new HtmlGenericControl("br");
                    HtmlGenericControl br2 = new HtmlGenericControl("br");

                    HtmlGenericControl h6 = new HtmlGenericControl("h6");
                    h6.Attributes.Add("style", "float: left; margin-right: 5px;");
                    h6.InnerText = "Qnta:";

                    HtmlGenericControl select = new HtmlGenericControl("div");
                    select.Attributes.Add("class", "form-control");
                    select.Attributes.Add("style", "float: left; width: auto; min-width: 40px; text-align: center");
                    select.InnerHtml = "<option>" + DatacurrentOrder["nOrdered"] + "</option>";

                    HtmlGenericControl div21 = new HtmlGenericControl("div");
                    div21.Attributes.Add("class", "col-md-2");

                    HtmlGenericControl col2 = new HtmlGenericControl("div");
                    col2.Attributes.Add("class", "col-md-2");
                    col2.InnerHtml = "<b> " + (Convert.ToInt32(DatacurrentOrder["prize"]) * Convert.ToInt32(DatacurrentOrder["nOrdered"])) + @",00€</b>";

                    col3.Controls.Add(imgLinkButton);

                    col5.Controls.Add(h5);
                    col5.Controls.Add(br1);
                    col5.Controls.Add(br2);
                    col5.Controls.Add(h6);
                    col5.Controls.Add(select);

                    row.Controls.Add(col3);
                    row.Controls.Add(col5);
                    row.Controls.Add(div21);
                    row.Controls.Add(col2);

                    padd.Controls.Add(row);

                    
                    centerOrder.Controls.Add(padd);

                    i++;
                }

                HtmlGenericControl topOrder = new HtmlGenericControl("div");
                topOrder.Attributes.Add("class", "topOrder");
                topOrder.InnerHtml = @" 
                    <div class='row'>
                            <div class='col-md-1'></div>
                            <div class='col-md-2'>
                                <b>Ordine effetuato il:</b>
                                " + serverDataRow["dateOrder"].ToString().Split(' ')[0] + @"        </div>
                            <div class='col-md-2'>
                            </div>
                            <div class='col-md-4'>
                                <b>Codice Ordine:</b><br>
                                " + serverDataRow["orderID"] + @"        </div>
                            <div class='col-md-2'>
                                <b>Totale Ordine:</b><br>
                                " + totaleOrdine + @" €
                            </div>
                            <div class='col-md-1'></div>
                        </div>";

                ordini.Controls.Add(topOrder);
                ordini.Controls.Add(centerOrder);
                ordini.Controls.Add(new HtmlGenericControl("br"));

               
            }


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void showProd(object sender, EventArgs e)
        {
            LinkButton source = (LinkButton)sender;
            Session["prodId"] = source.ID.Split('-')[2];
            Response.Redirect("ShowProduct.aspx");
        }
    }
}