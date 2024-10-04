
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