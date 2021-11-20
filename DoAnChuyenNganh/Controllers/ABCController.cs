using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnChuyenNganh.Models;
using PagedList;
using PagedList.Mvc;

namespace DoAnChuyenNganh.Controllers
{
    public class ABCController : Controller
    {
        dbYTDataContext data = new dbYTDataContext();
        
        public ActionResult Index()
        {
         
            return View();
        }
        public List<Product> GetProducts(int count)
        {
            return data.Products.OrderByDescending(a => a.namepro).Take(count).ToList();
        }
        public ActionResult Product()
        {
            var product = from pro in data.Products select pro;
            return PartialView(product);
        }
        public ActionResult Details(int ?id)
        {
            var pro = from s in data.Products
                       where s.idpro == id
                       select s;
            return View(pro.SingleOrDefault());
        }

        public ActionResult All()
        {
            var cate = (from p in data.Categories join a in data.Products on p.idcate equals a.idcate where p.CStatus == true select p).Distinct();
            return PartialView(cate);
        }
        public ActionResult ProductAll(int id)
        {
            var proall = from s in data.Products where s.idcate == id select s;
            return View(proall);
        }
        public ActionResult NewestProduct()
        {
            var newpro = data.Products.OrderByDescending(p => p.idpro).Take(2);
            return PartialView(newpro);
        }
        public ActionResult Corporate()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Search(string search)
        {
            var pro = GetProducts(0);

            if (search == "" || search == null)
            {
                ViewData["tb1"] = "There are no products searched ";
                return View(pro);
            }
            else
            {
                ViewBag.keyword = search;
            }
            return View(data.Products.Where(s => s.namepro.Contains(search)).ToList());

            
        }
    }
}