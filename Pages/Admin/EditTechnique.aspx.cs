using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Business;
using Photocopy.Model;

namespace Photocopy
{
    public partial class EditTechnique : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        Core c = new Core();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Technique t = (Technique)Session["Technique"];
                lbTechniqueID.Text = t.TechniqueID.ToString();
                txTechniqueName.Text = t.TechniqueName;
                CKEditor1.Text = t.TechniqueContent;
             }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Technique t = new Technique();
            t.TechniqueID = Int32.Parse(lbTechniqueID.Text);
            t.TechniqueName = txTechniqueName.Text;
            t.TechniqueContent = CKEditor1.Text;
            try
            {
                pd.UpdateTechniqueSupport(t);
                string message = "Cập nhập thành công";
                c.ScriptAlert(message);
            }
            catch (Exception ex)
            {
                c.ScriptAlert(ex.Message);
            }
        }

        protected void linkBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("technique-list");
        }
    }
}