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

                strSQL = @"SELECT * FROM 
                            (SELECT macrocategories.*,categories.id as id FROM categories INNER JOIN macrocategories ON macrocategories.catID = categories.mid) as categories
                             INNER JOIN products ON categories.id=products.cID
                          WHERE categories.catID=1";

                /*grdMovimenti.AutoGenerateColumns = false;
                grdMovimenti.DataSource = adoWeb.eseguiQuery(strSQL, CommandType.Text);
                grdMovimenti.DataBind();*/

                DataTable serverData = new DataTable();
                serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);

                foreach(DataRow product in serverData.Rows)
                {
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
                    
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void Alert(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        }
    }
}