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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["codice"] == null)
                Response.Redirect("Default.aspx");

            string strSQL = @"SELECT * FROM users WHERE userID=" + Session["codice"];
            DataTable serverData = new DataTable();

            adoNet adoWeb = new adoNet();
            serverData = adoWeb.eseguiQuery(strSQL, CommandType.Text);
            wallet.InnerText = "Wallet : " + serverData.Rows[0]["wallet"] + " €";
            username.Value = serverData.Rows[0]["username"].ToString();
            name.Value = serverData.Rows[0]["Name"].ToString();
            email.Value = serverData.Rows[0]["email"].ToString();
            surname.Value = serverData.Rows[0]["Surname"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void esci(object sender, EventArgs e)
        {
            Session["codice"] = "";

            Response.Redirect("Default.aspx");
        }
    }
}