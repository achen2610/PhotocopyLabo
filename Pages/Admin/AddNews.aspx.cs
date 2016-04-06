using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Business;
using Photocopy.Model;

namespace Photocopy
{
    public partial class AddNews : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                bool b;
                tinTuc tt = new tinTuc();
                tt.TinTucID = 3;
                tt.TinTucTitle = txTitle.Text;
                tt.TinTucQuote = txQuote.Text;
                tt.TinTucPostDate = DateTime.Now;
                tt.TinTucImage = txImage.Text;
                tt.TinTucContent = CKEditor1.Text;
                if (cbHot.Checked == true)
                {
                    b = true;
                }
                else
                {
                    b = false;
                }
                tt.TinTucHot = b;
                pd.AddNews(tt);
                lbKetQua.Text = "Thêm thành công";
            }
            catch(Exception ex)
            {
                lbKetQua.Text = ex.ToString();
            }
        }


        
    }
}