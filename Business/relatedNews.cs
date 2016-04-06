using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Photocopy.Business
{
    public class relatedNews
    {
        public int relatedNewsID { get; set; }
        public int? sanPhamID { get; set; }
        public string relatedNewsName { get; set; }
        public string relatedNewsLink { get; set; }
        public int? tinTucID { get; set; }
        public bool EnableRN { get; set; }
    }
}
