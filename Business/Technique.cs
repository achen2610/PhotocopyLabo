using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Photocopy.Business
{
    public class Technique
    {
        public int TechniqueID { get; set; }
        public string TechniqueName { get; set; }
        public string TechniqueContent { get; set; }
        public System.Nullable<System.DateTime> PostDate { get; set; }
        public bool? EnableT { get; set; }

    }
}
