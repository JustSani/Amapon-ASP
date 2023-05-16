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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            adoNet.impostaConnessione("App_Data/Amapon.mdf");
        }

        protected void registra(object sender, EventArgs eventArgs)
        {

            string susername = username.Value;
            string semail = email.Value;
            string spassword = password.Value;
            string sname = name.Value;
            string ssurname = surname.Value;
            string stype = type.Value;

            adoNet adoWeb = new adoNet();
            string strSQL;
            strSQL = "SELECT max(userID) FROM users";

            string cod = adoWeb.eseguiScalar(strSQL, CommandType.Text);

            int userID = Convert.ToInt32(cod) + 1;
            strSQL = @"INSERT INTO users (userID, username, password, type, wallet, email, Name, Surname)
                            VALUES (" + userID + ", '" + susername + "', '"+ spassword + "', '"  + stype + "', 10000, '" + semail + "' ,  '" + sname + "', '" + ssurname + "')";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Miao')", true);

            adoWeb.eseguiNonQuery(strSQL, CommandType.Text);
            Response.Redirect("Default.aspx");

        }
    }
}