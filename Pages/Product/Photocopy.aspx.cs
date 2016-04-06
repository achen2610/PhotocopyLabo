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
    public partial class Photocopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Brand"] != null && Session["Type"] != null)
                {
                    string s = returnStringBrand((String)Session["Brand"]);
                    string t = (String)Session["Type"];
                    bindRepeater(s, t);
                }
                else
                {
                    Response.Redirect("\\");
                }
            }
        }
        private void bindRepeater(string brand,string type)
        {
            ProductData product = new ProductData();
            if (brand != "0")
            {
                CollectionPager1.MaxPages = 10000;
                CollectionPager1.PageSize = 12;
                CollectionPager1.DataSource = product.getProductWithBrandWithType(brand, type);
                CollectionPager1.BindToControl = RptPhotocopy;
                RptPhotocopy.DataSource = CollectionPager1.DataSourcePaged;
                RptPhotocopy.DataBind();
            }
            else
            {
                CollectionPager1.MaxPages = 10000;
                CollectionPager1.PageSize = 12;
                CollectionPager1.DataSource = product.getProductWithType(type);
                CollectionPager1.BindToControl = RptPhotocopy;
                RptPhotocopy.DataSource = CollectionPager1.DataSourcePaged;
                RptPhotocopy.DataBind();
            }

        }
        private string returnStringBrand(string chuoi)
        {
            string chuoitrave = "";
            switch (chuoi)
            {
                case "Ricoh":
                    chuoitrave = "SX04";
                    break;
                case "Sharp":
                    chuoitrave = "SX05";
                    break;
                case "Canon":
                    chuoitrave = "SX02";
                    break;
                case "Toshiba":
                    chuoitrave = "SX03";
                    break;
                case "0":
                    chuoitrave = "0";
                    break;
            }
            return chuoitrave;
        }

        //Phiên bản 2 ---------------------------------------------------------------------------
        //protected void RptPhotocopy_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "GetProductDetail1")
        //    {
        //        Label lblsanpham = (Label)e.Item.FindControl("lbSanphamID1");
        //        int SanphamID = Int32.Parse(lblsanpham.Text);
        //        ProductData product = new ProductData();
        //        Session["sanpham"] = product.getProduct(SanphamID);
        //        Response.Redirect("chi-tiet-san-pham");
        //    }
        //}
        //--------------------------------------------------------------------------------------
    }
}