using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Photocopy.Business;
using Photocopy.Model;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace Photocopy
{
    public partial class NewProduct : System.Web.UI.Page
    {
        
        ProductData pd = new ProductData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProduct();
                LoadOption();
                lbSttOption.Text = pd.getLastSttSanphamOrOption(0).ToString();
                lbSttSanPham.Text = pd.getLastSttSanphamOrOption(1).ToString();
            }
        }
        private void LoadProduct()
        {
            rpSanPhamFromExcel.DataSource = pd.getProduct();
            rpSanPhamFromExcel.DataBind();
        }
        private void LoadOption()
        {
            rpChucNangSanPhamFromExcel.DataSource = pd.GetFullOption();
            rpChucNangSanPhamFromExcel.DataBind();
        }

        //------ Hàm xử lý nút import 1 , để import danh sách sản phẩm
        protected void btImport_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile.ContentType == "application/vnd.ms-excel" ||
                FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                try
                {
                    string filename = Path.Combine(Server.MapPath("~/Upload"), Guid.NewGuid().ToString() + Path.GetExtension(FileUpload1.PostedFile.FileName));
                    FileUpload1.PostedFile.SaveAs(filename);

                    string conString = "";
                    string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    if (ext.ToLower() == ".xls")
                    {
                        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filename + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (ext.ToLower() == ".xlsx")
                    {
                        conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filename + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                    }

                    string query = "Select [MaSanPham],[MaSanXuat],[TenSanPham],[LoaiMay],[DonGia],[NgayNhapHang],[SoLuong],[ChoThue],[Hot],[LuotXem],[Gia],[HinhAnh] from [SanPhamData$]";

                    OleDbConnection con = new OleDbConnection(conString);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    OleDbCommand cmd = new OleDbCommand(query, con);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    da.Dispose();
                    con.Dispose();
                    con.Close();

                    //Import sản phẩm vào
                    using (PhotocopyDataContext db = new PhotocopyDataContext())
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            //string spID = dr["SanPhamID"].ToString();
                            bool enable = false;
                            bool hot, chothue;
                            var v = db.SanPhams.Where(n => n.EnableP.Equals(enable)).FirstOrDefault();
                            if (dr["ChoThue"].ToString() == "")
                            {
                                chothue = false;
                            }
                            else
                            {
                                chothue = Convert.ToBoolean(dr["ChoThue"].ToString());
                            }
                            if (dr["Hot"].ToString() == "")
                            {
                                hot = false;
                            }
                            else
                            {
                                hot = Convert.ToBoolean(dr["Hot"].ToString());
                            }
                            if (v != null)
                            {
                                //Update
                                v.MaSanPham = dr["MaSanPham"].ToString();
                                v.MaSanXuat = dr["MaSanXuat"].ToString();
                                v.TenSanPham = dr["TenSanPham"].ToString();
                                v.LoaiMay = dr["LoaiMay"].ToString();
                                v.DonGia = Decimal.Parse(dr["DonGia"].ToString());
                                v.NgayNhapHang = DateTime.Parse(dr["NgayNhapHang"].ToString());
                                v.SoLuong = Int32.Parse(dr["SoLuong"].ToString());
                                v.ChoThue = chothue;
                                v.Hot = hot;
                                v.LuotXem = Int32.Parse(dr["LuotXem"].ToString());
                                v.Gia = dr["Gia"].ToString();
                                v.HinhAnh = dr["HinhAnh"].ToString();
                                v.EnableP = true;
                                db.SubmitChanges();
                            }
                            else
                            {
                                //Insert
                                db.SanPhams.InsertOnSubmit(new SanPham
                                    {
                                        MaSanPham = dr["MaSanPham"].ToString(),
                                        MaSanXuat = dr["MaSanXuat"].ToString(),
                                        TenSanPham = dr["TenSanPham"].ToString(),
                                        LoaiMay = dr["LoaiMay"].ToString(),
                                        DonGia = Decimal.Parse(dr["DonGia"].ToString()),
                                        NgayNhapHang = DateTime.Parse(dr["NgayNhapHang"].ToString()),
                                        SoLuong = Int32.Parse(dr["SoLuong"].ToString()),
                                        ChoThue = chothue,
                                        Hot = hot,
                                        LuotXem = Int32.Parse(dr["LuotXem"].ToString()),
                                        Gia = dr["Gia"].ToString(),
                                        HinhAnh = dr["HinhAnh"].ToString(),
                                        EnableP = true
                                    });
                                db.SubmitChanges();
                            }
                        }

                        LoadProduct();
                        lbKetQua.Text = "Import thành công";
                    }


                }
                catch (Exception ex)
                {
                    lbKetQua.Text = ex.Message;
                }
            }
        }

            

        //------ Hàm xử lý nút import 2 , để import chức năng sản phẩm
        protected void btnImport2_Click(object sender, EventArgs e)
        {
            if (FileUpload2.PostedFile.ContentType == "application/vnd.ms-excel" ||
                FileUpload2.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                try
                {
                    string filename = Path.Combine(Server.MapPath("~/Upload"), Guid.NewGuid().ToString() + Path.GetExtension(FileUpload2.PostedFile.FileName));
                    FileUpload2.PostedFile.SaveAs(filename);

                    string conString = "";
                    string ext = Path.GetExtension(FileUpload2.PostedFile.FileName);
                    if (ext.ToLower() == ".xls")
                    {
                        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filename + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (ext.ToLower() == ".xlsx")
                    {
                        conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filename + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                    }

                    string query = "Select [SanPhamID],[OptionName],[OptionDescription] from [OptionData$]";

                    OleDbConnection con = new OleDbConnection(conString);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    OleDbCommand cmd = new OleDbCommand(query, con);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    da.Dispose();
                    con.Dispose();
                    con.Close();

                    //Import option vào
                    using (PhotocopyDataContext db = new PhotocopyDataContext())
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {

                            bool enable = false;
                            var v = db.Options.Where(n => n.EnableOp.Equals(enable)).FirstOrDefault();
                            
                            if (v != null)
                            {
                                //Update
                                v.SanPhamID = Int32.Parse(dr["SanPhamID"].ToString());
                                v.OptionName = dr["OptionName"].ToString();
                                v.OptionDescription = dr["OptionDescription"].ToString();
                                v.EnableOp = true;
                                db.SubmitChanges();
                            }
                            else
                            {
                                //Insert
                                db.Options.InsertOnSubmit(new Option
                                {
                                    SanPhamID = Int32.Parse(dr["SanPhamID"].ToString()),
                                    OptionName = dr["OptionName"].ToString(),
                                    OptionDescription = dr["OptionDescription"].ToString(),
                                    EnableOp = true
                                });
                                db.SubmitChanges();
                            }
                        }

                        LoadOption();
                        lbKetQua2.Text = "Import thành công";
                    }


                }
                catch (Exception ex)
                {
                    lbKetQua2.Text = ex.Message;
                }
            }
        }
        
        protected void linkExcel1_Click(object sender, EventArgs e)
        {
            string filename = "mausanpham.xlsx";
            byte[] filebytes = System.IO.File.ReadAllBytes("\\home\\vhosts\\nhatthientan.com\\httpdocs\\Upload\\" + filename); //"D:\\Project\\Photocopy\\Photocopy\\Upload\\"
            Core c = new Core();
            c.StreamFileToBrowser(filename, filebytes);
        }

        protected void linkExcel2_Click(object sender, EventArgs e)
        {
            string filename = "mauchucnang.xlsx";
            byte[] filebytes = System.IO.File.ReadAllBytes("\\home\\vhosts\\nhatthientan.com\\httpdocs\\Upload\\" + filename); //"local\\httpdocs\\Upload\\"
            Core c = new Core();
            c.StreamFileToBrowser(filename, filebytes);
        }

    }
}



