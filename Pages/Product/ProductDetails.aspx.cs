using Photocopy.Business;
using Photocopy.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Photocopy
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Test Routing------------------
                int id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                ProductRP sp = new ProductRP();
                sp = pd.getProduct(id);

                Page.Header.Controls.Add(c.AddMeta(1, "http://nhatthientan.com/chi-tiet-san-pham/" + sp.SanPhamID));
                Page.Header.Controls.Add(c.AddMeta(2, "website"));
                Page.Header.Controls.Add(c.AddMeta(3, sp.TenSanPham));

                List<ProductRP> list = new List<ProductRP>();
                list.Add(sp);
                rptFacebook.DataSource = list;
                rptFacebook.DataBind();

                //tăng view product ------------------------------------------------
                pd.IncreaseViewProduct(sp.SanPhamID);

                ProductRP newp = null;

                //Kiểm tra có giảm giá hay không ? ------------------------------------------------
                if (pd.CheckSale(sp.SanPhamID) == true)
                {
                    newp = ReturnDiscount(sp);
                    dongiagiagiam.Style.Add("display", "block !important");
                }
                else
                {
                    newp = sp;
                    dongiakhonggiam.Style.Add("display", "block !important");
                }

                if (newp.SoLuong != null)
                {
                    //Check còn hàng hay không------------------------------------------------
                    ReturnYesOrNoInStock(newp.SoLuong);
                }

                //Thông tin giá , tên , giảm giá ... của sản phẩm -----------------------------
                //decimal DonGia = newp.DonGia;
                //decimal DonGiaMoi = newp.DonGiaMoi;
                lblTenSanPham.Text = newp.TenSanPham;
                lblDonGia.Text = newp.Gia; //String.Format("{0:0,000} ₫", DonGia).Replace(",", ".");
                lbDonGia.Text = String.Format("{0:0,000} ₫", newp.DonGia).Replace(",", ".");
                lbDonGiaMoi.Text = String.Format("{0:0,000} ₫", newp.DonGiaMoi).Replace(",", ".");
                lbGiaGiam.Text = newp.GiaGiam.ToString();


                imgProductDetail.ImageUrl = "http://i1056.photobucket.com/albums/t378/hungld/Photocopy/" + newp.HinhAnh.ToString() + ".jpg";

                
                //--------------------------------------------------------------------------------
                // Hàm lấy thông tin chức năng chi tiết ----------------------------------------------
                RepeaterOption.DataSource = pd.GetOption(sp.SanPhamID);
                RepeaterOption.DataBind();
                
                // Hàm lấy sản phẩm cùng thương hiệu
                Random rn = new Random();
                RptSameBrand.DataSource = pd.getProductSameBrand(sp.MaSanXuat, sp.SanPhamID).OrderBy(x => rn.Next()).Take(4);
                RptSameBrand.DataBind();

                //foreach (RepeaterItem item in RptSameBrand.Items)
                //{
                //    Label lbSPID = (Label)item.FindControl("lbsp1");
                //    Repeater rpOption10 = (Repeater)item.FindControl("rpOption10");
                //    rpOption10.DataSource = pd.getOption8(Int32.Parse(lbSPID.Text));
                //    rpOption10.DataBind();
                //}




                //-----------------------------------
                //if (Session["sanpham"] != null)
                //{
                //    ProductRP product = new ProductRP();
                //    product = (ProductRP)Session["sanpham"];

                //    //tăng view product ------------------------------------------------
                //    pd.IncreaseViewProduct(product.SanPhamID);

                //    ProductRP newp = null;

                //    //Kiểm tra có giảm giá hay không ? ------------------------------------------------
                //    if(pd.CheckSale(product.SanPhamID)==true)
                //    {
                //        newp = ReturnDiscount(product);
                //        dongiagiagiam.Style.Add("display", "block !important");
                //    }
                //    else
                //    {
                //        newp = product;
                //        dongiakhonggiam.Style.Add("display", "block !important");
                //    }

                //    if (newp.SoLuong != null)
                //    {
                //        //Check còn hàng hay không------------------------------------------------
                //        ReturnYesOrNoInStock(newp.SoLuong);
                //    }

                //    //Thông tin giá , tên , giảm giá ... của sản phẩm -----------------------------
                //    //decimal DonGia = newp.DonGia;
                //    //decimal DonGiaMoi = newp.DonGiaMoi;
                //    lblTenSanPham.Text = newp.TenSanPham;
                //    lblDonGia.Text = newp.Gia; //String.Format("{0:0,000} ₫", DonGia).Replace(",", ".");
                //    lbDonGia.Text = String.Format("{0:0,000} ₫", newp.DonGia).Replace(",", ".");
                //    lbDonGiaMoi.Text = String.Format("{0:0,000} ₫", newp.DonGiaMoi).Replace(",", ".");
                //    lbGiaGiam.Text = newp.GiaGiam.ToString();


                //    imgProductDetail.ImageUrl = "http://i1056.photobucket.com/albums/t378/hungld/Photocopy/" + newp.HinhAnh.ToString() + ".jpg";
                    

                //    //--------------------------------------------------------------------------------
                //    // Hàm lấy thông tin chức năng chi tiết ----------------------------------------------
                //    RepeaterOption.DataSource = pd.GetOption(product.SanPhamID);
                //    RepeaterOption.DataBind();

                //    // Hàm lấy tin tức liên quan ---------------------------------------------------
                //    rptRelatedNews.DataSource = pd.getRelatedNews(product.SanPhamID);
                //    rptRelatedNews.DataBind();

                //    // Hàm lấy sản phẩm cùng thương hiệu
                //    Random rn = new Random();
                //    RptSameBrand.DataSource = pd.getProductSameBrand(product.MaSanXuat,product.SanPhamID).OrderBy(x => rn.Next()).Take(4);
                //    RptSameBrand.DataBind();

                //    foreach (RepeaterItem item in RptSameBrand.Items)
                //    {
                //        Label lbSPID = (Label)item.FindControl("lbsp1");
                //        Repeater rpOption10 = (Repeater)item.FindControl("rpOption10");
                //        rpOption10.DataSource = pd.getOption8(Int32.Parse(lbSPID.Text));
                //        rpOption10.DataBind();
                //    }
                    
                //    //int top = 4;
                //    //ViewState["top"] = top;
                //    //BindMessage(top);
                //}
                //else
                //{
                //    //Trả về trang sản phẩm
                //    Response.Redirect("san-pham");
                //}
            }
        }

        //Hàm trả về giá mới khi có giảm giá -----------------------------------------------------
        public ProductRP ReturnDiscount(ProductRP p)
        {
            p.DonGiaMoi = Math.Round(p.DonGia - ((p.DonGia * p.GiaGiam) / 100), 5);
            return p;
        }

        //Hàm kiểm tra hàng còn trong kho hay ko ?-------------------------------------
        public void ReturnYesOrNoInStock(int? soluong)
        {
            if (soluong != 0)
            {
                LBTinhTrang.Text = "Còn hàng";
                LBTinhTrang.CssClass = "conhang";
            }
            else
            {
                LBTinhTrang.Text = "Hết hàng";
                LBTinhTrang.CssClass = "hethang";
            }
        }


        //Phiên bản 2
        //protected void RptSameBrand_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbsp1");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);

        //        if (pd.CheckSale(SanphamID) == true)
        //        {
        //            Session["sanpham"] = pd.getProductSale(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //        else
        //        {
        //            Session["sanpham"] = pd.getProduct(SanphamID);
        //            Response.Redirect("chi-tiet-san-pham/" + SanphamID.ToString());
        //        }
        //    }
        //}

        //----------------------------------------------------------------------------



        // Các hàm xử lý bình luận , nhận xét.
        //public void BindMessage(int top)
        //{
        //    int rCount = rowCount();
        //    if(top >= rCount)
        //    {
        //        Button2.Text = "Hết";
        //    }
        //    ProductData dp = new ProductData();
        //    RepDetails.DataSource = dp.GetMessage(1,top);
        //    RepDetails.DataBind();
        //}
        //public int rowCount()
        //{
        //    ProductData dp = new ProductData();
        //    return dp.GetRowMes(1);
        //}
        //protected void SendMessage(object sender, EventArgs e)
        //{
        //    int sanphamid = 1;
        //    string name = txtName.Text;
        //    string content = txtContent.Text;
        //    DateTime datetime = DateTime.Now;

        //    ProductData pd = new ProductData();
        //    pd.SaveMessage(sanphamid, name, content, datetime);
        //    int top = Convert.ToInt32(ViewState["top"]);
        //    BindMessage(top);
        //    txtName.Text = "";
        //    txtContent.Text = "";
        //}
        //protected void LoadMore_Click(object sender, EventArgs e)
        //{
        //    int topVal = Convert.ToInt32(ViewState["top"]) + 4;
        //    BindMessage(topVal);
        //    ViewState["top"] = topVal;
        //}



    }
}