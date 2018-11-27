using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS411HA2JessicaHoffman.MyClasses;

namespace CIS411HA2JessicaHoffman
{
    public partial class AccountSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            GenerateSessionObjects sessionObj = new GenerateSessionObjects();

            Customer cust = (Customer)sessionObj.GenerateSessionsObjects().Session["customer"];
            List<Account> acct = (List<Account>)Session["account"];

            foreach (var item in acct)
            {
                accountListBox.Items.Add(item.Nickname);
            }
            custLbl.Text = "Welcome " + cust.FullName;
        }

        protected void detailsBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("./AccountPages/AccountDetails.aspx");
        }
    }
}