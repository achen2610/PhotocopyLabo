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
    public partial class TechniqueSupport : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Int32.Parse(Page.RouteData.Values["id"].ToString());
            Technique t = pd.getTechniqueSupportDetail(id);
            List<Technique> list = new List<Technique>();
            list.Add(t);
            rptFacebook.DataSource = list;
            rptFacebook.DataBind();

            Page.Header.Controls.Add(c.AddMeta(1, "http://nhatthientan.com/ho-tro-ky-thuat/" + t.TechniqueID.ToString()));
            Page.Header.Controls.Add(c.AddMeta(2, "website"));
            Page.Header.Controls.Add(c.AddMeta(3, t.TechniqueName));

            lbTechniqueH3.Text = t.TechniqueName;
            lbTechniquePostDate.Text = t.PostDate.ToString();
            lbTechniqueContent.Text = t.TechniqueContent;


        }
    }
}