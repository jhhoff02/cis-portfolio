using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CIS411HA2JessicaHoffman.MyClasses
{
    public class Account
    {
        private string _type;
        private double _balance;
        private string _nickname;
        public String Type {
            get {
                return _type;
            }
            set {
                _type = value;
            }
        }
        public double Balance {
            get
            {
                return _balance;
            }
            set
            {
                _balance = value;
            }
        }
        public String Nickname {
            get
            {
                return _nickname;
            }
            set
            {
                _nickname = value;
            }
        }

        public Boolean hasLoanOffer(double balance)
        {
            if (_balance > 15000)
            {
                return true;
            }
            else {
                return false;
            }
        }
    }
}