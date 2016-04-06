using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Photocopy.Model;
using System.Text.RegularExpressions;

namespace Photocopy
{
    /// <summary>
    /// Summary description for CheckUser
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [System.Web.Script.Services.ScriptService]
    public class CheckUser : System.Web.Services.WebService
    {
        PhotocopyDataContext db = new PhotocopyDataContext();
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public bool CheckUserIsValid(string username)
        {
            bool check = false;
            if (username == "")
            {
                check = false;
            }
            else
            {
                var query = from n in db.Users
                            where n.Username == username
                            select n;
                if (query.Count() == 1)
                {
                    check = false;
                }
                else
                {
                    check = true;
                }
            }
            return check;
        }
        [WebMethod]
        public bool CheckEmail(string email)
        {
            bool check;
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = regex.Match(email);
            if (match.Success)
                check = true;
            else
                check = false;
            return check;
        }
        [WebMethod] // Hàm get tên sản phẩm cho nút search
        public List<string> GetProductName(string keyword)
        {
            List<string> list = new List<string>();
            var query = (from n in db.SanPhams
                         where n.TenSanPham.Contains(keyword)
                         select n).ToList();
            for (int i = 0; i < query.Count(); i++)
            {
                string s = query[i].TenSanPham;
                list.Add(s);
            }
            return list;
        }
    }
}
