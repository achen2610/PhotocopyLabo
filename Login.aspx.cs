using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Model;

namespace Photocopy
{
    public partial class Login : System.Web.UI.Page
    {
        Core c = new Core();
        //PhotocopyDataContext db = new PhotocopyDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(c.CheckUser(txtUsername.Text,txtPassword.Text)==true)
            {
                Session["User"] = txtUsername.Text;
                Response.Redirect("/boss");
            }
            else
            {
                imgError.Visible = true;
                lbMessage.Visible = true;
                lbMessage.Text = "Tài khoản hoặc mật khẩu không chính xác.";
            }
        }
        

    }
}