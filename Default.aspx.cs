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
    public partial class Default1 : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Product"] = null;

                rpRentProduct.DataSource = pd.getRentProduct().Take(4);
                rpRentProduct.DataBind();

                foreach (RepeaterItem item in rpRentProduct.Items)
                {
                    Label lbSPID = (Label)item.FindControl("lbsp3");
                    Repeater rpOption10 = (Repeater)item.FindControl("rp1Option10");
                    rpOption10.DataSource = pd.getOption8(Int32.Parse(lbSPID.Text));
                    rpOption10.DataBind();
                }

                RptRicohProduct.DataSource = pd.getProductWithBrandWithType("SX04","Photocopy").Take(4);
                RptRicohProduct.DataBind();

                foreach (RepeaterItem item in RptRicohProduct.Items)
                {
                    Label lbSPID = (Label)item.FindControl("lbsp1");
                    Repeater rpOption10 = (Repeater)item.FindControl("rp1Option10");
                    rpOption10.DataSource = pd.getOption8(Int32.Parse(lbSPID.Text));
                    rpOption10.DataBind();
                }

                RptHotBuyProduct.DataSource = pd.getHotBuyProduct();
                RptHotBuyProduct.DataBind();

                foreach (RepeaterItem item in RptHotBuyProduct.Items)
                {
                    Label lbSPID = (Label)item.FindControl("lbsp2");
                    Repeater rpOption10 = (Repeater)item.FindControl("rp2Option10");
                    rpOption10.DataSource = pd.getOption8(Int32.Parse(lbSPID.Text));
                    rpOption10.DataBind();
                }
                
                rpLastestNews.DataSource = pd.getListNews();
                rpLastestNews.DataBind();

                //List<ProductRP> newlist = new List<ProductRP>();
                //foreach (ProductRP p in pd.getSaleProduct())
                //{
                //    ProductRP newp = null;
                //    newp = ReturnDiscount(p);
                //    newlist.Add(newp);
                //}
                //RptSaleProduct.DataSource = newlist;
                //RptSaleProduct.DataBind();
            }
        }

        //Hàm kiểm tra loại giảm giá, trả về sản phẩm với đơn giá mới
        public ProductRP ReturnDiscount(ProductRP p)
        {
                p.DonGiaMoi = Math.Round(p.DonGia - ((p.DonGia * p.GiaGiam) / 100),5);
                return p;
        }


        protected void linkMore1_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Ricoh";
            Session["Type"] = "Photocopy";
            Response.Redirect("/may-photocopy");
        }

        

        protected void linkMore3_Click(object sender, EventArgs e)
        {
            Response.Redirect("/cho-thue-may-photocopy");
        }

        //Phiên bản 2

        //protected void rpRentProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbsp3");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        if (product.CheckSale(SanphamID) == true)
        //        {
        //            Session["sanpham"] = product.getProductSale(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //        else
        //        {
        //            Session["sanpham"] = product.getProduct(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //    }
        //}

        //protected void RptRicohProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbsp1");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        if (product.CheckSale(SanphamID) == true)
        //        {
        //            Session["sanpham"] = product.getProductSale(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //        else
        //        {
        //            Session["sanpham"] = product.getProduct(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //    }
        //}

        //protected void RptHotBuyProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbsp2");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        if (product.CheckSale(SanphamID) == true)
        //        {
        //            Session["sanpham"] = product.getProductSale(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //        else
        //        {
        //            Session["sanpham"] = product.getProduct(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //    }
        //}

        //protected void rpLastestNews_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    switch (e.CommandName)
        //    {
        //        case "GetNewsDetail":
        //            Label id = (Label)e.Item.FindControl("lbNewsID");
        //            tinTuc tt = pd.getNewsDetail(Int32.Parse(id.Text));
        //            Session["TinTuc"] = tt;
        //            Response.Redirect("tin-chi-tiet");
        //            break;
        //    }
        //}

        //protected void RptSaleProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbsp3");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        if (product.CheckSale(SanphamID) == true)
        //        {
        //            Session["sanpham"] = product.getProductSale(SanphamID);
        //            Response.Redirect("ProductDetails.aspx");
        //        }
        //        else
        //        {
        //            Session["sanpham"] = product.getProduct(SanphamID);
        //            Response.Redirect("ProductDetails.aspx");
        //        }
        //    }
        //}

        //------------------------------------------------------------------------------------------------
    }
}