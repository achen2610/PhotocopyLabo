using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Photocopy.Business
{
    public class tinTuc
    {
        public int TinTucID { get; set; }
        public string TinTucTitle { get; set; }
        public string TinTucQuote { get; set; }
        public string TinTucImage { get; set; }
        public System.Nullable<System.DateTime> TinTucPostDate { get; set; }
        public bool? TinTucHot { get; set; }
        public string TinTucContent { get; set; }
    }
}