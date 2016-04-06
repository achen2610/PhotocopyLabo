using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Photocopy.Business
{
    public class ProductRP
    {
        public int ID { get; set; }
        public int SanPhamID { get; set; }
        public string MaSanPham { get; set; }
        public string MaSanXuat { get; set; }
        public string TenSanPham { get; set; }
        public string LoaiMay { get; set; }
        public decimal DonGia { get; set; }
        public System.Nullable<System.DateTime> NgayNhapHang { get; set; }
        public int? SoLuong { get; set; }
        public string HinhAnh { get; set; }
        public int? LuotXem { get; set; }
        public bool? ChoThue { get; set; }
        public bool? Hot { get; set; }
        public string Gia { get; set; }
        public string NhaSanXuat { get; set; }
        public bool? Enable { get; set; }
        public int SaleID { get; set; }
        public int GiaGiam { get; set; }
        public bool LoaiGiam { get; set; }
        public DateTime NgayApDung { get; set; }
        public DateTime NgayHetHan { get; set; }
        public decimal DonGiaMoi { get; set; }
        public ProductRP() { }
    }
}