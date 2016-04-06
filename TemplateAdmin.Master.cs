using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Photocopy
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("/dang-nhap");
                btnExit.Visible = false;
            }
            else
            {
                btnExit.Visible = true;
                lbStatus.Text = "Welcome [" + Session["User"].ToString() + "]";
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/dang-nhap");
        }
    }
}