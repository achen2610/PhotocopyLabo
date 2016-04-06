<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="HotProduct.aspx.cs" Inherits="Photocopy.HotProduct" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>NHẤT THIÊN TÂN | SẢN PHẨM ĐANG HOT</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
		<div class="row">
            <div class="col-md-6 col-sm-12">                
                <h3>Sản phẩm đang hot</h3>
            </div>
            
		</div>
        
	</div>

    <div class="productlist row">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="thumbnail tile offer offer-danger">
                    <div class="shape">
					    <div class="shape-text">
						    Hot								
					    </div>
				    </div>
                    <a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' alt="<%#Eval("TenSanPham") %>" style="width:250px;height:220px;"></a>
					<%--<asp:LinkButton ID="LinkImgToDetail" runat="server" CommandName="GetProductDetail">
                        <img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' alt="<%#Eval("TenSanPham") %>" style="width:250px;height:220px;">
                    </asp:LinkButton>--%>
					<div class="footer">
						<div class="tensanpham">
                            <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                            <%--<h4><asp:LinkButton ID="LinkToDetail" runat="server" CommandName="GetProductDetail"><%#Eval("TenSanPham") %></asp:LinkButton></h4>--%>
                            <asp:Label ID="lbSanphamID" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
						</div>
						<span>by <%#Eval("NhaSanXuat") %></span>
						<div class="price-label">Giá : <%#Eval("Gia") %></div>
						<div class="tools">
							<div>
								<span class="rating"><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span></span>
							</div>
                                       
						</div>
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
            BackNextDisplay="Buttons" BackNextButtonStyle="" BackNextStyle="" MaxPages="10" SectionPadding="10">
        </cc1:CollectionPager>
    </div>

</asp:Content>
