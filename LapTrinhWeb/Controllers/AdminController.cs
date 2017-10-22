using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LapTrinhWeb.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace LapTrinhWeb.Controllers
{
    public class AdminController : Controller
    {
        dbQLBNLKDTDataContext db = new dbQLBNLKDTDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SP(int? page)
        {
            if (Session["admin"] == null)
            {
                return RedirectToAction("login_admin", "Admin");
            }
            int pageNum = (page ?? 1);
            int pageSize = 7;
            return View(db.SanPhams.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNum, pageSize));
        }
        [HttpGet]
        public ActionResult Themmoisanpham()
        {
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaHSX = new SelectList(db.HangSanXuats.ToList().OrderBy(n => n.TenNSX), "MaHSX", "TenNSX");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoisanpham(SanPham sp, HttpPostedFileBase fileupload)
        {
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaHSX = new SelectList(db.HangSanXuats.ToList().OrderBy(n => n.TenNSX), "MaHSX", "TenNSX");
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    sp.Anhbia = fileName;
                    db.SanPhams.InsertOnSubmit(sp);
                    db.SubmitChanges();
                }
                return RedirectToAction("SP");
            }
        }
        public ActionResult Chitietsanpham(int id)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        [HttpGet, ActionName("Xoasanpham")]
        public ActionResult Xoasanpham(int id)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.Masp = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SanPhams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("SP");
        }
        [HttpGet]
        public ActionResult Suasanpham(int id)
        {

            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
           
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaHSX = new SelectList(db.HangSanXuats.ToList().OrderBy(n => n.TenNSX), "MaHSX", "TenNSX");
            return View(sp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasanpham(SanPham sp, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaHSX = new SelectList(db.HangSanXuats.ToList().OrderBy(n => n.TenNSX), "MaHSX", "TenNSX");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    sp.Anhbia = fileName;
                    UpdateModel(sp);
                    db.SubmitChanges();
                }
                return RedirectToAction("SP");
            }
        }
        [HttpGet]
        public ActionResult login_admin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult login_admin(FormCollection collection)
        {
            var tendn = collection["adminname"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Bạn chưa nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Bạn chưa nhập password";
            }
            else
            {
                Admin ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    ViewBag.Thongbao = "Bạn đã đăng nhập thành công";
                    Session["admin"] = ad.PassAdmin;
                    return RedirectToAction("SP", "Admin");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return this.login_admin();
        }
    }
}