using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Business;
using Photocopy.Model;

namespace Photocopy.Page.Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpUserList.DataSource = pd.getUser();
                rpUserList.DataBind();
                
            }
        }

        protected void rpUserList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox tx;
            Label lb;
            ImageButton imgBt;
            switch (e.CommandName)
            {
                case "Edit":
                    tx = (TextBox)e.Item.FindControl("txUserName");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txUserPass");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txUserEmail");
                    tx.Visible = true;
                    lb = (Label)e.Item.FindControl("lbUserName");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbUserPass");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbUserEmail");
                    lb.Visible = false;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnOk");
                    imgBt.Visible = true;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnCancle");
                    imgBt.Visible = true;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnEdit");
                    imgBt.Visible = false;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnDelete");
                    imgBt.Visible = false;
                    break;
                case "Ok":
                    try
                    {
                        user u = new user();
                        lb = (Label)e.Item.FindControl("lbUserID");
                        u.userID = Int32.Parse(lb.Text);
                        tx = (TextBox)e.Item.FindControl("txUserName");
                        u.userName = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbUserName");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txUserPass");
                        u.userPass = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbUserPass");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txUserEmail");
                        u.userEmail = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbUserEmail");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnOk");
                        imgBt.Visible = false;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnCancle");
                        imgBt.Visible = false;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnEdit");
                        imgBt.Visible = true;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnDelete");
                        imgBt.Visible = true;

                        pd.UpdateUser(u);
                        lbKetQua.Text = "Sửa thành công";
                    }
                    catch (Exception loi)
                    {
                        lbKetQua.Text = loi.Message;
                    }
                    break;
                case "Cancle":
                    tx = (TextBox)e.Item.FindControl("txUserName");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txUserPass");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txUserEmail");
                    tx.Visible = false;
                    lb = (Label)e.Item.FindControl("lbUserName");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbUserPass");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbUserEmail");
                    lb.Visible = true;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnOk");
                    imgBt.Visible = false;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnCancle");
                    imgBt.Visible = false;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnEdit");
                    imgBt.Visible = true;
                    imgBt = (ImageButton)e.Item.FindControl("imgBtnDelete");
                    imgBt.Visible = true;
                    break;
                case "Delete":
                    lb = (Label)e.Item.FindControl("lbUserID");
                    pd.DeleteUser(Int32.Parse(lb.Text));
                    rpUserList.DataSource = pd.getUser();
                    rpUserList.DataBind();
                    lbKetQua.Text = "Xóa thành công. !";
                    break;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            user u = new user();
            u.userName = txtUserRegister.Text;
            u.userPass = txtPassRegister.Text;
            u.userEmail = txtEmailRegister.Text;
            pd.AddUser(u);
            c.ScriptAlert("Tạo tài khoản thành công !");
            rpUserList.DataSource = pd.getUser();
            rpUserList.DataBind();
            txtUserRegister.Text = "";
            txtEmailRegister.Text = "";
        }
    }
}