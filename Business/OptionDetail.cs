using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Photocopy.Business
{
    public class OptionDetail
    {
        public int OptionID { get; set; }
        public int? SanPhamID { get; set; }
        public string OptionName { get; set; }
        public string OptionDescription { get; set; }
        public bool EnableOp { get; set; }
        public OptionDetail() { }
    }
}