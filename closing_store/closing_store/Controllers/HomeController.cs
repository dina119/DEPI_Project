
using closing_store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Transactions;
using System.Web;
using System.Web.Mvc;

namespace closing_store.Controllers
{
    public class HomeController : Controller
    {
       Closing_storeEntities db =new Closing_storeEntities();

        List<Cart>li=new List<Cart>();
       
         
        public ActionResult Index(string search)
        {
           List<product> list=db.products.Where(x=>x.name==search||search==null).ToList();
            if (Session["cart"] != null)
            {
                int x=0;
                 List<Cart> li3 = Session["cart"]as List<Cart>;
                foreach(var item in li3)
                {
                     x+=item.product_total;
                }
               Session["Total"]=x;
            }
           
            return View(list);
            
        }

    

        public ActionResult Signup()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Signup(customer customerr) {
            if (db.customers.Any(x => x.UserName == customerr.UserName))
            {
                ViewBag.Notfication="this account is alresdy exist";
                return View();
            }
            else
            {
                db.customers.Add(customerr);
                db.SaveChanges();
                Session["Ids"]=customerr.id.ToString();
                Session["UserNames"]=customerr.UserName.ToString();
               return RedirectToAction("Index","Home");
            }


        
        }
        [HttpGet]

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
         public ActionResult Login(customer customerr) {
             
            var chechLogin=db.customers.Where(x=>x.UserName.Equals(customerr.UserName)&&x.password.Equals(customerr.password)).FirstOrDefault();
           
            
          if (chechLogin != null)
            {
                 Session["Ids"]=customerr.id.ToString();
                 Session["Id"]=chechLogin.id;
                Session["UserNames"]=customerr.UserName.ToString();
                 Session["Passwords"]=customerr.password.ToString();
               
                if (Session["UserNames"].Equals("ali"))
                {
                    return RedirectToAction("Index", "products");
                }


               
                  return RedirectToAction("Index","Home");


            }

           
            else
            {
                ViewBag.Notification="Wrong username or password";
                
            }
           return View();
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index","Home");
        }

        public ActionResult details(int? id)
        {

            var query = db.products.Where(x => x.id == id).SingleOrDefault();
            return View(query);
        }


        [HttpPost]
         public ActionResult details(int id,int quantity)
        {

              product p=db.products.Where(x=>x.id==id).SingleOrDefault();
            Cart c=new Cart();
            c.product_id=id;
            c.product_name=p.name;
            c.product_img=p.image;
            c.product_price=Convert.ToInt32(p.price);
            c.quantity=Convert.ToInt32(quantity);
            c.product_total=c.product_price*c.quantity;
            if (Session["cart"] == null)
            {
                li.Add(c);
                Session["cart"]=li;

            }
            else
            {
                
                List<Cart> li2 = Session["cart"]as List<Cart>;
               
                var flag=0;
               
                foreach(var item in li2)
                {
                    
                    if (item.product_id == c.product_id)
                    {
                        item.quantity+=c.quantity;
                        item.product_total+=c.product_total;
                        flag=1;
                    }
                   

                }
                 
                if (flag == 0)
                {
                    li2.Add(c);
                    
                }
                Session["cart"]=li2;
               
            }
             
            return RedirectToAction("Index","Home");
       }

        public ActionResult AddToCart()
        {
           
            return View();
        }

        public ActionResult CheckOut()
        {
         List<Cart> li2 = Session["cart"]as List<Cart>;
            transaction t = new transaction();
            t.customer_id =Convert.ToInt32(Session["Id"]);
            t.date=System.DateTime.Now;
            t.total_price = (int)Session["Total"];
            db.transactions.Add(t);
            db.SaveChanges();
            foreach(var item in li2)
            {
                order o = new order();
                o.pro_id=item.product_id;
                o.order_date=System.DateTime.Now;
                o.pro_price=item.product_price;
                o.qty=item.quantity;
                o.order_total=item.product_total;
                o.transaction_id=t.id;

                db.orders.Add(o);
                 db.SaveChanges();
            }
            Session.Remove("cart");
            Session.Remove("Total");
            Session["msg"]="order book successfully!";
            return RedirectToAction("Index","Home");
        }

        public ActionResult GetAllOrders()
        {
            var query=db.getallorders2.ToList();
            return View(query);
        }
       
       
       

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

      
       
        public ActionResult Shop(string search)
        {
            List<product> list=db.products.Where(x=>x.name==search||search==null).ToList();
           
            return View(list);
           
        }
       

      
    }
}