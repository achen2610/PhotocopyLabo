using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Photocopy.Business;
using Photocopy.Model;

namespace Photocopy
{
    public partial class RentServices : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRepeater();
                
            }
        }
        private void bindRepeater()
        {
            ProductData product = new ProductData();
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = 12;
            CollectionPager1.DataSource = product.getRentProduct();
            CollectionPager1.BindToControl = RptRentPhotocopy;
            RptRentPhotocopy.DataSource = CollectionPager1.DataSourcePaged;
            RptRentPhotocopy.DataBind();

        }

        //Phiên bản 2 ----------------------------------------------------------------------------
        //protected void RptRentPhotocopy_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbsp2");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        Session["sanpham"] = product.getProduct(SanphamID);
        //        Response.Redirect("chi-tiet-san-pham");
        //    }
        //}
        //------------------------------------------------------------------------------------------
    }
}