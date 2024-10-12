
using closing_store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace closing_store.Controllers
{
    public class HomeController : Controller
    {
       Closing_storeEntities1 db =new Closing_storeEntities1();
         
        public ActionResult Index(string search)
        {
           List<product> list=db.products.Where(x=>x.name==search||search==null).ToList();
           
            return View(list);
            
        }
      

         public ActionResult details(int? id)
        {
           
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        
            
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
                Session["UserNames"]=customerr.UserName.ToString();
                 Session["Passwords"]=customerr.password.ToString();
                if (Session["UserNames"].Equals("ali"))
                {
                    return RedirectToAction("Index", "Home2");
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