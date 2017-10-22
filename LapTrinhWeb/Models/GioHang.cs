using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LapTrinhWeb.Models
{
    public class GioHang
    {
        dbQLBNLKDTDataContext data = new dbQLBNLKDTDataContext();
        public int iMaSP { set; get; }
        public string sTenSP { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }
        public GioHang(int MaSP)
        {
            iMaSP = MaSP;
            SanPham sp = data.SanPhams.Single(n => n.MaSP == iMaSP);
            sTenSP = sp.TenSP;
            sAnhbia = sp.Anhbia;
            dDongia = Double.Parse(sp.Giaban.ToString());
            iSoluong = 1;
        }
    }
}