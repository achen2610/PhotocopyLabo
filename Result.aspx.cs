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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lbnotification.Visible = false;
                lbnotification.Text = "";
            }
            string chuoi = "";
            chuoi = (String)Session["Search"];

            ProductData pd = new ProductData();
            List<ProductRP> list = new List<ProductRP>();
            list = pd.returnResultProduct(chuoi);
            if (list.Count() == 0)
            {
                lbnotification.Visible = true;
                lbnotification.Text = "Không tìm thấy";
            }
            else
            {
                rptSearch.DataSource = list;
                rptSearch.DataBind();
            }


        }


        //Phiên bản 2 ----------------------------------------------------------------------
        //protected void rptSearch_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbIDSP");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        if (product.CheckSale(SanphamID) == true)
        //        {
        //            Session["sanpham"] = product.getProductSale(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham");
        //        }
        //        else
        //        {
        //            Session["sanpham"] = product.getProduct(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham");
        //        }
        //    }
        //}

        //-----------------------------------------------------------------------------------

    }
}