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
                Response.Redirect("paginaErrore.aspx?errore=1");

            if (!Page.IsPostBack)
            { 
            
            }
        }
    }
}