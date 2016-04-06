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
    public partial class Home : System.Web.UI.Page
    {
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductData p = new ProductData();

            if (!IsPostBack)
            {
                Session["Product"] = null;

                List<string> listType = new List<string>(new string[]
                {
                    "Photocopy",
                    "Print",
                    "Component"
                });
                List<ProductRP> listSP = new List<ProductRP>();

                foreach(string type in listType)
                {
                    List<ProductRP> listTemp = new List<ProductRP>();
                    listTemp = pd.getProductWithType(type).Take(4).ToList();
                    foreach(ProductRP product in listTemp)
                    {
                        listSP.Add(product);
                    }
                }
                Random ran = new Random();
                var list = from item in listSP
                           orderby ran.Next()
                           select item;
                repeaterProduct.DataSource = list;
                repeaterProduct.DataBind();

                repeaterNews1.DataSource = pd.getListNews().Take(2);
                repeaterNews1.DataBind();

                repeaterNews2.DataSource = pd.getListNews().Skip(2).Take(2);
                repeaterNews2.DataBind();
            }
        }

        protected string GetItemClass(int itemIndex)
        {
            if (itemIndex % 2 == 0)
                return "fadeInLeft";
            else
                return "fadeInRight";
        }
    }
}