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
    public partial class AddRelatedNews : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                dropdSanPham.DataSource = pd.getProduct();
                dropdSanPham.DataTextField = "TenSanPham";
                dropdSanPham.DataValueField = "SanPhamID";
                dropdSanPham.DataBind();

                dropdSanPham.Items.Insert(0, new ListItem("-- Chọn sản phẩm --", "0"));

                dropNews.DataSource = pd.getListNews();
                dropNews.DataTextField = "TinTucTitle";
                dropNews.DataValueField = "TinTucID";
                dropNews.DataBind();
                dropNews.Items.Insert(0, new ListItem("-- Chọn tin tức --", "0"));

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            relatedNews rn = new relatedNews();
            rn.sanPhamID = Int32.Parse(dropdSanPham.SelectedValue);
            rn.relatedNewsName = txRelatedNewsName.Text;
            rn.relatedNewsLink = txtRelatedNewsLink.Text;
            rn.tinTucID = Int32.Parse(dropNews.SelectedValue);
            try
            {
                pd.AddRelatedNews(rn);
                lbKetQua.Text = "Thêm thành công !!!";
            }
            catch(Exception ex)
            {
                lbKetQua.Text = ex.Message;
            }
            rpRelatedNews.DataSource = pd.getRelatedNews(Int32.Parse(dropdSanPham.SelectedValue));
            rpRelatedNews.DataBind();
            txRelatedNewsName.Text = "";
            txtRelatedNewsLink.Text = "";
            dropNews.SelectedIndex = 0;
        }

        protected void dropdSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Int32.Parse(dropdSanPham.SelectedValue) == 0)
            {
                rpRelatedNews.DataSource = null;
                rpRelatedNews.DataBind();
            }
            else
            {
                rpRelatedNews.DataSource = pd.getRelatedNews(Int32.Parse(dropdSanPham.SelectedValue));
                rpRelatedNews.DataBind();
            }
        }

        protected void rpRelatedNews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox tx;
            Label lb;
            ImageButton imgBt;
            switch(e.CommandName)
            {
                case "Edit":
                    tx = (TextBox)e.Item.FindControl("txtSanPhamID");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txtRelatedNewsNameUpdate");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txtRelatedNewsLinkUpdate");
                    tx.Visible = true;
                    tx = (TextBox)e.Item.FindControl("txtTinTucID");
                    tx.Visible = true;
                    lb = (Label)e.Item.FindControl("lbSanphamID");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbRelatedNewsName");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbRelatedNewsLink");
                    lb.Visible = false;
                    lb = (Label)e.Item.FindControl("lbTinTucID");
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
                        relatedNews rn = new relatedNews();
                        lb = (Label)e.Item.FindControl("lbRelatedNewsID");
                        rn.relatedNewsID = Int32.Parse(lb.Text);
                        tx = (TextBox)e.Item.FindControl("txtSanPhamID");
                        rn.sanPhamID = Int32.Parse(tx.Text);
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbSanphamID");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txtRelatedNewsNameUpdate");
                        rn.relatedNewsName = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbRelatedNewsName");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txtRelatedNewsLinkUpdate");
                        rn.relatedNewsLink = tx.Text;
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbRelatedNewsLink");
                        lb.Text = tx.Text;
                        lb.Visible = true;
                        tx = (TextBox)e.Item.FindControl("txtTinTucID");
                        if (tx.Text == "")
                        {
                            rn.tinTucID = null;
                        }
                        else
                        {
                            rn.tinTucID = Int32.Parse(tx.Text);
                        }
                        tx.Visible = false;
                        lb = (Label)e.Item.FindControl("lbTinTucID");
                        lb.Visible = true;
                        lb.Text = tx.Text;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnOk");
                        imgBt.Visible = false;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnCancle");
                        imgBt.Visible = false;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnEdit");
                        imgBt.Visible = true;
                        imgBt = (ImageButton)e.Item.FindControl("imgBtnDelete");
                        imgBt.Visible = true;

                        pd.UpdateRelatedNews(rn);
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
                    tx = (TextBox)e.Item.FindControl("txtRelatedNewsNameUpdate");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txtRelatedNewsLinkUpdate");
                    tx.Visible = false;
                    tx = (TextBox)e.Item.FindControl("txtTinTucID");
                    tx.Visible = false;
                    lb = (Label)e.Item.FindControl("lbSanphamID");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbRelatedNewsName");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbRelatedNewsLink");
                    lb.Visible = true;
                    lb = (Label)e.Item.FindControl("lbTinTucID");
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
                    lb = (Label)e.Item.FindControl("lbRelatedNewsID");
                    pd.DeleteRelatedNews(Int32.Parse(lb.Text));
                    rpRelatedNews.DataSource = pd.getRelatedNews(Int32.Parse(dropdSanPham.SelectedValue));
                    rpRelatedNews.DataBind();
                    lbKetQua.Text = "Xóa thành công. !";
                    break;
            }
        }

        protected void dropNews_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbTinTucID.Text = dropNews.SelectedIndex.ToString();
        }
    }
}