using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Model;

namespace Photocopy
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductData dp = new ProductData();
                RptProduct.DataSource = dp.getProduct();
                RptProduct.DataBind();
                
            }
        }

        protected void RptProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            ProductData dp = new ProductData();
            int SanphamID = Int32.Parse(((Label)e.Item.FindControl("lbSanphamID")).Text);
            switch (e.CommandName)
            {
                case "Delete":
                    dp.DeleteProduct(SanphamID);
                    RptProduct.DataSource = dp.getProduct();
                    RptProduct.DataBind();
                    string message = "Xóa sản phẩm thành công";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    break;
                case "Edit":                                        
                    Session["product"] = dp.getProductEdit(SanphamID);
                    Response.Redirect("edit-product");
                    break;

            }
        }
    }
}