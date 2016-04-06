<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Photocopy.Product" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Nhất Thiên Tân - Sản Phẩm</title>

    	    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
		<div class="row">
            <div class="col-md-6 col-sm-12">
                <h3>Danh sách sản phẩm</h3>
            </div>
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
		<div class="projects isotope-wrapper">
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

</asp:Content>



