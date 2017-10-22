using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LapTrinhWeb.Models;
using PagedList;
using PagedList.Mvc;
namespace LapTrinhWeb.Controllers
{
    public class LKDTController : Controller
    {
        dbQLBNLKDTDataContext data = new dbQLBNLKDTDataContext();
        // GET: LKDT
        private List<SanPham> LaySPmoi(int count)
        {
            return data.SanPhams.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        //private List<SanPham> LayTaiNgheMoi (int count)
        //{
        //    var a = from sp in data.SanPhams
        //            where sp.MaLoai == 1
        //            select sp;
        //    return a.OrderByDescending(b => b.Ngaycapnhat).Take(count).ToList();
        //}
        public ActionResult LoaiSP()
        {
            var loai = from l in data.LoaiSPs select l;
            return PartialView(loai);
        }
        public ActionResult NhaSX()
        {
            var nsx = from n in data.HangSanXuats select n;
            return PartialView(nsx);
        }
        public ActionResult Index(int ? page)
        {
            int pageSize = 5;
            int pageNum = (page ?? 1);
            //var tainghe = LayTaiNgheMoi(5);
            var spmoi = LaySPmoi(10);
            return View(spmoi.ToPagedList(pageNum,pageSize));
        }
        public ActionResult TheoSP(int id, int ? page)
        {
            int pageSize = 10;
            int pageNum = (page ?? 1);
            var a = from sp in data.SanPhams where sp.MaLoai == id select sp;
            return View(a.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Chitiet(int id)
        {
            var sp = from s in data.SanPhams
                     where s.MaSP == id
                     select s;
            return View(sp.Single());
        }
        public ActionResult TheoHang(int id,int ? page)
        {
            int pageSize = 10;
            int pageNum = (page ?? 1);
            var a = from sp in data.SanPhams where sp.MaHSX == id select sp;
            return View(a.ToPagedList(pageNum, pageSize));
        }
    }
}