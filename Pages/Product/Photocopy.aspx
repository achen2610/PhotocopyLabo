<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Photocopy.aspx.cs" Inherits="Photocopy.Photocopy" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>NHẤT THIÊN TÂN | SẢN PHẨM MÁY PHOTOCOPY</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
		<div class="row">
            <div class="col-md-6 col-sm-12">
                <h3>Máy Photocopy</h3>
            </div>

            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
            
		</div>
        
	</div>
	
    <div class="row">
    <asp:Repeater ID="RptPhotocopy" runat="server">
        <ItemTemplate>
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="tile" id="thumbnail" runat="server">
                    <a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' alt="<%#Eval("TenSanPham") %>"></a>
					<%--<asp:LinkButton ID="LinkImgToDetail1" runat="server" CommandName="GetProductDetail1"><img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' alt="<%#Eval("TenSanPham") %>"></asp:LinkButton>--%>
					<div class="footer">
						<div class="tensanpham">
                            <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                            <%--<h4><asp:LinkButton ID="LinkToDetail1" runat="server" CommandName="GetProductDetail1"><%#Eval("TenSanPham") %></asp:LinkButton></h4>--%>
                            <asp:Label ID="lbSanphamID1" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
						</div>
						<%--<span>by <%#Eval("NhaSanXuat") %></span>--%>
						<div class="price-label">Giá : <%#Eval("Gia") %></div>
						<%--<div class="tools">
							<div>
								<span class="rating"><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span></span>
							</div>
                                     
						</div>--%>
					</div>
				</div>
			</div>
		</ItemTemplate>
	</asp:Repeater>
	</div>

    
    <div class="page">
        <cc1:CollectionPager ID="CollectionPager1"
            FirstText="Đầu"
            BackText="« Trước &amp;nbsp;"
            LabelText=""
            LastText="Cuối"
            NextText="&amp;nbsp; Sau  »"
            ShowFirstLast="False"
            SliderSize="5" 
            runat="server" BackNextLinkSeparator="" BackNextLocation="Split"
            PageNumbersDisplay="Numbers" ResultsLocation="None"
            BackNextDisplay="Buttons" BackNextButtonStyle="" BackNextStyle="" MaxPages="12" SectionPadding="10">
        </cc1:CollectionPager>
    </div>



</asp:Content>
