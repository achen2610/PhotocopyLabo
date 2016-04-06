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
    public partial class NewsDetail : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                tinTuc tin = pd.getNewsDetail(id);
                List<tinTuc> list = new List<tinTuc>();
                list.Add(tin);
                rptFacebook.DataSource = list;
                rptFacebook.DataBind();

                Page.Header.Controls.Add(c.AddMeta(1, "http://nhatthientan.com/tin-chi-tiet/" + tin.TinTucID.ToString()));
                Page.Header.Controls.Add(c.AddMeta(2, "website"));
                Page.Header.Controls.Add(c.AddMeta(3, tin.TinTucTitle));
                Page.Header.Controls.Add(c.AddMeta(5, "http://i1056.photobucket.com/albums/t378/hungld/Tintuc/" + tin.TinTucImage + ".jpg"));

                lbTinTucH3.Text = tin.TinTucTitle;
                lbTinTucPostDate.Text = String.Format("{0:d/M/yyyy HH:mm:ss}", tin.TinTucPostDate);
                lbTinTucContent.Text = tin.TinTucContent;
            }
        }
    }
}