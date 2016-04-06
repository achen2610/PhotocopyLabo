<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Photocopy.ProductDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="../Scripts/js/animate.min.css" />

    <script src="../Scripts/elevatezoom-master/jquery.elevateZoom-3.0.8.min.js"></script>
    <script src="../Scripts/elevatezoom-master/jquery.elevatezoom.js"></script>
    <title>NHẤT THIÊN TÂN | CHI TIẾT SẢN PHẨM</title>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">  
        <div class="row">
            <div class="col-md-5 col-sm-12">
                <!-- Slider -->
                <div class="row slider">
                    <%--<div style="height: 430px; width: 630px;" class="zoomWrapper">
                        <img style="border: 1px solid rgb(232, 232, 230); position: absolute;" id="zoom_03" src="Scripts/elevatezoom-master/images/small/image3.png" data-zoom-image="Scripts/elevatezoom-master/images/large/image3.jpg" width="630" />

                    </div>

                    <div id="gallery_01" style="width: 630px; float: left;">

                        <asp:Repeater ID="RptImages" runat="server">
                            <ItemTemplate>
                                <a href="#" class="elevatezoom-gallery active" data-update="" data-image="Images/sanpham/small/image1.png" data-zoom-image="Images/sanpham/large/image1.jpg">
                                    <img src="Images/sanpham/small/image1.png" width="100" />
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>

                        <a href="#" class="elevatezoom-gallery active" data-update="" data-image="Scripts/elevatezoom-master/images/small/image1.png" data-zoom-image="Scripts/elevatezoom-master/images/large/image1.jpg">
                            <img src="Scripts/elevatezoom-master/images/small/image1.png" width="100" />
                        </a>

                        <a href="#" class="elevatezoom-gallery" data-image="Scripts/elevatezoom-master/images/small/image2.png" data-zoom-image="Scripts/elevatezoom-master/images/large/image2.jpg">
                            <img src="Scripts/elevatezoom-master/images/small/image2.png" width="100" />
                        </a>

                        <a href="#" class="elevatezoom-gallery" data-image="Scripts/elevatezoom-master/images/small/image3.png" data-zoom-image="Scripts/elevatezoom-master/images/large/image3.jpg">
                            <img src="Scripts/elevatezoom-master/images/small/image3.png" width="100" />
                        </a>

                        <a href="#" class="elevatezoom-gallery" data-image="Scripts/elevatezoom-master/images/small/image4.png" data-zoom-image="Scripts/elevatezoom-master/images/large/image4.jpg">
                            <img src="Scripts/elevatezoom-master/images/small/image4.png" width="100" />
                        </a>


                    </div>--%>
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
                            <%--<p class="inline-block">Đánh giá sản phẩm :</p>
                            <div class="inline-block">
                                <span class="rating"><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span></span>
                            </div>--%>
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
            <%--<asp:Repeater ID="RptSameBrand" runat="server">
                <ItemTemplate>
                    <div class="col-sm-6 col-md-3">
                            
					    <div class="thumbnail tile item offer offer-danger">

                                <div class="caption1">
                                    <h4>Thông tin kỹ thuật</h4>
                                    <ul class="list-option-10">
                                        <asp:Repeater ID="rpOption10" runat="server">
                                            <ItemTemplate>
                                                <li><%#Eval("OptionName") %> : <%#Eval("OptionDescription") %></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                    <p><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>' class="linkimg label label-danger">chi tiết</a></p>
                                </div>
                                <img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' data-src="holder.js/300x300" alt="..." />

						    <div class="caption">
							    <div style="height:30px;">
                                    <h4><a href='/chi-tiet-ky-thuat/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                                    <asp:Label ID="lbsp1" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                                </div>
							    <p class="price-label">Giá : <%#Eval("Gia") %></p>
                            </div>
					    </div>
				    </div>
                        
                </ItemTemplate>
            </asp:Repeater>--%>
            
            <div class="projects">
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


		
		<%--<div class="row">
			<div class="details">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#detail" class="details-title" role="tab" data-toggle="tab">Thông số kỹ thuật</a></li>
					<li><a href="#comment" class="details-title" role="tab" data-toggle="tab">Nhận Xét</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="detail">

                        



					</div>
					<div class="tab-pane" id="comment">
						
                        <asp:ScriptManager runat="server" id="ScriptManager1"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="comment">
                                <div class="comment-name">
                                    <div class="comment-name-lb">
                                        Name
                                    </div>
                                    <div class="comment-name-name">
                                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Nhập tên"></asp:TextBox>
                                    </div>								
                                </div>
                                <div class="comment-content">
                                    <div class="comment-content-lb">
                                        Content
                                    </div>
                                    <div class="comment-content-content">
                                        <asp:TextBox ID="txtContent" runat="server" placeholder="Nhập nội dung" TextMode="MultiLine" Rows="4" Columns="100" CssClass="txtcontent form-control" onkeypress="return CheckMaxLength(this,500);" ></asp:TextBox>
                                    </div>
                                    <script type="text/javascript">
                                        function CheckMaxLength(txt, maxLen) {
                                            if (txt.value.length > (maxLen - 1))
                                                return false;
                                            else {
                                                return true;
                                            }
                                        }
                                    </script>
                                </div>
                                <div class="comment-button">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" OnClick="SendMessage" Text="Gửi tin" />
                                </div>
                            </div>
                            <div class="cmt-contents">
                                <asp:Repeater ID="RepDetails" runat="server">
                                    <HeaderTemplate>
                                        <div class="comments-title">
                                            <b>Comments</b>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
									    <div class="comments">
										    <div class="comments-name">
											    <div class="comments-name-name">
                                                    <%#Eval("Name") %>
											    </div>
                                                <div class="comments-name-date">
                                                    (<%#Eval("Postdate","{0:hh:mm dd-MM-yyyy}") %>)
                                                </div>
                                            
										    </div>
										    <div class="comments-content">
                                                <%#Eval("Content") %>
										    </div>
									    </div>
                                    </ItemTemplate>
                                    <FooterTemplate></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click">
                            </asp:AsyncPostBackTrigger>
                        </Triggers>
                        </asp:UpdatePanel>

                        <div class="button-loadmore">
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" onclick="LoadMore_Click" Text="Load More..." />
                        </div>
                        
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" ClientIDMode="Static">
                            <ProgressTemplate>
                                <b>Loading Additional Data....</b>
                            </ProgressTemplate>
                        </asp:UpdateProgress>

					</div>
				</div>
                
			</div>
		</div>--%>




	</div>

	<%--<script type="text/javascript" src="../Scripts/jquery-1.9.0.min.js"></script>--%>

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
