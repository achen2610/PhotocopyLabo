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
    public partial class Information : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                rpNewsList.DataSource = pd.getListNews();
                rpNewsList.DataBind();
            }
        }

        //Phiên bản 2 ---------------------------------------------------------------------
        //protected void rpNewsList_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    switch(e.CommandName)
        //    {
        //        case "ToNewsDetail":
        //            Label id = (Label)e.Item.FindControl("lbNewsID");
        //            tinTuc tt = pd.getNewsDetail(Int32.Parse(id.Text));
        //            Session["TinTuc"] = tt;
        //            Response.Redirect("tin-chi-tiet");
        //            break;
        //    }
        //}
        //-----------------------------------------------------------------------------------

    }
}