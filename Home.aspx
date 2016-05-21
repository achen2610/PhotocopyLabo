<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Photocopy.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Nhất Thiên Tân Company" />
    <meta name="author" content="AChen" />

    <title>Nhất Thiên Tân - Chuyên cung cấp cho thuê và sửa chữa máy photocopy</title>

    <!-- Bootstrap Core CSS -->
    <link href="Content/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	
	<!-- Wow Core CSS -->
	<link rel="stylesheet" href="Content/animate.min.css" />
	
    <!-- Custom CSS -->
    <link href="Content/RebuildStyle.css" rel="stylesheet" />
	<link href="Content/transitions.css" rel="stylesheet" type="text/css" media="all" />

    <!-- Custom Fonts -->
    <link href="Content/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href='https://fonts.googleapis.com/css?family=Noto+Sans&subset=latin,vietnamese' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Lobster&subset=latin,vietnamese' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css' />

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				
                <a class="navbar-brand page-scroll" href="#page-top">Nhất Thiên Tân</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Dịch Vụ</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#product">Sản Phẩm</a>
                    </li>
					<li>
                        <a class="page-scroll" href="#news">Tin Tức</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">Về Chúng Tôi</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#clients">Đối Tác</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Liên Hệ</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
         <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in wow fadeInLeft">Chuyên cung cấp - cho thuê - sửa chữa máy photocopy</div>
                <div class="intro-heading wow fadeInLeft" data-wow-delay="0.5s">Ricoh - Toshiba - Canon - Sharp</div>
                <div class="intro-lead-in wow fadeInLeft" data-wow-delay="0.7s">Hotline: 0905 173 617 - 0911 411 479</div>
                <a href="#services" class="page-scroll btn btn-xl wow fadeInLeftBig" data-wow-delay="0.8s">Tìm hiểu thêm</a>
            </div>
        </div> 
		
    </header>
	

    <!-- Services Section -->
    <section id="services">
        <div class="container padding-section">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Dịch Vụ</h2>
                    <h3 class="section-subheading text-muted">Công ty chúng tôi cung cấp các dịch vụ cho thuê, bảo hành, bảo trì, bảo dưỡng và các dịch vụ khác theo yêu cầu của khách hàng</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4 circle-hover wow fadeInLeft">
                    <span class="fa-stack fa-4x">
                        <i class="bg fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-truck fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Cho Thuê Máy</h4>
                    <p class="text-muted">Công ty chúng tôi có cung cấp dịch vụ cho thuê máy photocopy , với các loại máy photocopy hiện đại của hãng Ricoh, Sharp, Toshiba. Chúng tôi đảm bảo dịch vụ được đáp ứng đầy đủ nhu cầu của khách hàng , giá cả phù hợp , máy móc hoạt động tốt qua đó giúp khách hàng có nhiều sự lựa chọn cho việc thuê máy.</p>
                </div>
                <div class="col-md-4 circle-hover wow fadeInDown">
                    <span class="fa-stack fa-4x">
                        <i class="bg fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-wrench fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Bảo Hành, Sửa Chữa</h4>
                    <p class="text-muted">Khi lựa chọn sản phẩm của công ty, chúng tôi sẽ lắp đặt miễn phí cho khách hàng, cung cấp dịch vụ bảo hành, sửa chữa, thay thế miễn phí trong thời gian bảo hành. Chúng tôi đảm bảo cung cấp cho khách hàng những quyền lợi tốt nhất.</p>
                </div>
                <div class="col-md-4 circle-hover wow fadeInRight">
                    <span class="fa-stack fa-4x">
                        <i class="bg fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-refresh fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Bảo Trì Định Kì</h4>
                    <p class="text-muted">Chúng tôi cung cấp dịch vụ bảo trì máy photocopy định kì theo hàng năm. Khi ký hợp đồng khách hàng với thời hạn 12 tháng với 1 khoản tiền cố định, khách hàng không phải quan tâm thiết bị phải sửa chữa bao nhiều lần trong tháng. Với dịch vụ này, khách hàng sẽ hài lòng với máy photocopy luôn được bảo trì tốt nhất.</p>
                </div>
            </div>
			<div class="row">
				<div class="col-lg-2 col-lg-offset-10 more-link wow fadeIn" data-wow-delay="0.5s">
					<a href="/dich-vu">Tìm hiểu thêm</a>
				</div>
			</div>
        </div>
    </section>

    <!-- advertisement -->
	<div class="parallax-window" data-parallax="scroll" data-image-src="../Images/background.jpg">
		<div class="container clearfix banner">
			<div class="row">
				<div class="col-lg-9">
					<div class="banner-des">
						<h3>Bạn đang có nhu cầu về mua hay thuê máy photocopy !</h3>
						<span>Hãy liên hệ với chúng tôi để nhận được những thông tin chi tiết về sản phẩm và dịch vụ tốt nhất.</span>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="banner-link">
						<!-- <a href="#contact" class="button button-xlarge button-rounded page-scroll">Liên Hệ</a> -->
						<p><span class="qs"><img src="Images/icon/phone.png" width="48" height="48" /><span class="popover popover1 above">0911 411 479</span></span></p>
						<p><span class="qs"><a href="#contact" class="page-scroll"><img src="Images/icon/mail.png" width="48" height="48" /></a><span class="popover above">info@nhatthientan.com</span></span></p>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- Product Grid Section -->
    <section id="product" class="bg-light-gray">
        <div class="container padding-section">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Sản Phẩm</h2>
                    <h3 class="section-subheading text-muted">Với sản phẩm đa dạng, chất lượng tốt nhất của các hãng Ricoh, Sharp, Toshiba mà công ty chúng tôi cung cấp, khách hàng có thể thoải mái lựa chọn.</h3>
                </div>
            </div>
			
            <div class="row">
			    <div class="col-md-12">

				    <!-- Filters -->
				    <div id="filters">
					    <ul class="option-set margin-bottom-40">
						    <li><a href="#filter" class="selected" data-filter="*">All</a></li>
						    <li><a href="#filter" data-filter=".photocopy">Máy Photocopy</a></li>
						    <li><a href="#filter" data-filter=".print">Máy In</a></li>
						    <li><a href="#filter" data-filter=".component">Linh Kiện</a></li>
					    </ul>
					    <div class="clearfix"></div>
				    </div>

			    </div>
		    </div>

	        <div class="row">

		        <!-- Projects -->
		        <div class="product isotope-wrapper">
			        <asp:Repeater ID="repeaterProduct" runat="server">
                        <ItemTemplate>
			                <!-- Item -->
			                <div class="isotope-item col-md-3 col-sm-4 <%#Eval("LoaiMay") %>">
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

			<div class="row">
				<div class="col-lg-2 col-lg-offset-10 more-link wow fadeIn" data-wow-delay="0.5s">
					<a href="/san-pham">Tìm hiểu thêm</a>
				</div>
			</div>
        </div>
    </section>
	
	<!-- News Section -->
	<section id="news">
		<div class="container padding-section">
		
			<div class="row">
				<div class="col-lg-12 text-center">
                    <h2 class="section-heading">TIN TỨC</h2>
                </div>
			</div>
			
			<div class="row">

                <!-- News row 1 -->
                 <asp:Repeater ID="repeaterNews1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6" style="margin-bottom:20px;">
					        <div class="news-date wow <%# GetItemClass(Container.ItemIndex) %>">
						        <div class="news-date-content">
							        <p class="news-date-content-text">
								        <span class=""><strong><%#Eval("TinTucPostDate") %> <br/></strong></span>
							        </p>
						        </div>
					        </div>
					        <div class="row">
						        <div class="news-cell col-lg-6">
							        <div class="news-image wow <%# GetItemClass(Container.ItemIndex) %>">
								        <div class="news-image-link">
                                            <img src='http://i1056.photobucket.com/albums/t378/hungld/Tintuc/<%#Eval("TinTucImage") %>.jpg' class="news-image-picture" title="" alt="" draggable="false" />
								        </div>
							        </div>
						        </div>
						
						        <div class="news-cell col-lg-6">
							        <div class="news-title wow <%# GetItemClass(Container.ItemIndex) %>">
								        <div class="news-title-content">
									        <p class="news-title-content-text"><%#Eval("TinTucTitle") %><br></p>
                                            <asp:Label ID="lbNewsID" Visible="false" runat="server" Text='<%#Eval("TinTucID") %>'></asp:Label>
								        </div>
							        </div>
							        <div class="news-content wow <%# GetItemClass(Container.ItemIndex) %>">
								        <div class="news-content-content">
									        <p class="news-content-content-text">
										        <span class=""><%#Eval("TinTucQuote") %></span>
									        </p>
								        </div>
							        </div>
							        <div class="news-more wow <%# GetItemClass(Container.ItemIndex) %>">
								        <a href='/tin-chi-tiet/<%#Eval("TinTucID") %>' class="news-more-link">
									        <span class="news-more-link-text">Xem chi tiết</span>
								        </a>
							        </div>
						        </div>
					        </div>
				        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <!-- News row 2 -->
                <asp:Repeater ID="repeaterNews2" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6" style="margin-bottom:20px;">
					        <div class="news-date wow <%# GetItemClass(Container.ItemIndex) %>">
						        <div class="news-date-content">
							        <p class="news-date-content-text">
								        <span class=""><strong><%#Eval("TinTucPostDate") %> <br/></strong></span>
							        </p>
						        </div>
					        </div>
					        <div class="row">
						        <div class="news-cell col-lg-6">
							        <div class="news-image wow <%# GetItemClass(Container.ItemIndex) %>">
								        <div class="news-image-link">
                                            <img src='http://i1056.photobucket.com/albums/t378/hungld/Tintuc/<%#Eval("TinTucImage") %>.jpg' class="news-image-picture" title="" alt="" draggable="false" />
								        </div>
							        </div>
						        </div>
						
						        <div class="news-cell col-lg-6">
							        <div class="news-title wow <%# GetItemClass(Container.ItemIndex) %>">
								        <div class="news-title-content">
									        <p class="news-title-content-text"><%#Eval("TinTucTitle") %><br></p>
                                            <asp:Label ID="lbNewsID" Visible="false" runat="server" Text='<%#Eval("TinTucID") %>'></asp:Label>
								        </div>
							        </div>
							        <div class="news-content wow <%# GetItemClass(Container.ItemIndex) %>">
								        <div class="news-content-content">
									        <p class="news-content-content-text">
										        <span class=""><%#Eval("TinTucQuote") %></span>
									        </p>
								        </div>
							        </div>
							        <div class="news-more wow <%# GetItemClass(Container.ItemIndex) %>">
								        <a href='/tin-chi-tiet/<%#Eval("TinTucID") %>' class="news-more-link">
									        <span class="news-more-link-text">Xem chi tiết</span>
								        </a>
							        </div>
						        </div>
					        </div>
				        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
			
			<div class="row">
				<div class="col-lg-2 col-lg-offset-10 more-link wow fadeIn" data-wow-delay="0.5s">
					<a href="/tin-tuc">Tìm hiểu thêm</a>
				</div>
			</div>
		
		</div>
	</section>

    <!-- About Section -->
    <section id="about">
        <div class="container padding-section">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">NHẤT THIÊN TÂN</h2>
                    <h3 class="section-subheading text-muted">Chuyên cung cấp và cho thuê máy photocopy</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li class="wow fadeInLeft">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="Images/about/company.jpg" alt="" />
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2014-Hiện nay</h4>
                                    <h4 class="subheading">Thành Lập Công Ty</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Công ty được thành lập với mục tiêu khách hàng là thượng đế. Chúng tôi nỗ lực để trở thành một trong những Công ty cung cấp dịch vụ cho thuê máy photocopy hàng đầu mang đến cho khách hàng những điều tốt nhất.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted wow fadeInRight">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="Images/about/staff.jpg" alt="" />
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>Nhân Viên</h4>
                                    <h4 class="subheading">Nhiệt Huyết, Tận Tình, Chu Đáo</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Chúng tôi xây dựng một đội ngũ nhân viên chuyên nghiệp với tinh thần đồng đội cao, hòa đồng, thân thiện, cởi mở và phấn đấu vì mục tiêu phát triển chung của Công ty. Cam kết của chúng tôi là tiếp tục cung cấp chất lượng cao nhất cho khách hàng của chúng tôi.</p>
                                </div>
                            </div>
                        </li>
                        <li class="wow fadeInLeft">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="Images/about/services.jpg" alt="" />
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>Dịch Vụ</h4>
                                    <h4 class="subheading">Cho Thuê, Bảo Hành, Bảo Trì</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Với các máy photocopy của các hãng nổi tiếng Ricoh, Toshiba, Sharp mà chúng tôi cho thuê, khách hàng có thể hài lòng về chất lượng của sản phẩm. Ngoài ra chúng tôi luôn đảm bảo cho khách hàng dịch vụ bảo hành, bảo dưỡng định kì hàng tháng, đảm bảo sản phẩm tốt nhất.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted wow fadeInRight">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="Images/about/product.jpg" alt="" />
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>Sản Phẩm</h4>
                                    <h4 class="subheading">Máy Photocopy, Máy In, Linh Kiện, Vật Tư</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Các sản phẩm của chúng tôi luôn là hàng chất lượng tốt nhất của các hãng nổi tiếng. Ngoài ra chúng tôi cũng cung cấp linh kiện , vật tư thay thế cho các sản phẩm máy photocopy phục vụ cho nhu cầu thay thế, sửa chữa của khách hàng được tốt nhất.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted wow bounceIn" data-wow-delay="1s">
                            <div class="timeline-image">
                                <h4>Be Part
                                    <br/>Of Our
                                    <br/>Story!</h4>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Clients Section -->
    <section id="clients" class="bg-light-gray">
        <div class="container padding-section wow fadeIn">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">ĐỐI TÁC</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>
	
			<div class="row">
				<div class="col-lg-6">
					<p><b class="color-blue">NHẤT THIÊN TÂN</b> xây dựng quan hệ đối tác chiến lược với các nhà phân phối máy photocopy và dịch vụ hàng đầu trên toàn thế giới, để trở thành doanh nghiệp tốt nhất có thể. Chúng tôi phải đảm bảo rằng chúng tôi luôn được trang bị đầy đủ và cập nhật liên tục về công nghệ và nguồn nhân lực. Chúng tôi hỗ trợ và nhận được sự hỗ trợ từ các đối tác của mình và không ngừng phát triển vì sự hài lòng của khách hàng.</p>
					<p>Chúng tôi liên tục xem xét và hợp tác với các đối tác khác. Nếu bạn quan tâm đến việc trở thành đối tác với chúng tôi,vui lòng liên hệ với chúng tôi để chúng ta có thể trở thành đối tác của nhau.</p>
				</div>
				<div class="col-lg-6">
					<p><b class="color-blue">Một vài đối tác của chúng tôi</b></p>
					<ul>
						<li><img src="Images/logo/Logo-Ricoh.png" class="img-responsive" alt="" /></li>
						<li><img src="Images/logo/Logo-Toshiba.png" class="img-responsive" alt="" /></li>
						<li><img src="Images/logo/Logo-Canon.png" class="img-responsive" alt="" /></li>
						<li><img src="Images/logo/Logo-Gestetner.png" class="img-responsive" alt="" /></li>
						<li><img src="Images/logo/Logo-Sharp.png" class="img-responsive" alt="" /></li>
						<li><img src="Images/logo/Logo-Kyocera.png" class="img-responsive" alt="" /></li>
					</ul>
				</div>
			</div>
        </div>
    </section>
    
    <!-- Contact Section -->
    <section id="contact">
        <div class="container padding-section">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Liên Hệ</h2>
                    <h3 class="section-subheading text-muted">Mọi thắc mắc vui lòng liên hệ chúng tôi. Chúng tôi sẽ cung cấp mọi thông tin bạn cần.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name." />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address." />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-xl">Gửi</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	
	<div id="header-footer">
		<div class="container">
            <div class="row">
                
			    <div class="col-lg-6 f_cols">
					<h4>Liên Hệ</h4>
					<p><span>99 Bà Huyện Thanh Quan, P.Mỹ An, Q.Ngũ Hành Sơn, TP.Đà Nẵng</span></p>
				    <p>Điện thoại : <span class="phone">0511 3829 979 - 0911 411 479</span></p>
					<p>Email: <span>info@nhatthientan.com</span></p>
			    </div>
				
				<div class="col-lg-3 f_cols">
					<h4>Nhất Thiên Tân</h4>
				    <ul>
					    <li><a href="/gioi-thieu">Giới Thiệu Công Ty</a></li>
					    <li><a>Tuyển Dụng</a></li>
					    <li><a>Hỗ Trợ Khách Hàng</a></li>
				    </ul>	
			    </div>
				
				<div class="col-lg-3 f_cols">
					<h4>Bản Đồ</h4>
					<a href="#mapModal" class="map-link" data-toggle="modal">
                        <div class="map-hover">
                            <div class="map-hover-content">
                                <i class="fa fa-search"></i>
                            </div>
                        </div>
                        <img src="../Images/map-mini.png" class="img-responsive" alt="" />
                    </a>
			    </div>

            </div>
        </div>
	</div>
	
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Nhất Thiên Tân 2016</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li>
                            <a><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a target="_blank" href="https://www.facebook.com/nhatthientan.corp?fref=ts"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <%--<li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->
	
	<div class="portfolio-modal modal fade" id="mapModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Bản Đồ</h2>
                            <div class="google-maps">
								<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.7428320821114!2d108.2486021!3d16.026897299999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142175011a2eddd%3A0xeb5baec7084f42ba!2zMzI4IEzDqiBWxINuIEhp4bq_biwgS2h1w6ogTeG7uSwgTmfFqSBIw6BuaCBTxqFuLCDEkMOgIE7hurVuZywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1429778329893" width="100%" height="100%" frameborder="0" style="border:2px solid #777"></iframe>
							</div>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<script type="text/javascript" src="Scripts/js/jquery-1.10.2.min.js"></script>
	
    <!-- jQuery -->
    <script src="Scripts/js/jquery.js"></script>
	<script src="Scripts/js/parallax/parallax.js"></script>
	<script src="Scripts/js/wow.min.js"></script>
	<script src="Scripts/js/jquery.collagePlus.js"></script>
    <script src="Scripts/js/jquery.removeWhitespace.js"></script>
    <script src="Scripts/js/jquery.collageCaption.js"></script>
	
	
	<script>
	    new WOW().init();
    </script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.isotope/2.2.2/isotope.pkgd.min.js"></script>
    <script src="Scripts/js/filter.js"></script>
    <script src="Scripts/js/classie.js"></script>
    <script src="Scripts/js/cbpAnimatedHeader.js"></script>
    <script src="Content/bootstrap/js/bootstrap.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="Scripts/js/jqBootstrapValidation.js"></script>
    <script src="Scripts/js/contact_me.js"></script>
	
    <!-- Custom Theme JavaScript -->
    <script src="Scripts/js/agency.js"></script>

</body>


</html>
