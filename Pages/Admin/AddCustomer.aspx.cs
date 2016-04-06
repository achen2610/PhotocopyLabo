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
    public partial class AddCustomer : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpCustomerList.DataSource = pd.getCustomer();
                rpCustomerList.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            customer c = new customer();
            c.customerName = txCustomerName.Text;
            c.customerImage = txCustomerImage.Text;
            pd.AddCustomer(c);
            lbKetQua.Text = "Thêm thành công.";
            rpCustomerList.DataSource = pd.getCustomer();
            rpCustomerList.DataBind();
        }

        protected void rpCustomerList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox tx;
            Label lb;
            ImageButton imgBt;
            switch (e.CommandName)
            {
                case "Edit":
                    tx = (TextBox)e.Item.FindControl("txCustomerName");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txCustomerImage");
                    tx.Visible = true;
                    lb = (Label)e.Item.FindControl("lbCustomerName");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbCustomerImage");
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
                        customer c = new customer();
                        lb = (Label)e.Item.FindControl("lbCustomerID");
                        c.customerID = Int32.Parse(lb.Text);
                        tx = (TextBox)e.Item.FindControl("txCustomerName");
                        c.customerName = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbCustomerName");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txCustomerImage");
                        c.customerImage = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbCustomerImage");
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

                        pd.UpdateCustomer(c);
                        lbKetQua.Text = "Sửa thành công";
                    }
                    catch (Exception loi)
                    {
                        lbKetQua.Text = loi.Message;
                    }
                    break;
                case "Cancle":
                    tx = (TextBox)e.Item.FindControl("txCustomerName");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txCustomerImage");
                    tx.Visible = false;
                    lb = (Label)e.Item.FindControl("lbCustomerName");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbCustomerImage");
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
                    lb = (Label)e.Item.FindControl("lbCustomerID");
                    pd.DeleteCustomer(Int32.Parse(lb.Text));
                    rpCustomerList.DataSource = pd.getCustomer();
                    rpCustomerList.DataBind();
                    lbKetQua.Text = "Xóa thành công. !";
                    break;
            }
        }
    }
}