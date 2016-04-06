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
    public partial class EditOption : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dropdSanPham.DataSource = pd.getProduct();
                dropdSanPham.DataTextField = "TenSanPham";
                dropdSanPham.DataValueField = "SanPhamID";
                dropdSanPham.DataBind();

                dropdSanPham.Items.Insert(0, new ListItem("-- Chọn sản phẩm --", "0"));
            }

        }

        protected void rpOptions_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox tx;
            Label lb;
            ImageButton imgBt;
            switch (e.CommandName)
            {
                case "Edit":
                    tx = (TextBox)e.Item.FindControl("txtSanPhamID");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txtOptionNameUpdate");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txtOptionDescriptionUpdate");
                    tx.Visible = true;
                    lb = (Label)e.Item.FindControl("lbSanphamID");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbOptionName");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbOptionDescription");
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
                        OptionDetail od = new OptionDetail();
                        lb = (Label)e.Item.FindControl("lbOptionID");
                        od.OptionID = Int32.Parse(lb.Text);
                        tx = (TextBox)e.Item.FindControl("txtSanPhamID");
                        od.SanPhamID = Int32.Parse(tx.Text);
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbSanphamID");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txtOptionNameUpdate");
                        od.OptionName = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbOptionName");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txtOptionDescriptionUpdate");
                        od.OptionDescription = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbOptionDescription");
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

                        pd.UpdateOption(od);
                        c.ScriptAlert("Sửa thành công");
                        lbKetQua.Text = "Sửa thành công";
                    }
                    catch (Exception loi)
                    {
                        lbKetQua.Text = loi.Message;
                    }
                    break;
                case "Cancle":
                    tx = (TextBox)e.Item.FindControl("txtSanPhamID");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txtOptionNameUpdate");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txtOptionDescriptionUpdate");
                    tx.Visible = false;
                    lb = (Label)e.Item.FindControl("lbSanphamID");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbOptionName");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbOptionDescription");
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
                    lb = (Label)e.Item.FindControl("lbOptionID");
                    pd.DeleteOption(Int32.Parse(lb.Text));
                    rpOptions.DataSource = pd.GetOption(Int32.Parse(dropdSanPham.SelectedValue));
                    rpOptions.DataBind();
                    c.ScriptAlert("Xóa thành công .!");
                    lbKetQua.Text = "Xóa thành công. !";
                    break;
            }
        }

        protected void dropdSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Int32.Parse(dropdSanPham.SelectedValue) == 0)
            {
                rpOptions.DataSource = null;
                rpOptions.DataBind();
            }
            else
            {
                rpOptions.DataSource = pd.GetOption(Int32.Parse(dropdSanPham.SelectedValue));
                rpOptions.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            OptionDetail od = new OptionDetail();
            od.SanPhamID = Int32.Parse(dropdSanPham.SelectedValue);
            od.OptionName = txtOptionName.Text;
            od.OptionDescription = txtOptionDescription.Text;
            try
            {
                pd.AddOption(od);
                c.ScriptAlert("Thêm thành công. !!!");
                lbKetQua.Text = "Thêm thành công !!!";
            }
            catch (Exception ex)
            {
                lbKetQua.Text = ex.Message;
            }
            rpOptions.DataSource = pd.GetOption(Int32.Parse(dropdSanPham.SelectedValue));
            rpOptions.DataBind();
            txtOptionName.Text = "";
            txtOptionDescription.Text = "";
        }
    }
}