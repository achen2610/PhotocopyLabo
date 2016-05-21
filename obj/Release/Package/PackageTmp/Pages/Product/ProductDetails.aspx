<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Photocopy.ProductDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="../Scripts/js/animate.min.css" />

    <script src="../Scripts/elevatezoom-master/jquery.elevateZoom-3.0.8.min.js"></script>
    <script src="../Scripts/elevatezoom-master/jquery.elevatezoom.js"></script>
    <title>Nhất Thiên Tân | Chi tiết sản phẩm</title>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">  
        <div class="row">
            <div class="col-md-5 col-sm-12">
                <!-- Slider -->
                <div class="row slider">
                    <asp:Image ID="imgProductDetail" runat="server" CssClass="img-responsive" style="margin:auto;" />
                </div>

                

            </div>

            <div class="col-md-7 col-sm-12">
                <div class="detail">
                    <div class="detail-l1">
                        <h3>
                            <asp:Label runat="server" ID="lblTenSanPham"></asp:Label>
                        </h3>
                        <div class="chitiet-rating">
                        </div>
                    </div>
                    

                    <div class="row">
                        <div class="col-md-6 col-sm-12 chitiet-cot1">
                            <div class="chitiet-tinhtrang">
                                <asp:Label ID="Label1" runat="server" Text="Tình trạng :"></asp:Label>
                                <asp:Label ID="LBTinhTrang" runat="server"></asp:Label>
                            </div>
                            <div class="dongia">
                                <div id="dongiagiagiam" class="middle" runat="server" style="display: none">
                                    <div class="col1">
                                        <div class="discount-box">
                                            -<asp:Label ID="lbGiaGiam" CssClass="giagiam" runat="server"></asp:Label><span>%</span>
                                        </div>
                                    </div>
                                    <div class="col2">
                                        <div class="price-box">
                                            <p class="old-price">
                                                <asp:Label runat="server" CssClass="price" ID="lbDonGia"></asp:Label>
                                            </p>
                                            <p class="special-price">
                                                <asp:Label runat="server" CssClass="price" ID="lbDonGiaMoi"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div id="dongiakhonggiam" runat="server" style="display: none">
                                    Giá : <asp:Label runat="server" CssClass="chitiet-dongia" ID="lblDonGia"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 chitiet-cot2">
                            <div class="chitiet-chinhhang">
                                <asp:Label ID="Label2" runat="server" Text="Đảm bảo hàng chính hãng"></asp:Label>
                            </div>
                            <div class="chitiet-baohanh">
                                <span>Bảo hành : </span>
                                <asp:Label ID="Label3" CssClass="font-weight" runat="server" Text="2 năm"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="detail-product">
                            <div class="title-detail-product">
                                <p>THÔNG TIN ĐẶC TÍNH KĨ THUẬT</p>
                            </div>
                            <div class="info-detail-product">
                                <asp:Repeater ID="RepeaterOption" runat="server">
                                    <ItemTemplate>
                                        <div class="row option-detail">
                                            <div class="col-md-6 option-name">
                                                <asp:Label ID="OptionName" runat="server" Text='<%#Eval("OptionName") %>'></asp:Label>
                                            </div>
                                            <div class="col-md-6 option-description">
                                                <asp:Label ID="OptionDescription" runat="server" Text='<%#Eval("OptionDescription") %>'></asp:Label>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="row fb-comment">
            <asp:Repeater ID="rptFacebook" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="fb-like" data-href='http://nhatthientan.com/chi-tiet-san-pham/<%#Eval("SanPhamID") %>' data-width="615" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
                    </div>
                    <div class="row">
                        <div class="fb-comments" data-href='http://nhatthientan.com/chi-tiet-san-pham/<%#Eval("SanPhamID") %>' data-width="615" data-numposts="5"></div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
		
        <!-- Banner liên hệ , bảo trì , vận chuyển -->
        <div class="row mg-top-20">
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div class="product-support">
                    <i class="fa fa-mobile"></i>
                    <div>
                    <h4>
                        0511 3829 979
                    </h4>
                    <em>Hỗ trợ 24/7</em>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div class="product-support">
                    <i class="fa fa-wrench"></i>
                    <div>
                    <h4>
                        Bảo hành tận nơi
                    </h4>
                    <em>Khách hàng</em>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div class="product-support">
                    <i class="fa fa-truck"></i>
                    <div>
                    <h4>
                        Giao hàng miễn phí
                    </h4>
                    <em>Tại Đà Nẵng</em>
                    </div>
                </div>
            </div>
        </div>

        <!-- List sản phẩm cùng thương hiệu -->
        <div class="row mg-top-20 same-brand">
            <div class="title-same-brand">
                <p>SẢN PHẨM CÙNG THƯƠNG HIỆU</p>
            </div>
            
            <div class="product">
			    <asp:Repeater ID="RptSameBrand" runat="server">
                    <ItemTemplate>
			            <!-- Item -->
			            <div class="col-md-3 col-sm-4 <%#Eval("LoaiMay") %>">
				            <a href="/chi-tiet-san-pham/<%#Eval("SanPhamID") %>">
					            <img src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' alt="" />
					            <div class="overlay">
						            <div class="overlay-content">
							            <h4><%#Eval("TenSanPham") %></h4>
						            </div>
					            </div>
				            </a>
			            </div>
                    </ItemTemplate>
                </asp:Repeater>
		    </div>	
        </div>


	</div>

    <div id="fb-root"></div>
    <script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    <%--<script src="Scripts/elevatezoom-master/jquery.elevateZoom-3.0.8.min.js"></script>
    <script src="Scripts/elevatezoom-master/jquery.elevatezoom.js"></script>
    <script>
       
        $("#zoom_03").elevateZoom({ gallery: 'gallery_01', cursor: 'pointer', galleryActiveClass: "active", imageCrossfade: true, loadingIcon: "Images/loading.png" });

            $("#zoom_03").bind("click", function (e) {
                var ez = $('#zoom_03').data('elevateZoom');
                ez.closeAll(); //NEW: This function force hides the lens, tint and window	
                $.fancybox(ez.getGalleryList());
                return false;
            });
    </script>--%>
   
   
</asp:Content>
