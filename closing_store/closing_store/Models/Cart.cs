using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace closing_store.Models
{
    public class Cart
    {
        public int product_id { set;get;}
         public string product_name { set;get;}
         public int product_price { set;get;}
         public int quantity { set;get;}
         public int product_total { set;get;}
        public string product_img  { set;get;}
    }
}