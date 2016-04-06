using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Model;
using Photocopy.Business;

namespace Photocopy
{
    public partial class HotProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindRepeater();
            }
        }
        public void bindRepeater()
        {
            ProductData pd = new ProductData();
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = 12;
            CollectionPager1.DataSource = pd.getHotProduct();
            CollectionPager1.BindToControl = Repeater1;
            Repeater1.DataSource = CollectionPager1.DataSourcePaged;
            Repeater1.DataBind();
        }


        //Phiên bản 2 -------------------------------------------------------------------------
        //protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbSanphamID");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        Session["sanpham"] = product.getProduct(SanphamID);
        //        Response.Redirect("chi-tiet-san-pham");
        //    }
        //}
        //---------------------------------------------------------------------------------------

    }
}