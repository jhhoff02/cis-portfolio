using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS411HA2JessicaHoffman.MyClasses;

namespace CIS411HA2JessicaHoffman
{
    public partial class AccountDetails : System.Web.UI.Page
    {
        private static double currentAccountBal;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["currentAccountBal"] = currentAccountBal;
            if (PreviousPage != null)
            {
                string url = PreviousPage.ToString();

                if (url.Contains("summary"))
                {
                    updateBalance();
                    ListBox listbox = (ListBox)PreviousPage.FindControl("accountListBox");
                    int index = listbox.SelectedIndex;

                    List<Account> acct = (List<Account>)Session["account"];
                    Customer cust = (Customer)Session["customer"];

                    nameLbl.Text = acct[index].Nickname;
                    Session["name"] = acct[index].Nickname;

                    typeLbl.Text = acct[index].Type;
                    Session["type"] = acct[index].Nickname;

                    currentAccountBal = acct[index].Balance;


                    double newcurrentAccountBal = (double)(Session["currentAccountBal"]);
                    balanceLbl.Text = newcurrentAccountBal.ToString("c");

                    if (currentAccountBal > 1)
                    {
                        loanLbl.Text = "True";
                        Session["loan"] = "True";
                    }
                    else
                    {
                        loanLbl.Text = "False";
                        Session["loan"] = "False";
                    }
                    addressLbl.Text = cust.FullAddress;
                    Session["addr"] = cust.FullAddress;
                }
                else if (url.Contains("loan")) //came from loan page
                {
                    loanLbl.Text = "came from loan";

                    double newcurrentAccountBal = (double)(Session["currentAccountBal"]);
                    balanceLbl.Text = newcurrentAccountBal.ToString("c");


                    string name = (String)(Session["name"]);
                    string type = (String)(Session["type"]);
                    string loan = (String)(Session["loan"]);
                    string addr = (String)(Session["addr"]);

                    nameLbl.Text = name;
                    typeLbl.Text = type;
                    loanLbl.Text = loan;
                    addressLbl.Text = addr;
                }
                withdrawBtn_Click(sender, e);
            }
        }

        protected void withdrawBtn_Click(object sender, EventArgs e)
        {
            withdrawMessage.Text = "";
            withdrawStatus.Text = "";

            double withdrawRequested;
            double.TryParse(withdrawTxt.Text, out withdrawRequested);

            if (withdrawRequested < currentAccountBal)
            {
                currentAccountBal -= withdrawRequested;
                withdrawStatus.Text = "Success";
                withdrawStatus.ForeColor = System.Drawing.Color.Green;
                withdrawMessage.Text = withdrawRequested.ToString("c") + " withdrawn. Check new balance.";
                updateBalance();
            }
            else
            {
                withdrawStatus.Text = "Failure";
                withdrawStatus.ForeColor = System.Drawing.Color.Red;
                withdrawMessage.Text = withdrawRequested.ToString("c") + " requested. Please enter a value less than balance.";
            }
        }
        public void updateBalance()
        {
            Session["currentAccountBal"] = currentAccountBal;
            balanceLbl.Text = currentAccountBal.ToString("c");
        }
    }
}