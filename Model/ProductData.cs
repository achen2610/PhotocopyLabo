using Photocopy.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Photocopy.Model
{
    public class ProductData
    {
        
        PhotocopyDataContext db = new PhotocopyDataContext();
                    

        //-------- Hàm liên quan đến sản phẩm ---------------------------------------

            public List<ProductRP> getProduct()
            {
                List<ProductRP> listSP = new List<ProductRP>();
                //listSP = db.SanPhams.ToList();
                var abc = (from sp in db.SanPhams
                            join nsx in db.NhaSanXuats on sp.MaSanXuat equals nsx.MaSanXuat
                            where sp.EnableP == true
                            select new
                            {
                                sp.SanPhamID,
                                sp.MaSanPham,
                                sp.MaSanXuat,
                                sp.TenSanPham,
                                sp.LoaiMay,
                                sp.DonGia,
                                sp.NgayNhapHang,
                                sp.SoLuong,
                                sp.ChoThue,
                                sp.Hot,
                                sp.LuotXem,
                                sp.Gia,
                                sp.HinhAnh,
                                nsx.TenSanXuat
                            }).ToList();
                for (int i = 0; i < abc.Count; i++)
                {
                    ProductRP sp = new ProductRP();
                    sp.ID = i + 1;
                    sp.SanPhamID = abc[i].SanPhamID;
                    sp.MaSanPham = abc[i].MaSanPham;
                    sp.MaSanXuat = abc[i].MaSanXuat;
                    sp.TenSanPham = abc[i].TenSanPham;
                    sp.LoaiMay = abc[i].LoaiMay.ToLower();
                    sp.DonGia = abc[i].DonGia;
                    sp.NgayNhapHang = abc[i].NgayNhapHang;
                    sp.SoLuong = abc[i].SoLuong;
                    sp.ChoThue = abc[i].ChoThue;
                    sp.Hot = abc[i].Hot;
                    sp.LuotXem = abc[i].LuotXem;
                    sp.Gia = abc[i].Gia;
                    sp.HinhAnh = abc[i].HinhAnh;
                    sp.NhaSanXuat = abc[i].TenSanXuat;
                    listSP.Add(sp);
                }
                return listSP;
            }
            // Trang chủ - Lấy danh sách sản phẩm
                // sản phẩm hot
                public List<ProductRP> getHotProduct()
                {
                    List<ProductRP> list = new List<ProductRP>();
                    var query = ((from sp in db.SanPhams
                                    join nsx in db.NhaSanXuats on sp.MaSanXuat equals nsx.MaSanXuat
                                    where sp.Hot == true && sp.EnableP == true
                                    orderby sp.LuotXem descending
                                    select new
                                    {
                                        sp.SanPhamID,
                                        sp.MaSanPham,
                                        sp.TenSanPham,
                                        sp.DonGia,
                                        sp.Gia,
                                        sp.Hot,
                                        sp.HinhAnh,
                                        nsx.TenSanXuat
                                    }).Take(4)).ToList();
                    for (int i = 0; i < query.Count(); i++)
                    {
                        ProductRP sp = new ProductRP();
                        sp.SanPhamID = query[i].SanPhamID;
                        sp.MaSanPham = query[i].MaSanPham;
                        sp.TenSanPham = query[i].TenSanPham;
                        sp.DonGia = query[i].DonGia;
                        sp.Gia = query[i].Gia;
                        sp.Hot = query[i].Hot;
                        sp.HinhAnh = query[i].HinhAnh;
                        sp.NhaSanXuat = query[i].TenSanXuat;

                        list.Add(sp);
                    }
                    return list;
                }
                // sản phẩm mua nhiều
                public List<ProductRP> getHotBuyProduct()
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = ((from sp in db.SanPhams
                              where sp.EnableP == true
                              orderby sp.LuotXem descending
                              select sp).Take(4)).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP sp = new ProductRP();
                    sp.TenSanPham = query[i].TenSanPham;
                    sp.DonGia = query[i].DonGia;
                    sp.Gia = query[i].Gia;
                    sp.HinhAnh = query[i].HinhAnh;
                    sp.SanPhamID = query[i].SanPhamID;
                    list.Add(sp);
                }
                return list;
            }
                // sản phẩm giảm giá
                public List<ProductRP> getSaleProduct()
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = ((from sp in db.SanPhams
                              join sale in db.Sales on sp.SanPhamID equals sale.SanPhamID
                              where sp.EnableP == true
                              orderby sp.LuotXem descending
                              select new
                              {
                                  sp.SanPhamID,
                                  sp.MaSanPham,
                                  sp.MaSanXuat,
                                  sp.Gia,
                                  sp.DonGia,
                                  sp.Hot,
                                  sp.NgayNhapHang,
                                  sp.LuotXem,
                                  sp.HinhAnh,
                                  sp.SoLuong,
                                  sp.TenSanPham,
                                  sale.SaleID,
                                  sale.GiaGiam,
                                  sale.NgayApDung,
                                  sale.NgayHetHan
                              }).Take(4)).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP sp = new ProductRP();
                    sp.TenSanPham = query[i].TenSanPham;
                    sp.DonGia = query[i].DonGia;
                    sp.Gia = query[i].Gia;
                    sp.GiaGiam = query[i].GiaGiam;
                    sp.NgayApDung = query[i].NgayApDung;
                    sp.NgayHetHan = query[i].NgayHetHan;
                    sp.SaleID = query[i].SaleID;
                    sp.HinhAnh = query[i].HinhAnh;
                    sp.SanPhamID = query[i].SanPhamID;
                    list.Add(sp);
                }
                return list;
            }
            // Lấy thông tin sản phẩm chi tiết
            public ProductRP getProduct(int Sanphamid)
            {
                var query = (from sp in db.SanPhams
                             join nsx in db.NhaSanXuats on sp.MaSanXuat equals nsx.MaSanXuat
                             where sp.SanPhamID == Sanphamid
                             select new
                             {
                                 sp.SanPhamID,
                                 sp.MaSanPham,
                                 sp.MaSanXuat,
                                 sp.Gia,
                                 sp.DonGia,
                                 sp.Hot,
                                 sp.NgayNhapHang,
                                 sp.LuotXem,
                                 sp.HinhAnh,
                                 sp.SoLuong,
                                 sp.TenSanPham,
                                 nsx.TenSanXuat
                             }).First();
                var checksale = from s in db.Sales
                                where s.SanPhamID == Sanphamid
                                select s;
                int n = checksale.Count();
                ProductRP sp1 = new ProductRP();
                sp1.SanPhamID = query.SanPhamID;
                sp1.Gia = query.Gia;
                sp1.DonGia = query.DonGia;
                sp1.Hot = query.Hot;
                sp1.MaSanPham = query.MaSanPham;
                sp1.MaSanXuat = query.MaSanXuat;
                sp1.NgayNhapHang = query.NgayNhapHang;
                sp1.LuotXem = query.LuotXem;
                sp1.HinhAnh = query.HinhAnh;
                sp1.SoLuong = query.SoLuong;
                sp1.TenSanPham = query.TenSanPham;
                sp1.NhaSanXuat = query.TenSanXuat;
                if (n == 1)
                {
                    sp1.GiaGiam = (checksale.First()).GiaGiam;
                    sp1.NgayApDung = (checksale.First()).NgayApDung;
                    sp1.NgayHetHan = (checksale.First()).NgayHetHan;
                }
                return sp1;

            }
            public ProductRP getProductSale(int Sanphamid)
            {
                var query = (from sp in db.SanPhams
                             join nsx in db.NhaSanXuats on sp.MaSanXuat equals nsx.MaSanXuat
                             join sale in db.Sales on sp.SanPhamID equals sale.SanPhamID
                             where sp.SanPhamID == Sanphamid
                             select new
                             {
                                 sp.SanPhamID,
                                 sp.MaSanPham,
                                 sp.MaSanXuat,
                                 sp.Gia,
                                 sp.DonGia,
                                 sp.Hot,
                                 sp.NgayNhapHang,
                                 sp.LuotXem,
                                 sp.HinhAnh,
                                 sp.SoLuong,
                                 sp.TenSanPham,
                                 nsx.TenSanXuat,
                                 sale.GiaGiam,
                                 sale.NgayApDung,
                                 sale.NgayHetHan
                             }).First();
                ProductRP sp1 = new ProductRP();
                sp1.SanPhamID = query.SanPhamID;
                sp1.Gia = query.Gia;
                sp1.DonGia = query.DonGia;
                sp1.Hot = query.Hot;
                sp1.MaSanPham = query.MaSanPham;
                sp1.MaSanXuat = query.MaSanXuat;
                sp1.NgayNhapHang = query.NgayNhapHang;
                sp1.LuotXem = query.LuotXem;
                sp1.HinhAnh = query.HinhAnh;
                sp1.SoLuong = query.SoLuong;
                sp1.TenSanPham = query.TenSanPham;
                sp1.NhaSanXuat = query.TenSanXuat;
                sp1.GiaGiam = query.GiaGiam;
                sp1.NgayApDung = query.NgayApDung;
                sp1.NgayHetHan = query.NgayHetHan;
                return sp1;

            }
            // Trang tìm kiếm - Lấy danh sách tìm kiếm
            public List<ProductRP> returnResultProduct(string chuoi)
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = (from n in db.SanPhams
                             where n.EnableP == true
                             select new
                             {
                                 n.TenSanPham,
                                 n.SanPhamID,
                                 n.HinhAnh,
                                 n.DonGia,
                                 n.Gia
                             }).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP sp = new ProductRP();
                    if (NewBruteForce(chuoi, query[i].TenSanPham.Trim()) == true)
                    {
                        sp.TenSanPham = query[i].TenSanPham;
                        sp.SanPhamID = query[i].SanPhamID;
                        sp.DonGia = query[i].DonGia;
                        sp.Gia = query[i].Gia;
                        sp.HinhAnh = query[i].HinhAnh;
                        list.Add(sp);
                    }
                }
                return list;
            }
            // Trang Photocopy.aspx && Print.aspx - Láy danh sách theo nhà sản xuất , hay thể loại
            public List<ProductRP> getProductWithBrandWithType(string brand, string type)
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = (from n in db.SanPhams
                             where n.MaSanXuat == brand && n.LoaiMay == type && n.EnableP == true
                             select n).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP p = new ProductRP();
                    p.ID = i + 1;
                    p.SanPhamID = query[i].SanPhamID;
                    p.Gia = query[i].Gia;
                    p.DonGia = query[i].DonGia;
                    p.Hot = query[i].Hot;
                    p.MaSanPham = query[i].MaSanPham;
                    p.MaSanXuat = query[i].MaSanXuat;
                    p.NgayNhapHang = query[i].NgayNhapHang;
                    p.LuotXem = query[i].LuotXem;
                    p.HinhAnh = query[i].HinhAnh;
                    p.SoLuong = query[i].SoLuong;
                    p.TenSanPham = query[i].TenSanPham;
                    list.Add(p);
                }
                return list;
            }
            public List<ProductRP> getProductWithType(string type)
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = (from n in db.SanPhams
                             where n.LoaiMay == type && n.EnableP == true
                             select n).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP p = new ProductRP();
                    p.ID = i + 1;
                    p.SanPhamID = query[i].SanPhamID;
                    p.Gia = query[i].Gia;
                    p.DonGia = query[i].DonGia;
                    p.Hot = query[i].Hot;
                    p.MaSanPham = query[i].MaSanPham;
                    p.MaSanXuat = query[i].MaSanXuat;
                    p.LoaiMay = query[i].LoaiMay.ToLower();
                    p.NgayNhapHang = query[i].NgayNhapHang;
                    p.LuotXem = query[i].LuotXem;
                    p.HinhAnh = query[i].HinhAnh;
                    p.SoLuong = query[i].SoLuong;
                    p.TenSanPham = query[i].TenSanPham;
                    list.Add(p);
                }
                return list;
            }
            // Trang ProductDetail - Lấy danh sách sản phẩm cùng thương hiệu.
            public List<ProductRP> getProductSameBrand(string Masanxuat, int Sanphamid)
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = (from n in db.SanPhams
                             where n.MaSanXuat == Masanxuat && n.EnableP == true
                             select n).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP product = new ProductRP();
                    if (query[i].SanPhamID != Sanphamid)
                    {
                        product.SanPhamID = query[i].SanPhamID;
                        product.TenSanPham = query[i].TenSanPham;
                        product.MaSanXuat = query[i].MaSanXuat;
                        product.MaSanPham = query[i].MaSanPham;
                        product.DonGia = query[i].DonGia;
                        product.Gia = query[i].Gia;
                        product.SoLuong = query[i].SoLuong;
                        product.NgayNhapHang = query[i].NgayNhapHang;
                        product.LuotXem = query[i].LuotXem;
                        product.HinhAnh = query[i].HinhAnh;
                        list.Add(product);
                    }
                }
                return list;
            }
            // Trang RentServices - Lấy danh sách sản phẩm cho thuê 
            public List<ProductRP> getRentProduct()
            {
                List<ProductRP> list = new List<ProductRP>();
                var query = (from sp in db.SanPhams
                             where sp.ChoThue == true && sp.EnableP == true
                             orderby sp.LuotXem descending
                             select new
                             {
                                 sp.SanPhamID,
                                 sp.MaSanPham,
                                 sp.TenSanPham,
                                 sp.DonGia,
                                 sp.Gia,
                                 sp.HinhAnh
                             }).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    ProductRP sp = new ProductRP();
                    sp.SanPhamID = query[i].SanPhamID;
                    sp.MaSanPham = query[i].MaSanPham;
                    sp.TenSanPham = query[i].TenSanPham;
                    sp.DonGia = query[i].DonGia;
                    sp.Gia = query[i].Gia;
                    sp.HinhAnh = query[i].HinhAnh;
                    list.Add(sp);
                }
                return list;
            }
            // Trang EditProduct - Lấy thông tin sản phẩm để sửa
            public ProductRP getProductEdit(int Sanphamid)
            {
                var query = from product in db.SanPhams
                            where product.SanPhamID == Sanphamid
                            select product;
                ProductRP pro = new ProductRP();
                foreach (var n in query)
                {
                    pro.SanPhamID = n.SanPhamID;
                    pro.MaSanPham = n.MaSanPham;
                    pro.MaSanXuat = n.MaSanXuat;
                    pro.TenSanPham = n.TenSanPham;
                    pro.DonGia = n.DonGia;
                    pro.Gia = n.Gia;
                    pro.SoLuong = n.SoLuong;
                    pro.NgayNhapHang = n.NgayNhapHang;
                    pro.HinhAnh = n.HinhAnh;
                    pro.Hot = n.Hot;
                    pro.ChoThue = n.ChoThue;
                    pro.LoaiMay = n.LoaiMay;
                }
                return pro;
            }
            // Hàm xóa sản phẩm
            public void DeleteProduct(int Sanphamid)
            {
                var query = (from n in db.SanPhams
                             where n.SanPhamID == Sanphamid
                             select n).First();
                query.TenSanPham = "";
                query.MaSanPham = "";
                query.MaSanXuat = "";
                query.LuotXem = null;
                query.NgayNhapHang = null;
                query.LoaiMay = "";
                query.HinhAnh = "";
                query.DonGia = 0;
                query.Gia = "";
                query.Hot = null;
                query.ChoThue = null;
                query.EnableP = false;

                var queryOption = (from m in db.Options
                                   where m.SanPhamID == Sanphamid
                                   select m).ToList();
                for (int i = 0; i < queryOption.Count(); i++)
                {
                    queryOption[i].SanPhamID = null;
                    queryOption[i].OptionName = "";
                    queryOption[i].OptionDescription = "";
                    queryOption[i].EnableOp = false;
                }
                db.SubmitChanges();
            }
            // Cập nhập thông tin sản phẩm
            public void UpdateProduct(ProductRP product)
            {
                var query = (from sp in db.SanPhams
                             where sp.SanPhamID == product.SanPhamID
                             select sp).First();
                query.TenSanPham = product.TenSanPham;
                query.MaSanPham = product.MaSanPham;
                query.MaSanXuat = product.MaSanXuat;
                query.DonGia = product.DonGia;
                query.Gia = product.Gia;
                query.SoLuong = product.SoLuong;
                db.SubmitChanges();
            }
            // Hàm thêm sản phẩm - Chưa dùng
            public void InsertProduct(ProductRP product)
            {
                SanPham sp = new SanPham();
                sp.MaSanPham = product.MaSanPham;
                sp.TenSanPham = product.TenSanPham;
                sp.MaSanXuat = product.MaSanXuat;
                sp.DonGia = product.DonGia;
                sp.Gia = product.Gia;
                sp.SoLuong = product.SoLuong;
                sp.NgayNhapHang = product.NgayNhapHang;
                db.SanPhams.InsertOnSubmit(sp);
                db.SubmitChanges();
            }
        //-------------------------------------------------------------------------


        //-------- Hàm liên quan đến chức năng sản phẩm ---------------------------
            
            // Lấy danh sách chức năng của tất cả sản phẩm
            public List<OptionDetail> GetFullOption()
            {
                var query = db.Options.ToList();
                List<OptionDetail> list = new List<OptionDetail>();
                for (int i = 0; i < query.Count(); i++)
                {
                    OptionDetail od = new OptionDetail();
                    od.OptionID = query[i].OptionID;
                    od.SanPhamID = query[i].SanPhamID;
                    od.OptionName = query[i].OptionName;
                    od.OptionDescription = query[i].OptionDescription;
                    list.Add(od);
                }
                return list;
            }
            // Lấy danh sách chức năng theo sản phẩm
            public List<OptionDetail> GetOption(int SanPhamID)
            {
                List<OptionDetail> listoption = new List<OptionDetail>();
                var query = (from option in db.Options
                             where option.SanPhamID == SanPhamID
                             select option).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    OptionDetail od = new OptionDetail();
                    od.SanPhamID = query[i].SanPhamID;
                    od.OptionID = query[i].OptionID;
                    od.OptionName = query[i].OptionName;
                    od.OptionDescription = query[i].OptionDescription;
                    listoption.Add(od);
                }
                return listoption;
            }
            // Thêm chức năng
            public void AddOption(OptionDetail od)
            {
                var check = from n in db.Options
                            where n.EnableOp == false
                            select n;
                if (check.Count() > 0)
                {
                    var query = (from n in db.Options
                                 where n.EnableOp == false
                                 select n).First();
                    query.SanPhamID = od.SanPhamID;
                    query.OptionName = od.OptionName;
                    query.OptionDescription = od.OptionDescription;
                    query.EnableOp = true;
                    db.SubmitChanges();
                }
                else
                {
                    Option option = new Option();
                    option.SanPhamID = od.SanPhamID;
                    option.OptionName = od.OptionName;
                    option.OptionDescription = od.OptionDescription;
                    option.EnableOp = true;
                    db.Options.InsertOnSubmit(option);
                    db.SubmitChanges();
                }
            }
            // Cập nhập chức năng
            public void UpdateOption(OptionDetail od)
            {
                var query = (from n in db.Options
                             where n.OptionID == od.OptionID
                             select n).First();
                query.SanPhamID = od.SanPhamID;
                query.OptionName = od.OptionName;
                query.OptionDescription = od.OptionDescription;
                db.SubmitChanges();
            }
            // Xóa chức năng
            public void DeleteOption(int OptionID)
            {
                var option = (from o in db.Options
                              where o.OptionID == OptionID
                              select o).First();
                option.SanPhamID = null;
                option.OptionName = "";
                option.OptionDescription = "";
                option.EnableOp = false;
                db.SubmitChanges();
            }


        //-------------------------------------------------------------------------


        //-------- Hàm liên quan đến tin tức --------------------------------------

            public List<tinTuc> getListNews()
            {
                var query = (from n in db.TinTucs
                             select n).ToList();
                List<tinTuc> list = new List<tinTuc>();
                for (int i = 0; i < query.Count(); i++)
                {
                    tinTuc tt = new tinTuc();
                    tt.TinTucID = query[i].TinTucID;
                    tt.TinTucTitle = query[i].TinTucTitle;
                    tt.TinTucQuote = query[i].TinTucQuote;
                    tt.TinTucImage = query[i].TinTucImage;
                    tt.TinTucPostDate = query[i].TinTucPostDate;
                    tt.TinTucHot = query[i].TinTucHot;
                    tt.TinTucContent = query[i].TinTucContent;
                    list.Add(tt);
                }
                return list;
            }
            public tinTuc getNewsDetail(int TinTucID)
            {
                var query = from n in db.TinTucs
                            where n.TinTucID == TinTucID
                            select n;
                tinTuc tt = new tinTuc();
                foreach (var i in query)
                {
                    tt.TinTucID = i.TinTucID;
                    tt.TinTucTitle = i.TinTucTitle;
                    tt.TinTucImage = i.TinTucImage;
                    tt.TinTucQuote = i.TinTucQuote;
                    tt.TinTucPostDate = i.TinTucPostDate;
                    tt.TinTucHot = i.TinTucHot;
                    tt.TinTucContent = i.TinTucContent;
                }
                return tt;
            }
            public void AddNews(tinTuc tt)
            {
                TinTuc tintuc = new TinTuc();
                tintuc.TinTucID = tt.TinTucID;
                tintuc.TinTucTitle = tt.TinTucTitle;
                tintuc.TinTucQuote = tt.TinTucQuote;
                tintuc.TinTucPostDate = tt.TinTucPostDate;
                tintuc.TinTucImage = tt.TinTucImage;
                tintuc.TinTucHot = tt.TinTucHot;
                tintuc.TinTucContent = tt.TinTucContent;
                db.TinTucs.InsertOnSubmit(tintuc);
                db.SubmitChanges();
            }
            public void DeleteNews(int tintucID)
            {
                var n = db.TinTucs.Where(a => a.TinTucID.Equals(tintucID)).First();
                db.TinTucs.DeleteOnSubmit(n);
                db.SubmitChanges();
            }
            public void UpdateNews(tinTuc news)
            {
                var n = db.TinTucs.Where(a => a.TinTucID.Equals(news.TinTucID)).First();
                n.TinTucTitle = news.TinTucTitle;
                n.TinTucContent = news.TinTucContent;
                n.TinTucImage = news.TinTucImage;
                n.TinTucQuote = news.TinTucQuote;
                n.TinTucHot = news.TinTucHot;
                db.SubmitChanges();
            }


        //-------------------------------------------------------------------------


        //-------- Hàm liên quan đến tin tức liên quan ----------------------------

            // Trang ProductDetail - Lấy danh sách tin liên quan theo sản phẩm
            public List<relatedNews> getRelatedNews(int Sanphamid)
            {
                List<relatedNews> list = new List<relatedNews>();
                var query = (from n in db.RelatedNews
                             where n.SanPhamID == Sanphamid
                             select n).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    relatedNews rnews = new relatedNews();
                    rnews.relatedNewsID = query[i].RelatedNewsID;
                    rnews.sanPhamID = query[i].SanPhamID;
                    rnews.relatedNewsName = query[i].RelatedNewsName;
                    rnews.relatedNewsLink = query[i].RelatedNewsLink;
                    rnews.tinTucID = query[i].TinTucID;
                    rnews.EnableRN = query[i].EnableRN;
                    list.Add(rnews);
                }
                return list;
            }
            // Thêm tin liên quan
            public void AddRelatedNews(relatedNews rn)
            {
                var check = from n in db.RelatedNews
                            where n.EnableRN == false
                            select n;
                if (check.Count() > 0)
                {
                    var query = (from n in db.RelatedNews
                                 where n.EnableRN == false
                                 select n).First();
                    query.SanPhamID = rn.sanPhamID;
                    query.RelatedNewsName = rn.relatedNewsName;
                    query.RelatedNewsLink = rn.relatedNewsLink;
                    query.EnableRN = true;
                    if (rn.tinTucID != null)
                    {
                        query.TinTucID = rn.tinTucID;
                    }
                    else
                    {
                        query.TinTucID = null;
                    }
                    db.SubmitChanges();
                }
                else
                {
                    RelatedNew relatednews = new RelatedNew();
                    relatednews.SanPhamID = rn.sanPhamID;
                    relatednews.RelatedNewsName = rn.relatedNewsName;
                    relatednews.RelatedNewsLink = rn.relatedNewsLink;
                    relatednews.EnableRN = true;
                    if (rn.tinTucID != null)
                    {
                        relatednews.TinTucID = rn.tinTucID;
                    }
                    else
                    {
                        relatednews.TinTucID = null;
                    }
                    db.RelatedNews.InsertOnSubmit(relatednews);
                    db.SubmitChanges();
                }
            }
            // Cập nhập tin liên quan
            public void UpdateRelatedNews(relatedNews rn)
            {
                var query = (from n in db.RelatedNews
                             where n.RelatedNewsID == rn.relatedNewsID
                             select n).First();
                query.SanPhamID = rn.sanPhamID;
                query.RelatedNewsName = rn.relatedNewsName;
                query.RelatedNewsLink = rn.relatedNewsLink;
                query.TinTucID = rn.tinTucID;
                db.SubmitChanges();
            }
            // Xóa tin liên quan
            public void DeleteRelatedNews(int rnID)
            {
                var query = (from n in db.RelatedNews
                             where n.RelatedNewsID == rnID
                             select n).First();
                query.SanPhamID = null;
                query.RelatedNewsName = "";
                query.RelatedNewsLink = "";
                query.TinTucID = null;
                query.EnableRN = false;
                db.SubmitChanges();
            }


        //-------------------------------------------------------------------------

        //-------- Hàm liên quan đến hỗ trợ kỹ thuật  -----------------------------

            public List<Technique> getTechniqueSupport()
            {
                List<Technique> list = new List<Technique>();
                var query = (from n in db.TechniqueSupports
                             where n.EnableT == true
                            select n).ToList();
                for(int i=0;i<query.Count();i++)
                {
                    Technique t = new Technique();
                    t.TechniqueID = query[i].TechniqueID;
                    t.TechniqueName = query[i].TechniqueName;
                    t.TechniqueContent = query[i].TechniqueContent;
                    t.PostDate = query[i].PostDate;
                    list.Add(t);
                }
                return list;
            }
            // Lấy thông tin chi tiết
            public Technique getTechniqueSupportDetail(int techniqueid)
            {
                var query = from n in db.TechniqueSupports
                            where n.TechniqueID == techniqueid
                            select n;
                Technique t = new Technique();
                foreach(var n in query)
                {
                    t.TechniqueID = n.TechniqueID;
                    t.TechniqueName = n.TechniqueName;
                    t.TechniqueContent = n.TechniqueContent;
                    t.PostDate = n.PostDate;
                }
                return t;
            }
            // Thêm kỹ thuật
            public void AddTechniqueSupport(Technique t)
            {
                var check = from n in db.TechniqueSupports
                            where n.EnableT == false
                            select n;
                if (check.Count() > 0)
                {
                    var query = (from n in db.TechniqueSupports
                                 where n.EnableT == false
                                 select n).First();
                    query.TechniqueName = t.TechniqueName;
                    query.TechniqueContent = t.TechniqueContent;
                    query.PostDate = t.PostDate;
                    query.EnableT = true;
                    db.SubmitChanges();
                }
                else
                {
                    TechniqueSupport tech = new TechniqueSupport();
                    tech.TechniqueName = t.TechniqueName;
                    tech.TechniqueContent = t.TechniqueContent;
                    tech.EnableT = true;
                    db.TechniqueSupports.InsertOnSubmit(tech);
                    db.SubmitChanges();
                }
            }
            // Cập nhập kỹ thuật
            public void UpdateTechniqueSupport(Technique t)
            {
                var query = (from n in db.TechniqueSupports
                             where n.TechniqueID == t.TechniqueID
                             select n).First();
                query.TechniqueName = t.TechniqueName;
                query.TechniqueContent = t.TechniqueContent;
                db.SubmitChanges();
            }
            // Xóa
            public void DeleteTechniqueSupport(int TechniqueID)
            {
                var query = (from n in db.TechniqueSupports
                             where n.TechniqueID == TechniqueID
                             select n).First();
                query.TechniqueName = "";
                query.TechniqueContent = "";
                query.EnableT = false;
                db.SubmitChanges();
            }

        //-------------------------------------------------------------------------

        //-------- Hàm liên quan đến đối tác vs khách hàng  -----------------------

            public List<customer> getCustomer()
            {
                List<customer> list = new List<customer>();
                var n = db.Customers.ToList();

                for (int i = 0; i < n.Count();i++ )
                {
                    customer c = new customer();
                    c.customerID = n[i].CustomerID;
                    c.idSlide = n[i].CustomerID - 1;
                    c.customerName = n[i].CustomerName;
                    c.customerImage = n[i].CustomerImage;
                    list.Add(c);
                }
                return list;
            }
            public void AddCustomer(customer c)
            {
                Customer kh = new Customer();
                kh.CustomerName = c.customerName;
                kh.CustomerImage = c.customerImage;
                db.Customers.InsertOnSubmit(kh);
                db.SubmitChanges();
            }
            public void UpdateCustomer(customer c)
            {
                var query = (from n in db.Customers
                             where n.CustomerID == c.customerID
                             select n).First();
                query.CustomerName = c.customerName;
                query.CustomerImage = c.customerImage;
                db.SubmitChanges();
            }
            public void DeleteCustomer(int customerid)
            {
                var query = (from n in db.Customers
                             where n.CustomerID == customerid
                             select n).First();
                db.Customers.DeleteOnSubmit(query);
                db.SubmitChanges();
            }

        //-------------------------------------------------------------------------

        //-------- Hàm liên quan đến tài khoản ---------------------------------------

            public List<user> getUser()
            {
                List<user> list = new List<user>();
                var n = db.Users.ToList();

                for(int i =0;i<n.Count();i++)
                {
                    user u = new user();
                    u.userID = n[i].UserID;
                    u.userName = n[i].Username;
                    u.userPass = n[i].Password;
                    u.userEmail = n[i].Email;
                    list.Add(u);
                }
                return list;
            }
            public void AddUser(user u)
            {
                User t = new User();
                t.Username = u.userName;
                t.Password = u.userPass;
                t.Email = u.userEmail;
                db.Users.InsertOnSubmit(t);
                db.SubmitChanges();
            }
            public void UpdateUser(user u)
            {
                var query = (from n in db.Users
                             where n.UserID == u.userID
                             select n).First();
                query.Username = u.userName;
                query.Password = u.userPass;
                query.Email = u.userEmail;
                db.SubmitChanges();
            }
            public void DeleteUser(int userID)
            {
                var query = (from n in db.Users
                             where n.UserID == userID
                             select n).First();
                db.Users.DeleteOnSubmit(query);
                db.SubmitChanges();
            }

        //--------------------------------------------------------------------------

        //-------- Hàm phụ trợ ----------------------------------------------------
            
            // Trang chủ - Lấy sơ lược 10 chức năng sản phẩm
            public List<OptionDetail> getOption8(int sanphamid)
            {
                List<OptionDetail> list = new List<OptionDetail>();
                var query = ((from n in db.Options
                              where n.SanPhamID == sanphamid
                              select n).Take(8)).ToList();
                for (int i = 0; i < query.Count(); i++)
                {
                    OptionDetail option = new OptionDetail();
                    option.OptionID = query[i].OptionID;
                    option.OptionName = query[i].OptionName;
                    option.OptionDescription = query[i].OptionDescription;
                    list.Add(option);
                }
                return list;
            }
            // Hàm kiểm tra sản phẩm có được giảm giá hay không ?
            public bool CheckSale(int Sanphamid)
            {
                bool b = true;
                var query = from sp in db.Sales
                            where sp.SanPhamID == Sanphamid
                            select sp;
                int n = query.Count();
                if (n == 0)
                {
                    b = false;
                }
                else if (n == 1)
                {
                    b = true;
                }
                return b;
            }
            // Hàm kiểm tra chuỗi trong chuỗi 
            bool NewBruteForce(string p, string t)
            {
                p = p.ToLower();
                t = t.ToLower();
                if ((t.Length == 0) || (p.Length == 0) || (p.Length > t.Length))
                    return false;
                int stop = t.Length - p.Length;
                int start = 0;
                int j = start;
                for (int i = start; i <= stop; )
                {
                    if (p[j] == t[i + j])
                        j++;
                    else
                    {
                        j = start;
                        i++;
                    }
                    if (j == p.Length)
                        return true;
                }
                return false;
            }
            // Hàm đếm lượt truy cập và người online
                public int GetPageView(int id)
                {
                    var query = from n in db.Visits
                                where n.VisitID == id
                                select n;
                    int pageview = 0;
                    foreach (var i in query)
                    {
                        pageview = i.pageviews;
                    }
                    return pageview;
                }
                public void ReturnPageView(int id)
                {
                    var query = (from n in db.Visits
                                 where n.VisitID == id
                                 select n).First();
                    query.pageviews += 1;
                    db.SubmitChanges();

                }
                public void IncreaseUserOnline(int id)
                {
                    var query = (from n in db.Visits
                                 where n.VisitID == id
                                 select n).First();
                    query.useronline += 1;
                    db.SubmitChanges();
                }
                public void DecreaseUserOnline(int id)
                {
                    var query = (from n in db.Visits
                                 where n.VisitID == id
                                 select n).First();
                    query.useronline -= 1;
                    db.SubmitChanges();
                }
                //public int GetUserOnline(int id)
                //{
                //    var query = from n in db.Visits
                //                where n.VisitID == id
                //                select n;
                //    int useronline = 0;
                //    foreach(var i in query)
                //    {
                //        useronline = i.useronline;
                //    }
                //    return useronline;
                //}

                //------------- Hàm đếm lượt view sản phẩm --------------
                public void IncreaseViewProduct(int Sanphamid)
                {
                    var query = (from n in db.SanPhams
                                 where n.SanPhamID == Sanphamid
                                 select n).First();
                    query.LuotXem += 1;
                    db.SubmitChanges();
                }

            // Hàm lấy STT SanPham và Option hiện tại
            public int getLastSttSanphamOrOption(int code)
            {
                int i = 0;
                if (code == 0)
                {
                    var query = (from n in db.Options
                                 orderby n.OptionID descending
                                 select n).Take(1);
                    foreach (var j in query)
                    {
                        i = j.OptionID;
                    }
                }
                else if (code == 1)
                {
                    var query = (from n in db.SanPhams
                                 orderby n.SanPhamID descending
                                 select n).Take(1);
                    foreach (var t in query)
                    {
                        i = t.SanPhamID;
                    }
                }
                return i;
            }


            

