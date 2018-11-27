using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS411HA2JessicaHoffman.MyClasses;

namespace CIS411HA2JessicaHoffman.AccountPages
{
    public partial class LoanApplicationPage : System.Web.UI.Page
    {
        private static double preservedBalance;
        protected void Page_Load(object sender, EventArgs e)
        {
            double currentAccountBal = (double)(Session["currentAccountBal"]);
            preservedBalance = currentAccountBal;

            if (PreviousPage != null)
            {
                Customer cust = (Customer)Session["customer"];
                nameLbl.Text = cust.FullName;
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            if (approvalStatus())
            {
                approvalLbl.Text = "Congratulations!! Your loan is approved.";
            }
            else
            {
                approvalLbl.Text = "Your loan is not approved. Sorry!!";
            }
        }
        public Boolean approvalStatus()
        {
            double salary;
            double.TryParse(salaryTxt.Text, out salary);
            double age;
            double.TryParse(ageTxt.Text, out age);
            double amount;
            double.TryParse(amountTxt.Text, out amount);

            double loanFormula = 0.5 * salary;

            if (age > 18 && amount < preservedBalance && amount < loanFormula)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}