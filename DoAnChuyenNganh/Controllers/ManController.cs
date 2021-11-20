using DoAnChuyenNganh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnChuyenNganh.Controllers
{
    public class ManController : Controller
    {
        dbYTDataContext data = new dbYTDataContext();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult signin()
        {
            if (Session["Username"] != null) return RedirectToAction("Index", "ABC");
            return View();
        }

        
        [HttpPost]
        public ActionResult signin(FormCollection collection)
        {
           
            var hoten = collection["name"];
            var tendn = collection["username"];
            var matkhau = collection["password"];
            var matkhaunhaplai = collection["repassword"];
            var diachi = collection["address"];
            var email = collection["email"];
            var dienthoai = collection["phone"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["birth"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Customer name cannot be left blank ";
            }
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Username must be entered ";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Password must be entered ";
            }
            if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Password must be re-entered ";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email is not vacant ";
            }

            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi6"] = "Must enter phone ";
            }
            else
            {
                Man m = data.Mans.FirstOrDefault(p => p.username == tendn);
                if (m != null)
                {
                    ViewData["Loi2"] = "Tên tk đã tồn tại ";
                    return View("signin");
                }

                m = data.Mans.FirstOrDefault(p => p.email == email);
                if (m != null)
                {
                    ViewData["Loi5"] = "Email đã tồn tại ";
                    return View("signin");
                }
                
                Man kh = new Man();
                kh.name = hoten;

                kh.username = tendn;
                kh.password = matkhau;
                kh.email = email;
                kh.address = diachi;
                kh.phone = dienthoai;
                kh.birth = DateTime.Parse(ngaysinh);
                data.Mans.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("login", "Man");
            }
            return View("signin");
        }
       
        public ActionResult logout()
        {
            if (Session["Username"] == null) return RedirectToAction("login", "ABC");
            Session.Clear();
            return RedirectToAction("login", "Man");
        }

        public ActionResult login()
        {
            if (Session["Username"] != null) return RedirectToAction("Index", "ABC");
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            // Gán các giá trị người dùng nhập liệu cho các biến 
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "You must enter login name";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "You must enter login password";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)
                Man m = data.Mans.SingleOrDefault(n => n.username == tendn && n.password == matkhau);
                if (m != null)
                {
                    // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Username"] = m;
                    return RedirectToAction("Index", "ABC");
                }
                else
                    ViewBag.Thongbao = "Username or password is in correct";
            }
            return View();
        }     
    }
}
