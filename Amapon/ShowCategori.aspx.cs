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
    public partial class ShowCategori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (Session["search"] == null)
                    Response.Redirect("Default.aspx");
                else
                {
                    string strSQL = string.Empty;
                    adoNet adoWeb = new adoNet();

                    strSQL = @"SELECT DISTINCT  * FROM 
                                    (SELECT macrocategories.*,categories.id as id FROM categories INNER JOIN macrocategories ON macrocategories.catID = categories.mid) as categories
                                 INNER JOIN products ON categories.id=products.cID
                              WHERE categories.catID=1";

                    /*grdMovimenti.AutoGenerateColumns = false;
                    grdMovimenti.DataSource = adoWeb.eseguiQuery(strSQL, CommandType.Text);
                    grdMovimenti.DataBind();*/

                    DataTable serverData = new DataTable();
                    serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);


                    int i = 0;
                    foreach (DataRow product in serverData.Rows)
                    {
                        HtmlGenericControl mainDiv = new HtmlGenericControl("div");
                        mainDiv.ID = "mainDiv" + i;
                        mainDiv.Attributes.Add("class", "col-md-3 wrapper");

                        HtmlGenericControl cardContainer = new HtmlGenericControl("div");
                        cardContainer.ID = "cardContainer" + i;
                        cardContainer.Attributes.Add("class", "card-container");


                        LinkButton LinkButton = new LinkButton();
                        LinkButton.ID = "img-prodId-" + product["prodID"]; //product["prodID"].ToString();
                        LinkButton.Click += new EventHandler(Alert);


                        HtmlGenericControl img = new HtmlGenericControl("img");
                        img.ID = "Img" + i;
                        img.Attributes.Add("src", "https://sanino.altervista.org/Amapon/productsImages/" + product["prodID"] + ".jpeg");
                        img.Attributes.Add("style", "width: 100%;");

                        HtmlGenericControl br = new HtmlGenericControl("br");

                        HtmlGenericControl b = new HtmlGenericControl("b");
                        if (product["prodName"].ToString().Length < 74)
                            b.InnerText = product["prodName"].ToString();
                        else
                            b.InnerText = product["prodName"].ToString().Substring(0, 71) + "..";

                        HtmlGenericControl b2 = new HtmlGenericControl("b");
                        b2.InnerText = product["prize"].ToString() + "€";

                        LinkButton LinkButton2 = new LinkButton();
                        LinkButton2.ID = "link-prodId-" + product["prodID"];//product["prodID"].ToString();
                        LinkButton2.Click += new EventHandler(Alert);


                        HtmlGenericControl small = new HtmlGenericControl("small");
                        small.InnerText = "Scopri di più";

                        LinkButton.Controls.Add(img);
                        cardContainer.Controls.Add(LinkButton);
                        cardContainer.Controls.Add(br);

                        HtmlGenericControl br1 = new HtmlGenericControl("br");
                        cardContainer.Controls.Add(br1);
                        cardContainer.Controls.Add(b);

                        HtmlGenericControl br2 = new HtmlGenericControl("br");
                        cardContainer.Controls.Add(br2);

                        cardContainer.Controls.Add(b2);

                        HtmlGenericControl br4 = new HtmlGenericControl("br");
                        cardContainer.Controls.Add(br4);

                        LinkButton2.Controls.Add(small);
                        cardContainer.Controls.Add(LinkButton2);

                        mainDiv.Controls.Add(cardContainer);
                        wrapper.Controls.Add(mainDiv);

                        i++;

                        /*
                        wrapper.Controls.Add(new LiteralControl(@"
                        <div class='col-md-3 wrapper' >
                            <div class='card-container'>
                            
                                <asp:LinkButton runat='server' OnClick='Alert' href='#' >
                                    <img src='https://sanino.altervista.org/Amapon/productsImages/" + product["prodID"] + @".jpeg' style='width: 100%;'>
                                </asp:LinkButton>
                                <br><br>
                                <b>
                                    " + product["prodName"]+ @"
                                </b>
                                <br><br>
                                <b>
                                1999€
                                </b>
                                <br>
                                <br>
                                <a href ='?show=25' ><small> Scopri di più</small></a>
                            </div>
                        </div>"));

                        */

                    }
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void Alert(object sender, EventArgs e)
        {
            LinkButton source = (LinkButton)sender;
            Session["prodId"] = source.ID.Split('-')[2];
            Response.Redirect("ShowProduct.aspx");
        }
    }
}