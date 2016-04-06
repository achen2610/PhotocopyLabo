using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Model;
using Photocopy.Business;
using System.Threading;

namespace Photocopy
{
    public partial class EditNews : System.Web.UI.Page
    {
        ProductData pd = new ProductData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                tinTuc t = (tinTuc)Session["TinTuc"];
                lbTinTucID.Text = t.TinTucID.ToString();
                txTitle.Text = t.TinTucTitle;
                //txHtml.Text = t.TinTucContent;
                CKEditor1.Text = t.TinTucContent;
                txImage.Text = t.TinTucImage;
                txQuote.Text = t.TinTucQuote;
                if(t.TinTucHot == true)
                {
                    cbHot.Checked = true;
                }
                else
                {
                    cbHot.Checked = false;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            tinTuc t = new tinTuc();
            t.TinTucID = Int32.Parse(lbTinTucID.Text);
            t.TinTucTitle = txTitle.Text;
            //t.TinTucContent = txHtml.Text;
            t.TinTucContent = CKEditor1.Text;
            t.TinTucImage = txImage.Text;
            t.TinTucQuote = txQuote.Text;
            if (cbHot.Checked == true)
            {
                t.TinTucHot = true;
            }
            else
            {
                t.TinTucHot = false;
            }
            try
            {
                pd.UpdateNews(t);
                string message = "Cập nhập thành công";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            catch (Exception ex)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(ex);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            
            
        }

        protected void linkBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("news-list");
        }
    }
}