using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CIS411HA2JessicaHoffman.MyClasses
{
    public class Customer
    {
        private string _address;
        private string _name;
        public String FullAddress {
            get
            {
                return _address;
            }
        }
        public String FullName {
            get
            {
                return _name;
            }
        }

        public Customer(String name, String address)
        {
            _name = name;
            _address = address;
        }
    }
}