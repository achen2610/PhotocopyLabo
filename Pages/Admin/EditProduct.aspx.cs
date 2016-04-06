using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Business;
using Photocopy.Model;

namespace Photocopy
{
    public partial class EditProduct : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["product"] != null)
                {
                    ProductRP product = new ProductRP();
                    product = (ProductRP)Session["product"];
                    txtSanphamid.Text = product.SanPhamID.ToString();
                    txtMasanpham.Text = product.MaSanPham;
                    txtMasanxuat.Text = product.MaSanXuat;
                    txtTensanpham.Text = product.TenSanPham;
                    txtDongia.Text = product.DonGia.ToString();
                    txtGiahienthi.Text = product.Gia;
                    txtSoluong.Text = product.SoLuong.ToString();
                    txtNgaynhaphang.Text = product.NgayNhapHang.ToString();
                    txtLoaimay.Text = product.LoaiMay;
                    txtHinhanh.Text = product.HinhAnh;
                    if(product.Hot == true)
                    {
                        cbHot.Checked = true;
                    }
                    else
                    {
                        cbHot.Checked = false;
                    }
                    if (product.ChoThue == true)
                    {
                         cbChoThue.Checked = true;
                    }
                    else
                    {
                        cbChoThue.Checked = false;
                    }
                    
                }
                else
                {
                    Response.Redirect("product-list");
                }
            }
        }
        // Hàm chọn lựa drop chức năng chính
        //protected void dropMainOption_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (dropMainOption.SelectedIndex == 0)
        //    {
        //        btnEditMainOption.Enabled = false;
        //        btnDeleteMainOption.Enabled = false;
        //        txtOptionNameAdd.Enabled = false;
        //        txtOptionDescriptionAdd.Enabled = false;
        //        btnAddOption.Enabled = false;
        //        RptOption.DataSource = null;                
        //    }
        //    else
        //    {
        //        btnEditMainOption.Enabled = true;
        //        btnDeleteMainOption.Enabled = true;
        //        RptOption.DataSource = pd.GetOption(Int32.Parse(dropMainOption.SelectedItem.Value));
        //        txtOptionNameAdd.Enabled = true;
        //        txtOptionDescriptionAdd.Enabled = true;
        //        btnAddOption.Enabled = true;
        //    }
        //    RptOption.DataBind();
        //}
        // Hàm sửa xóa chức năng chi tiết. 
        //protected void RptOption_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    switch(e.CommandName)
        //    {
        //        case "Edit":
        //            ((Label)e.Item.FindControl("lbOptionName")).Visible = false;
        //            ((Label)e.Item.FindControl("lbOptions")).Visible = false;
        //            ((TextBox)e.Item.FindControl("txtOptionNameUpdate")).Visible = true;
        //            ((TextBox)e.Item.FindControl("txtOptionUpdate")).Visible = true;
        //            ((ImageButton)e.Item.FindControl("imgBtnEdit")).Visible = false;
        //            ((ImageButton)e.Item.FindControl("imgBtnDelete")).Visible = false;
        //            ((Button)e.Item.FindControl("btnUpdate")).Visible = true;
        //            break;
        //        case "Update":
        //            OptionDetail od = new OptionDetail();
        //            od.OptionID = Int32.Parse(((Label)e.Item.FindControl("lbOptionID")).Text);
        //            od.OptionName = ((TextBox)e.Item.FindControl("txtOptionNameUpdate")).Text;
        //            od.OptionDescription = ((TextBox)e.Item.FindControl("txtOptionUpdate")).Text;
        //            pd.UpdateOption(od);
        //            string message = "Cập nhập thành công";
        //            System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //            sb.Append("<script type = 'text/javascript'>");
        //            sb.Append("window.onload=function(){");
        //            sb.Append("alert('");
        //            sb.Append(message);
        //            sb.Append("')};");
        //            sb.Append("</script>");
        //            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        //            ((Label)e.Item.FindControl("lbOptionName")).Visible = true;
        //            ((Label)e.Item.FindControl("lbOptionName")).Text = ((TextBox)e.Item.FindControl("txtOptionNameUpdate")).Text;
        //            ((Label)e.Item.FindControl("lbOptions")).Visible = true;
        //            ((Label)e.Item.FindControl("lbOptions")).Text = ((TextBox)e.Item.FindControl("txtOptionUpdate")).Text;
        //            ((TextBox)e.Item.FindControl("txtOptionNameUpdate")).Visible = false;
        //            ((TextBox)e.Item.FindControl("txtOptionUpdate")).Visible = false;
        //            ((ImageButton)e.Item.FindControl("imgBtnEdit")).Visible = true;
        //            ((ImageButton)e.Item.FindControl("imgBtnDelete")).Visible = true;
        //            ((Button)e.Item.FindControl("btnUpdate")).Visible = false;
        //            break;
        //        case "Delete":
        //            pd.DeleteOption(Int32.Parse(((Label)e.Item.FindControl("lbOptionID")).Text));
        //            RptOption.DataSource = pd.GetOption(Int32.Parse(dropMainOption.SelectedItem.Value));
        //            RptOption.DataBind();
        //            ScriptAlert("Xóa thành công");
        //            break;
        //    }
        //}
        // Hàm sửa chức năng chính trả về textbox để sửa
        //protected void btnEditMainOption_Click(object sender, EventArgs e)
        //{
        //    txtEditMainOption.Text = dropMainOption.SelectedItem.ToString();
        //    txtEditMainOption.Visible = true;
        //    btnUpdateMainOption.Visible = true;
        //    btnEditMainOption.Enabled = false;
        //    btnAddMainOption.Enabled = false;
        //    btnDeleteMainOption.Enabled = false;
        //    dropMainOption.Enabled = false;
        //}
        //// Hàm sửa chức năng chính khi thành công
        
        //// Hàm hủy thêm chức năng chính
        //protected void btnCancle1_Click(object sender, EventArgs e)
        //{
        //    txtAddMainOption.Visible = false;
        //    txtAddMainOption.Text = "";
        //    btnAddMainOption.Visible = true;
        //    dropMainOption.Enabled = true;
        //    btnAddMainOptionSuccess.Visible = false;
        //    btnCancle1.Visible = false;
        //    dropMainOption.Focus();
        //}
        //// Hàm xóa chức năng chính trả về xác nhận Yes hay No ?
        //protected void btnDeleteMainOption_Click(object sender, EventArgs e)
        //{
        //    lbMessage.Visible = true;
        //    btnOk.Visible = true;
        //    btnCancle2.Visible = true;
        //    btnAddMainOption.Enabled = false;
        //    btnDeleteMainOption.Enabled = false;
        //    btnEditMainOption.Enabled = false;

        //}        
        //// Hàm xóa chức năng chính //
        
        //// Hàm hủy xóa chức năng chính
        //protected void btnCancle2_Click(object sender, EventArgs e)
        //{
        //    lbMessage.Visible = false;
        //    btnOk.Visible = false;
        //    btnCancle2.Visible = false;
        //    btnAddMainOption.Enabled = true;
        //    btnDeleteMainOption.Enabled = true;
        //    btnEditMainOption.Enabled = true;
        //}
        //// Hàm thêm chức năng chi tiết//
        //protected void btnAddOption_Click(object sender, EventArgs e)
        //{
        //    if((txtOptionNameAdd.Text=="" ||txtOptionNameAdd.Text==null)&&(txtOptionDescriptionAdd.Text==""||txtOptionDescriptionAdd.Text==null))
        //    {
        //        ScriptAlert("Hãy nhập tên chức năng và chi tiết trước khi thêm.");
        //    }
        //    else
        //    {
        //        int mainoptionid = Int32.Parse(dropMainOption.SelectedItem.Value);
        //        OptionDetail option = new OptionDetail();
        //        option.SanPhamID = mainoptionid;
        //        option.OptionName = txtOptionNameAdd.Text;
        //        option.OptionDescription = txtOptionDescriptionAdd.Text;
        //        pd.AddOption(option);
        //        ScriptAlert("Thêm chức năng thành công");
        //        RptOption.DataSource = pd.GetOption(Int32.Parse(dropMainOption.SelectedItem.Value));
        //        RptOption.DataBind();
        //        txtOptionNameAdd.Text = "";
        //        txtOptionDescriptionAdd.Text = "";
        //    }
        //}
        // Hàm cập nhập thông tin sản phẩm//
        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            if (CheckNotNull(txtTensanpham.Text, txtMasanpham.Text, txtMasanxuat.Text, txtDongia.Text, txtSoluong.Text,txtLoaimay.Text) == true)
            {
                ProductRP product = new ProductRP();
                product.SanPhamID = Int32.Parse(txtSanphamid.Text);
                product.MaSanPham = txtMasanpham.Text;
                product.TenSanPham = txtTensanpham.Text;
                product.MaSanXuat = txtMasanxuat.Text;
                product.DonGia = Decimal.Parse(txtDongia.Text);
                product.SoLuong = Int32.Parse(txtSoluong.Text);
                product.LoaiMay = txtLoaimay.Text;
                product.HinhAnh = txtHinhanh.Text;
                if(cbHot.Checked==true)
                {
                    product.Hot = true;
                }
                else
                {
                    product.Hot = false;
                }
                if (product.ChoThue == true)
                {
                    cbChoThue.Checked = true;
                }
                else
                {
                    cbChoThue.Checked = false;
                }
                product.Gia = txtGiahienthi.Text;
                pd.UpdateProduct(product);
                c.ScriptAlert("Cập nhập thông tin thành công.");
            }
            else
            {
                c.ScriptAlert("Thông tin chưa điền đầy đủ");
            }
        }
        // Hàm trở về trang ProductList
        protected void linkBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("product-list");
        }
        // Kiểm tra textbox thông tin có null hay không ?//
        public bool CheckNotNull(string text1,string text2,string text3,string text4,string text5,string text6)
        {
            if(text1 == "" || text2 == "" || text3 == "" || text4 == "" || text5 == "" || text6 =="")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

    }
}