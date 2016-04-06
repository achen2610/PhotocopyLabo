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
    public partial class NewsList : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpNewsList.DataSource = pd.getListNews();
                rpNewsList.DataBind();

            }
        }

        protected void rpNewsList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int tintucid = Int32.Parse(((Label)e.Item.FindControl("lbTinTucID")).Text);
            switch(e.CommandName)
            {
                case "Edit":
                    Session["TinTuc"] = pd.getNewsDetail(tintucid);
                    Response.Redirect("edit-news");
                    break;
                case "Delete":
                    pd.DeleteNews(tintucid);
                    rpNewsList.DataSource = pd.getListNews();
                    rpNewsList.DataBind();
                    c.ScriptAlert("Xóa tin tức thành công");
                    break;
            }
        }
        

    }
}