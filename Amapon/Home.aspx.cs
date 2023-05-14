using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Amapon
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Codice"] == null)
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            { 
            
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void ShowCategori_Redirect(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            Session["search"] = button.ID.Split('_')[1];
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            Response.Redirect("ShowCategori.aspx");
        }
    }
}