//------------------------------------------------------------------


        //-------- Hàm xử lý bình luận ( chưa sử dụng ) ---------------------------


            public int GetSanphamID(string Masanpham, string Masanxuat, string Tensanpham)
            {
                int sanphamid = 0;
                var query = from sp in db.SanPhams
                            where sp.MaSanPham == Masanpham && sp.MaSanXuat == Masanxuat && sp.TenSanPham == Tensanpham
                            select sp;
                foreach (var n in query)
                {
                    sanphamid = n.SanPhamID;
                }
                return sanphamid;
            }
            //public List<Message> GetMessage(int Sanphamid, int Top)
            //{
            //    List<Message> listms = new List<Message>();
            //    var query = ((from cmt in db.Comments
            //                  where cmt.SanPhamID == Sanphamid
            //                  orderby cmt.ID descending
            //                  select cmt).Take(Top)).ToList();
            //    for (int i = 0; i < query.Count; i++)
            //    {
            //        Message ms = new Message();
            //        ms.Name = query[i].Name;
            //        ms.Content = query[i].Comt;
            //        ms.Postdate = query[i].Postdate;
            //        listms.Add(ms);
            //    }
            //    return listms;
            //}
            //public void SaveMessage(int SanphamID, string Name, string Content, DateTime dt)
            //{
            //    Comment cmt = new Comment();
            //    cmt.Name = Name;
            //    cmt.Comt = Content;
            //    cmt.Postdate = dt;
            //    cmt.SanPhamID = SanphamID;
            //    db.Comments.InsertOnSubmit(cmt);
            //    db.SubmitChanges();
            //}
            //public int GetRowMes(int SanphamID)
            //{
            //    int row = 0;
            //    var query = from ms in db.Comments
            //                where ms.SanPhamID == SanphamID
            //                select ms;
            //    foreach (var n in query)
            //    {
            //        row++;
            //    }
            //    return row;
            //}

        //-------------------------------------------------------------------------


        
    }
}