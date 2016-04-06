using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Photocopy.Business
{
    public class SaleDetail
    {
        public int SaleID { get; set; }
        public int SanPhamID { get; set; }
        public int GiaGiam { get; set; }
        public DateTime NgayApDung { get; set; }
        public DateTime NgayHetHan { get; set; }
        public int DonGiaMoi { get; set; }

    }
}