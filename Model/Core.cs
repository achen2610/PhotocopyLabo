using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI.HtmlControls;
using Photocopy.Business;
using Photocopy.Model;

namespace Photocopy.Model
{
    class Core
    {
        PhotocopyDataContext db = new PhotocopyDataContext();
        //------Download Struct --------------------
        public string GetMimeTypeByFileName(string sFilename)
        {
            string Mime = "application/octet-stream";

            string Extension = System.IO.Path.GetExtension(sFilename);
            if (!string.IsNullOrEmpty(Extension))
            {
                Extension = Extension.Replace(",", "");
                Extension = Extension.ToLower();

                if (Extension == "xls" || Extension == "xlsx")
                {
                    Mime = "application/ms-excel";
                }
                else if (Extension == "doc" || Extension == "docx")
                {
                    Mime = "application/msword";
                }
                else if (Extension == "ppt" || Extension == "pptx")
                {
                    Mime = "application/ms-powerpoint";
                }
                else if (Extension == "rtf")
                {
                    Mime = "application/rtf";
                }
                else if (Extension == "zip")
                {
                    Mime = "application/zip";
                }
                else if (Extension == "mp3")
                {
                    Mime = "application/mpeg";
                }
                else if (Extension == "bmp")
                {
                    Mime = "application/bmp";
                }
                else if (Extension == "gif")
                {
                    Mime = "application/gif";
                }
                else if (Extension == "tiff" || Extension == "tif")
                {
                    Mime = "application/tiff";
                }
                else if (Extension == "txt")
                {
                    Mime = "application/plain";
                }
            }
            return Mime;
        }

        public void StreamFileToBrowser(string Filename, byte[] filebytes)
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;

            context.Response.Clear();
            context.Response.ClearHeaders();
            context.Response.ClearContent();
            context.Response.AppendHeader("content-length", filebytes.Length.ToString());
            context.Response.ContentType = GetMimeTypeByFileName(Filename);
            context.Response.AppendHeader("content-disposition", "attachment; filename=" + Filename);
            context.Response.BinaryWrite(filebytes);

            context.ApplicationInstance.CompleteRequest();
        }

        //------------------------------------------------------------------------------------------

        public void ScriptAlert(string mess)
        {
            var page = HttpContext.Current.CurrentHandler as System.Web.UI.Page;

            if (page == null)
            {
                // throw an exception, something bad happened
            }
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(mess);
            sb.Append("')};");
            sb.Append("</script>");
            page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        public HtmlMeta AddMeta(int id,string chuoi)
        {
            HtmlMeta meta = new HtmlMeta();
            switch(id)
            {
                case 1:
                    meta.Attributes.Add("property", "og:url");
                    meta.Content = chuoi;
                    break;
                case 2:
                    meta.Attributes.Add("property", "og:type");
                    meta.Content = chuoi;
                    break;
                case 3:
                    meta.Attributes.Add("property", "og:title");
                    meta.Content = chuoi;
                    break;
                case 4:
                    meta.Attributes.Add("property", "og:description");
                    meta.Content = chuoi;
                    break;
                case 5:
                    meta.Attributes.Add("property", "og:image");
                    meta.Content = chuoi;
                    break;
            }
            return meta;
        }
        public bool CheckUser(string username, string password)
        {
            bool b = false;
            var query = from n in db.Users
                        where n.Username == username && n.Password == password
                        select n;
            if(query.Count() == 1)
            {
                b = true;
            }
            else
            {
                b = false;
            }
            return b;
        }
    }
}
