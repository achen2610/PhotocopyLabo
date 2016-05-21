using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using Photocopy.Model;
using Photocopy.Business;


namespace Photocopy
{
    public class Global : System.Web.HttpApplication
    {
        protected void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("login", "dang-nhap", "~/Login.aspx");
            routes.MapPageRoute("regis", "tao-tai-khoan", "~/Pages/Admin/Register.aspx");
            routes.MapPageRoute("manageuser", "quan-li-tai-khoan", "~/Pages/Admin/ManageUser.aspx");
            routes.MapPageRoute("lienhe", "lien-he", "~/Contact.aspx");
            routes.MapPageRoute("gioithieu", "gioi-thieu", "~/About.aspx");
            routes.MapPageRoute("tintuc", "tin-tuc", "~/Pages/News/News.aspx");
            routes.MapPageRoute("tinchitiet", "tin-chi-tiet/{id}", "~/Pages/News/NewsDetail.aspx");
            routes.MapPageRoute("sanpham", "san-pham", "~/Pages/Product/Product.aspx");
            routes.MapPageRoute("chitietsanpham", "chi-tiet-san-pham/{id}", "~/Pages/Product/ProductDetails.aspx");
            routes.MapPageRoute("chothuemay", "dich-vu", "~/Pages/Service/Services.aspx");
            routes.MapPageRoute("admin", "boss", "~/Pages/Admin/Boss.aspx");
            routes.MapPageRoute("productlist", "product-list", "~/Pages/Admin/ProductList.aspx");
            routes.MapPageRoute("newproduct", "new-product", "~/Pages/Admin/NewProduct.aspx");
            routes.MapPageRoute("editproduct", "edit-product", "~/Pages/Admin/EditProduct.aspx");
            routes.MapPageRoute("addrelatednews", "add-related-news", "~/Pages/Admin/AddRelatedNews.aspx");
            routes.MapPageRoute("editoption", "edit-option", "~/Pages/Admin/EditOption.aspx");
            routes.MapPageRoute("newslist", "news-list", "~/Pages/Admin/NewsList.aspx");
            routes.MapPageRoute("addnews", "add-news", "~/Pages/Admin/AddNews.aspx");
            routes.MapPageRoute("editnews", "edit-news", "~/Pages/Admin/EditNews.aspx");
            routes.MapPageRoute("hotrokythuat", "ho-tro-ky-thuat/{id}", "~/TechniqueSupport.aspx");
            routes.MapPageRoute("danhsachkythuat", "technique-list", "~/Pages/Admin/TechniqueList.aspx");
            routes.MapPageRoute("themkythuat", "add-technique", "~/Pages/Admin/AddTechnique.aspx");
            routes.MapPageRoute("suakythuat", "edit-technique", "~/Pages/Admin/EditTechnique.aspx");
            routes.MapPageRoute("themkhachhang", "add-customer", "~/Pages/Admin/AddCustomer.aspx");


        }
        ProductData pd = new ProductData();
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //pd.ReturnPageView(1);
            //pd.IncreaseUserOnline(1);
            int count_visit = 0;
            //Kiểm tra file count_visit.txt nếu không tồn  tại thì
            if (System.IO.File.Exists(Server.MapPath("/Upload/count_visit.txt")) == false)
            {
                count_visit = 1;
            }
            // Ngược lại thì
            else
            {
                // Đọc dử liều từ file count_visit.txt
                System.IO.StreamReader read = new System.IO.StreamReader(Server.MapPath("/Upload/count_visit.txt"));
                count_visit = int.Parse(read.ReadLine());
                read.Close();
                // Tăng biến count_visit thêm 1
                count_visit++;
            }
            // khóa website
            Application.Lock();

            // gán biến Application count_visit
            Application["count_visit"] = count_visit;

            // Mở khóa website
            Application.UnLock();

            // Lưu dử liệu vào file  count_visit.txt
            System.IO.StreamWriter writer = new System.IO.StreamWriter(Server.MapPath("/Upload/count_visit.txt"));
            writer.WriteLine(count_visit);
            writer.Close();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");
            if (HttpContext.Current.Request.HttpMethod == "OPTIONS")
            {
                HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache");
                HttpContext.Current.Response.AddHeader("Access-Control-Allow-Methods", "GET, POST");
                HttpContext.Current.Response.AddHeader("Access-Control-Allow-Headers", "Content-Type, Accept");
                HttpContext.Current.Response.AddHeader("Access-Control-Max-Age", "1728000");
                HttpContext.Current.Response.End();
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            pd.DecreaseUserOnline(1);
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}