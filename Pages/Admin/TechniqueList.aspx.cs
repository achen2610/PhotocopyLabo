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
    public partial class TechniqueList : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpTechniqueList.DataSource = pd.getTechniqueSupport();
                rpTechniqueList.DataBind();
            }
        }

        protected void rpTechniqueList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int techniqueid = Int32.Parse(((Label)e.Item.FindControl("lbTechniqueID")).Text);
            switch(e.CommandName)
            {
                case "Edit":
                    Session["Technique"] = pd.getTechniqueSupportDetail(techniqueid);
                    Response.Redirect("edit-technique");
                    break;
                case "Delete":
                    int id = Convert.ToInt32(e.CommandArgument);
                    pd.DeleteTechniqueSupport(id);
                    rpTechniqueList.DataSource = pd.getTechniqueSupport();
                    rpTechniqueList.DataBind();
                    //c.ScriptAlert("Xóa thành công !");
                    break;
            }
        }
    }
}