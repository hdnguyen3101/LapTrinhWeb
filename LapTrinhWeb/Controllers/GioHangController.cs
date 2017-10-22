using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LapTrinhWeb.Models;
namespace LapTrinhWeb.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        dbQLBNLKDTDataContext data = new dbQLBNLKDTDataContext();
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if(lstGiohang ==null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang (int iMaSP,string strURL)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sp = lstGiohang.Find(n => n.iMaSP == iMaSP);
            if(sp == null)
            {
                sp = new GioHang(iMaSP);
                lstGiohang.Add(sp);
                return Redirect(strURL);
            }
            else
            {
                sp.iSoluong++;
                return Redirect(strURL);
            }
        }
        private int TongSL()
        {
            int iTongSL = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongSL = lstGiohang.Sum(n => n.iSoluong);
            }
            return iTongSL;
        }
        private Double TongTien()
        {
            Double iTongTien = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if(lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhtien);
            }
            return iTongTien;
        }
        public ActionResult GioHang()
        {
            List<GioHang> lstGH = Laygiohang();
            if(lstGH.Count == 0)
            {
                return RedirectToAction("Index", "LKDT");
            }
            ViewBag.Tongsoluong = TongSL();
            ViewBag.Tongtien = TongTien();
            return View(lstGH);
        }
        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSL();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }
        public ActionResult XoaGiohang (int iMaSP)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sp = lstGiohang.SingleOrDefault(n => n.iMaSP == iMaSP);
            if( sp != null)
            {
                lstGiohang.RemoveAll(n => n.iMaSP == iMaSP);
                return RedirectToAction("GioHang");
            }
            if(lstGiohang.Count==0)
            {
                return RedirectToAction("Index", "LKDT");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapnhatGiohang (int iMaSP, FormCollection f)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sp = lstGiohang.SingleOrDefault(n => n.iMaSP == iMaSP);
            if(sp != null)
            {
                sp.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatcaGiohang()
        {
            List<GioHang> lstGH = Laygiohang();
            lstGH.Clear();
            return RedirectToAction("Index", "LKDT");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if(Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "User");
            }
            if(Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "LKDT");
            }
            List<GioHang> lstGH = Laygiohang();
            ViewBag.Tongsoluong = TongSL();
            ViewBag.Tongtien = TongTien();
            return View(lstGH);
        }
        [HttpPost]
        public ActionResult DatHang (FormCollection collection)
        {
            DonDatHang ddh = new DonDatHang();
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            List<GioHang> gh = Laygiohang();
            ddh.MaKH = kh.MaKH;
            ddh.Ngaydat = DateTime.Now;
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["Ngaygiao"]);
            ddh.Ngaygiao = DateTime.Parse(ngaygiao);
            ddh.Tinhtranggiaohang = false;
            ddh.Dathanhtoan = false;
            data.DonDatHangs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            foreach ( var item in gh)
            {
                CHITIETDONTHANG ctdh = new CHITIETDONTHANG();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.MaSP = item.iMaSP;
                ctdh.Soluong = item.iSoluong;
                ctdh.Dongia = (decimal)item.dDongia;
                data.CHITIETDONTHANGs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "GioHang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}