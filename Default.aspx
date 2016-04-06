<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Photocopy.Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nhất Thiên Tân - Chuyên cung cấp và cho thuê máy photocopy</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-lg-8">
            <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic1" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic1" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic1" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic1" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic1" data-slide-to="4"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide1_zpsxbbsk0du.jpg" alt="slide2" />
                        <div class="carousel-caption">
                            Bán và cho thuê máy photocopy tại Đà Nẵng
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide2_zpsuecgt6ql.jpg" alt="slide5" />
                        <div class="carousel-caption">
                            Cho thuê máy photocopy
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide3_zpsktuaifum.jpg" alt="slide1" />
                        <div class="carousel-caption">
                            Cho thuê máy photocopy
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide4_zpstifufqza.jpg" alt="slide6" />
                        <div class="carousel-caption">
                            Máy Photocopy RICOH
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide5_zps6enkbhkh.jpg" alt="slide3" />
                        <div class="carousel-caption">
                            Máy Fax RICOH
                        </div>
                    </div>
                </div>

              <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic1" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic1" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <%--<div id="slider2" class="nivoSlider">
                <a href="http://www.2my4edge.com">
                    <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide1_zpsxbbsk0du.jpg" alt="slide2" />
                </a>
                    <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide2_zpsuecgt6ql.jpg" alt="slide5" />
                    <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide3_zpsktuaifum.jpg" alt="slide1" />
                    <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide4_zpstifufqza.jpg" alt="slide6" />
                    <img src="http://i1056.photobucket.com/albums/t378/hungld/Slide/slide5_zps6enkbhkh.jpg" alt="slide3" />
            </div>--%>

        </div>
        <div class="col-lg-4 vertical">
            <h3 class="title-latest-news mg-0">
                <span>Tin nổi bật</span>
            </h3>
            <div class="lastest-news">
                <ul>
                    <asp:Repeater ID="rpLastestNews" runat="server">
                        <ItemTemplate>
                            <li>
                                <img alt='<%#Eval("TinTucTitle") %>' src='http://i1056.photobucket.com/albums/t378/hungld/Tintuc/<%#Eval("TinTucImage") %>.jpg' />
                                <a href='/tin-chi-tiet/<%#Eval("TinTucID") %>'><%#Eval("TinTucTitle") %></a>
                                <asp:Label ID="lbNewsID" Visible="false" runat="server" Text='<%#Eval("TinTucID") %>'></asp:Label>
                                <p>
                                    <%#Eval("TinTucQuote") %>
                                </p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

        </div>

    </div>




    <!-- Show product home -->
    
    
    <!-- Máy photocopy cho thuê -->

    <div class="panel panel-primary no-border no-shadow transparent mg-top-10">
		<div class="panel-heading border-bottom no-background font-green no-padding height-38">
            <div class="product-title">Máy photocopy cho thuê</div>
            <div class="more pull-right" style="margin-right:15px">
                <asp:LinkButton ID="linkMore3" runat="server" OnClick="linkMore3_Click">Xem thêm <i class="fa fa-share"></i></asp:LinkButton>
			</div>
		</div>
		<div class="panel-body pad-5 bg-white border-all">
			<div class="row">
                <asp:Repeater ID="rpRentProduct" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-3">
                            
					        <div class="thumbnail tile item offer offer-danger"><!-- -->
                                <%--<div class="shape">
					                <div class="shape-text">
						                Hot								
					                </div>
				                </div>--%>

                                    <div class="caption1">
                                        <h4>Thông tin kĩ thuật</h4>
                                        <ul class="list-option-10">
                                            <asp:Repeater ID="rp1Option10" runat="server">
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
                                        <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                                        <asp:Label ID="lbsp3" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                                    </div>
							        <p class="price-label">
                                        Giá : <%#Eval("Gia") %>
                                        <!--
                                        <%#Eval("DonGia","{0:0,000}").Replace(",",".") %> ₫
                                        -->
							        </p>
                                </div>
					        </div>
				        </div>
                        
                    </ItemTemplate>
                </asp:Repeater>						
			</div>
		</div>
	</div><!-- end -->


    <!-- Máy photocopy Ricoh -->
    <div class="panel panel-primary no-border no-shadow transparent mg-top-10">
		<div class="panel-heading border-bottom no-background font-green no-padding height-38">
            <div class="product-title">Máy photocopy Ricoh</div>
            <div class="more pull-right" style="margin-right:15px">
                <asp:LinkButton ID="linkMore1" runat="server" OnClick="linkMore1_Click">Xem thêm <i class="fa fa-share"></i></asp:LinkButton>
			</div>
		</div>
		<div class="panel-body pad-5 bg-white border-all">
			<div class="row">
                <asp:Repeater ID="RptRicohProduct" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-3">
                            
					        <div class="thumbnail tile item offer offer-danger"><!-- -->
                                <%--<div class="shape">
					                <div class="shape-text">
						                Hot								
					                </div>
				                </div>--%>

                                    <div class="caption1">
                                        <h4>Thông tin kĩ thuật</h4>
                                        <ul class="list-option-10">
                                            <asp:Repeater ID="rp1Option10" runat="server">
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
                                        <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                                        <asp:Label ID="lbsp1" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                                    </div>
							        <p class="price-label">
                                        Giá : <%#Eval("Gia") %>
                                        <!--
                                        <%#Eval("DonGia","{0:0,000}").Replace(",",".") %> ₫
                                        -->
							        </p>
                                </div>
					        </div>
				        </div>
                        
                    </ItemTemplate>
                </asp:Repeater>						
			</div>
		</div>
	</div><!-- end -->
			
    
    <!-- Sản phẩm bán chạy -->
    	
	<div class="panel panel-primary no-border no-shadow transparent">
		<div class="panel-heading border-bottom no-background font-green no-padding height-38">
            <div class="product-title">Sản phẩm bán chạy</div>
            <div class="more pull-right" style="margin-right:15px">
                <asp:LinkButton ID="linkMore2" runat="server">Xem thêm <i class="fa fa-share"></i></asp:LinkButton>
			</div>
        </div>
		<div class="panel-body pad-5 bg-white border-all">
			<div class="row">
				<asp:Repeater ID="RptHotBuyProduct" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-3">
					        <div class="thumbnail tile offer offer-success"><!---->
                                
                                <div class="caption1">
                                    <h4>Thông tin kĩ thuật</h4>
                                    <ul class="list-option-10">
                                        <asp:Repeater ID="rp2Option10" runat="server">
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
                                        <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                                        <asp:Label ID="lbsp2" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                                    </div>
							        <p class="price-label">
                                        Giá : <%#Eval("Gia") %>
                                        <!--<%#Eval("DonGia","{0:0,000}").Replace(",",".") %> ₫-->
							        </p>
                                </div>
					        </div>
				        </div>
                    </ItemTemplate>
                </asp:Repeater>
			</div>
		</div>
	</div><!-- end -->

    <%--<div class="panel panel-primary no-border no-shadow transparent">
		<div class="panel-heading border-bottom no-background font-green no-padding height-38">
            <div class="product-title">Sản phẩm giảm giá</div>
            <div class="more pull-right" style="margin-right:15px">
                <asp:LinkButton ID="linkMore3" runat="server">Xem thêm <i class="fa fa-share"></i></asp:LinkButton>
			</div>
        </div>
		<div class="panel-body pad-5 bg-white border-all">
			<div class="row">
				<asp:Repeater ID="RptSaleProduct" runat="server" OnItemCommand="RptSaleProduct_ItemCommand">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-3">
					        <div class="thumbnail tile">
						        
                                <div class="caption1">
                                    <h4>Thông tin kĩ thuật</h4>
                                    <p>đang cập nhập</p>
                                    <p>
                                        <asp:LinkButton ID="linkimg3" runat="server" CommandName="GetProductDetail" CssClass="linkimg label label-danger" Text="chi tiết"></asp:LinkButton>
						            </p>
                                </div>
                                <img class="img-responsive" src="Images/canon-c2020.jpg" data-src="holder.js/300x300" alt="..." />
                                
                                <div class="caption">
							        <div style="height:30px;">
                                        <h4><asp:LinkButton ID="link3" runat="server" CommandName="GetProductDetail"><%#Eval("TenSanPham") %></asp:LinkButton></h4>
                                        <asp:Label ID="lbsp3" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                                    </div>
							        <div class="middle">
                                        <div class="col1">
                                            <div class="discount-box">
                                                -<%#Eval("GiaGiam")%><span>%</span>
                                            </div>
                                        </div> 
                                        <div class="col2">
                                            <div class="price-box">         
                                                <p class="old-price">
                                                <span class="price" id="old-price-41725-new"><%#Eval("DonGia","{0:0,000}").Replace(",",".") %> ₫</span>
                                                </p>
                                                <p class="special-price">
                                                    <span class="price" id="product-price-41725-new"><%#Eval("DonGiaMoi","{0:0,000}").Replace(",",".") %> ₫
                                                    </span>
                                                </p>
                                            </div> 
                                        </div> 
                                    </div>
                                </div>
					        </div>
				        </div>
                    </ItemTemplate>
                </asp:Repeater>
			</div>
		</div>
	</div>--%><!-- end panel3 -->


    



</asp:Content>
