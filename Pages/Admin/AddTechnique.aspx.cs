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
    public partial class AddTechnique : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Technique t = new Technique();
                t.TechniqueName = txTechniqueName.Text;
                t.TechniqueContent = CKEditor1.Text;
                t.PostDate = DateTime.Now;
                pd.AddTechniqueSupport(t);
                lbKetQua.Text = "Thêm thành công";
            }
            catch (Exception ex)
            {
                lbKetQua.Text = ex.ToString();
            }
        }
    }
}