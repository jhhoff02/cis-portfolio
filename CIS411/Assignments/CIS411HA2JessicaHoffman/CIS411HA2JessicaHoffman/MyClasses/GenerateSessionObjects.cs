using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CIS411HA2JessicaHoffman.MyClasses
{
    public class GenerateSessionObjects
    {
        List<Account> list = new List<Account>();

        public HttpContext GenerateSessionsObjects()
        {
            Account act1 = new Account();
            Account act2 = new Account();
            Account act3 = new Account();

            act1.Type = "Checking";
            act1.Balance = 14990.30;
            act1.Nickname = "First Checking";

            act2.Type = "Checking";
            act2.Balance = 27800.99;
            act2.Nickname = "Second Checking";

            act3.Balance = 58950.20;
            act3.Type = "Savings";
            act3.Nickname = "Savings";

            list.Add(act1);
            list.Add(act2);
            list.Add(act3);

            Customer cust = new Customer("Jessica Hoffman", "120 Main St., \nLouisville, KY 40220");

            HttpContext.Current.Session["customer"] = cust;
            HttpContext.Current.Session["account"] = list;

            return HttpContext.Current;
        }
    }
}