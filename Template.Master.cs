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
    public partial class RebuildTemplate : System.Web.UI.MasterPage
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {

            //if(!IsPostBack)
            //{
            //    txtSearch.Attributes.Add("onkeypress", "return clickButton(event,'" + btnSearch.ClientID + "')");
            //}

        }

        


        // Hàm search --------------
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    string chuoi = txtSearch.Text;
        //    Session["Search"] = chuoi;
        //    Response.Redirect("ket-qua-tim-kiem");
        //}

        protected void LinkPrint1_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Ricoh";
            Session["Type"] = "Print";
            Response.Redirect("/may-in");
        }

        protected void LinkPrint2_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Sharp";
            Session["Type"] = "Print";
            Response.Redirect("/may-in");
        }

        protected void LinkPrint3_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Canon";
            Session["Type"] = "Print";
            Response.Redirect("/may-in");
        }

        protected void LinkPrint4_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Toshiba";
            Session["Type"] = "Print";
            Response.Redirect("/may-in");
        }

        protected void LinkPhotocopy1_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Ricoh";
            Session["Type"] = "Photocopy";
            Response.Redirect("/may-photocopy");
        }

        protected void LinkPhotocopy2_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Sharp";
            Session["Type"] = "Photocopy";
            Response.Redirect("/may-photocopy");
        }

        protected void LinkPhotocopy3_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Canon";
            Session["Type"] = "Photocopy";
            Response.Redirect("/may-photocopy");
        }

        protected void LinkPhotocopy4_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "Toshiba";
            Session["Type"] = "Photocopy";
            Response.Redirect("/may-photocopy");
        }

        protected void LinkType1_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "0";
            Session["Type"] = "Photocopy";
            Response.Redirect("/may-photocopy");
        }

        protected void LinkType2_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "0";
            Session["Type"] = "Print";
            Response.Redirect("/may-in");
        }

        protected void LinkType3_Click(object sender, EventArgs e)
        {
            Session["Brand"] = "0";
            Session["Type"] = "Scan";
            Response.Redirect("/may-scan");
        }

    }
}