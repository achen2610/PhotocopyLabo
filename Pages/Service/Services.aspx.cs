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
    public partial class Services : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                rptRentPhotocopy.DataSource = pd.getRentProduct();
                rptRentPhotocopy.DataBind();

                // Hàm lấy thông tin chức năng chi tiết ----------------------------------------------
                //RepeaterOption.DataSource = pd.GetOption(sp.SanPhamID);
                //RepeaterOption.DataBind();
            }
        }

        protected void rptRentPhotocopy_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater repeaterOption = (Repeater)e.Item.FindControl("RepeaterOption");
            Label idProduct = (Label)e.Item.FindControl("idProduct");

            repeaterOption.DataSource = pd.GetOption(Int32.Parse(idProduct.Text)).Take(4).ToList();
            repeaterOption.DataBind();

        }
    }
}