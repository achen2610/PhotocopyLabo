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
        <div class="Collage effect-parent">
            <asp:Repeater ID="repeaterProduct" runat="server">
                <ItemTemplate>
                    <div class="Image_Wrapper" data-caption='<%#Eval("TenSanPham") %>'>
					    <a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><img src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' /></a>
				    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
	</div>

</asp:Content>



