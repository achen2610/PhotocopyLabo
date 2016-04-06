using Photocopy.Business;
using Photocopy.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Photocopy
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRepeater();                
            }

        }
        private void bindRepeater()
        {
            ProductData product = new ProductData();

            repeaterProduct.DataSource = product.getProduct();
            repeaterProduct.DataBind();
                         
        }

    }
}