// Hàm Import Cách 1 

        //protected void btImport_Click(object sender, EventArgs e)
        //{
        //  try
        //  {
        //    if (FileUpload1.HasFile)
        //    {
        //        string Filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //        string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
        //        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
        //        if ((Extension == ".xls") || (Extension == ".xlsx"))
        //        {
        //            string FilePath = Server.MapPath(FolderPath + Filename);
        //            FileUpload1.SaveAs(FilePath);

        //            Import_To_Grid(FilePath, Extension, "Yes");
        //            if (Directory.Exists(Path.GetDirectoryName(FilePath)))
        //            {
        //                File.Delete(FilePath);
        //            }
        //        }
        //        else
        //        {
        //            lbKetQua.Text = ("Chỉ cho phép import dữ liệu từ file Excel");
        //        }
        //    }
        //    else
        //    {
        //        lbKetQua.Text = ("Bạn chưa lựa chọn file Excel");
        //    }
        //  }
        //  catch (Exception ex)
        //  {
        //    lbKetQua.Text = ex.Message;
        //  }
        //}

        //private void Import_To_Grid(string FilePath, string Extension, string isHDR)
        //{
        //    string conStr = "";
        //    switch (Extension)
        //    {
        //        case ".xls":
        //            conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
        //            break;
        //        case ".xlsx":
        //            conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
        //            break;
        //    }
        //    conStr = String.Format(conStr, FilePath, isHDR);
        //    OleDbConnection connExcel = new OleDbConnection(conStr);
        //    OleDbCommand cmdExcel = new OleDbCommand();
        //    OleDbDataAdapter oda = new OleDbDataAdapter();
        //    DataTable dt = new DataTable();
        //    cmdExcel.Connection = connExcel;

        //    connExcel.Open();
        //    DataTable dtExcelSchema;
        //    dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        //    string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        //    connExcel.Close();

        //    connExcel.Open();
        //    cmdExcel.CommandText = "SELECT * FROM [" + SheetName + "]";
        //    DbDataReader dr = cmdExcel.ExecuteReader();
        //    string sqlConnectString = @"Data Source=WRONG-WAY;Initial Catalog=QL_Photocopy;Integrated Security=True";//Data Source=(local);Initial Catalog=admin_QL-Photocopy;User ID=admin_achen2610;Password=hungd@ica
        //    SqlBulkCopy bulkInsert = new SqlBulkCopy(sqlConnectString);
        //    bulkInsert.DestinationTableName = "SanPham";
        //    bulkInsert.WriteToServer(dr);
        //    lbKetQua.Text = "Import dữ liệu vào SQL thành công !";
        //    connExcel.Close();

        //    connExcel.Open();
        //    oda.SelectCommand = cmdExcel;
        //    oda.Fill(dt);
        //    connExcel.Close();

        //    if (dt.Rows.Count != 0)
        //    {
        //        rpSanPhamFromExcel.DataSource = dt;
        //        rpSanPhamFromExcel.DataBind();
        //    }
        //    else
        //    {
        //        rpSanPhamFromExcel.DataSource = null;
        //        rpSanPhamFromExcel.DataBind();
        //    }
        //}