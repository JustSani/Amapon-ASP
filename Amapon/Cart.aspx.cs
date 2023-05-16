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
    public partial class cart : System.Web.UI.Page
    {

        int totaleOrdine = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Codice"] == null)
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
                adoNet.impostaConnessione("App_Data/Amapon.mdf");

            string strSQL = string.Empty;
            adoNet adoWeb = new adoNet();

            strSQL = @"SELECT cart.prodID as prodID, prodName, nAdded, prize FROM cart INNER JOIN products as product ON cart.prodID = product.prodID
                              WHERE cart.userID=" + Session["codice"];

            DataTable serverData = new DataTable();
            serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);

            int i = 0;
            if (serverData.Rows.Count == 0) { 
                cart1.InnerText = "Carrello vuoto :(";
                Totale.InnerText = "0,00€";
                btnConferma.Disabled = true;
            }

            foreach (DataRow serverDataRow in serverData.Rows) {
                totaleOrdine += Convert.ToInt32(serverDataRow["prize"]) * Convert.ToInt32(serverDataRow["nAdded"]);

                HtmlGenericControl row = new HtmlGenericControl("div");
                row.Attributes.Add("class", "row");

                //firse col
                HtmlGenericControl firstCol = new HtmlGenericControl("div");
                firstCol.Attributes.Add("class", "col-3");
                    // link
                    LinkButton linkProd = new LinkButton();
                    linkProd.ID = "img-click-" +serverDataRow["prodID"];
                    linkProd.Click += new EventHandler (showProduct);

                    // image
                    HtmlGenericControl img = new HtmlGenericControl("img");
                    img.Attributes.Add("class", "img-fluid");
                    img.Attributes.Add("src", "img/" + serverDataRow["prodID"] + ".jpeg");
                    
                    linkProd.Controls.Add(img);

                firstCol.Controls.Add(linkProd);
                    
                //second col
                HtmlGenericControl secondCol = new HtmlGenericControl("div");
                secondCol.Attributes.Add("class", "col-5");
                    HtmlGenericControl h5 = new HtmlGenericControl("h6");

                    
                    LinkButton namelinkButton = new LinkButton();
                    namelinkButton.ID = "name-click-" + serverDataRow["prodID"];
                    namelinkButton.Click += new EventHandler(showProduct);
                    namelinkButton.Text = serverDataRow["prodName"].ToString();
                    namelinkButton.CssClass = " linkProd";
                    h5.Controls.Add(namelinkButton);

                    HtmlGenericControl small = new HtmlGenericControl("small");
                    small.InnerText = "Disponibilità immediata";
                    small.Attributes.Add("style", "color: green");

                    HtmlGenericControl br1 = new HtmlGenericControl("br");
                    HtmlGenericControl br2 = new HtmlGenericControl("br");

                    HtmlGenericControl qnt = new HtmlGenericControl("div");
                    qnt.InnerText = "Qnta: " + serverDataRow["nAdded"];
                    
                secondCol.Controls.Add(h5);
                secondCol.Controls.Add(small);



                //third col
                HtmlGenericControl thirdCol = new HtmlGenericControl("div");
                thirdCol.Attributes.Add("class", "col-2");
                    HtmlGenericControl b = new HtmlGenericControl();
                    b.InnerText = (Convert.ToInt32(serverDataRow["prize"]) * Convert.ToInt32(serverDataRow["nAdded"])) + ",00 €";
                    
                    HtmlGenericControl br3 = new HtmlGenericControl("br");

                    LinkButton remove = new LinkButton();
                    remove.ID = "remove-click-" + serverDataRow["prodID"];
                    remove.Click += new EventHandler(removeClick);
                    remove.Text = "Rimuovi";
                    remove.CssClass = " linkProd";

                    thirdCol.Controls.Add(b);
                    thirdCol.Controls.Add(br3);
                    thirdCol.Controls.Add(remove);

                    thirdCol.Controls.Add(qnt);


                
                row.Controls.Add(firstCol);
                row.Controls.Add(secondCol);
                row.Controls.Add(thirdCol);


                HtmlGenericControl center = new HtmlGenericControl("center");
                HtmlGenericControl hr = new HtmlGenericControl("hr");
                hr.Attributes.Add("style", "width: 70%; margin-bottom: 40px; text-align: center");
                center.Controls.Add(hr);
                cart1.Controls.Add(center);


                cart1.Controls.Add(row);

                i++;
            }


            Totale.InnerText = totaleOrdine + ",00€";


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void showProduct(object sender, EventArgs e)
        {
            LinkButton source = (LinkButton)sender;
            Session["prodId"] = source.ID.Split('-')[2];
            Response.Redirect("ShowProduct.aspx");
        }

        protected void removeClick(object sender, EventArgs e)
        {
            LinkButton source = (LinkButton)sender;
            int prodID= Convert.ToInt32(source.ID.Split('-')[2]);

            string strSQL = string.Empty;
            adoNet adoWeb = new adoNet();

            strSQL = @"DELETE FROM cart WHERE userID=" + Session["Codice"] + " AND prodID=" + prodID +";";

            adoWeb.eseguiNonQuery(strSQL, CommandType.Text);

            Response.Redirect ("Cart.aspx");
        }

        protected void Ordina(object sender, EventArgs e)
        {
            Session["totale"] = totaleOrdine;
            Response.Redirect("Pagamento.aspx");
        }
    }
}