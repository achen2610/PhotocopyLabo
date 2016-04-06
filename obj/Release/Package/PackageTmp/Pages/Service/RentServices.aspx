<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="RentServices.aspx.cs" Inherits="Photocopy.RentServices" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>NHẤT THIÊN TÂN | DỊCH VỤ CHO THUÊ MÁY PHOTOCOPY</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h3 class="lienhe-h3">DỊCH VỤ CHO THUÊ MÁY PHOTOCOPY
        <div class="fb-share-button" style="float:right" data-href="http://nhatthientan.com/cho-thue-may-photocopy" data-layout="button_count"></div>
    </h3>
    <hr />

    <div class="rent-info">
        <ul>
            <li>Hiện tại, công ty Nhất Thiên Tân chúng tôi có cung cấp dịch vụ cho thuê máy photocopy , với các loại máy photocopy hiện đại của hãng Ricoh, Sharp, Toshiba.</li>
            <li>Chúng tôi đảm bảo dịch vụ được đáp ứng đầy đủ nhu cầu của khách hàng , giá cả phù hợp , máy móc hoạt động tốt qua đó giúp khách hàng có nhiều sự lựa chọn cho việc thuê máy.</li>
            <li>Sự hài lòng của các bạn là niềm vui của chúng tôi. !!!</li>
            <li>Các bạn có thể tham khảo danh sách máy ở phía dưới.</li>
        </ul>
    </div>

    <div class="rent-list">
        <h4 class="rent-list-h4">Danh sách máy cho thuê</h4>
        <div class="row">
            <asp:Repeater ID="RptRentPhotocopy" runat="server">
                <ItemTemplate>
			        <div class="col-lg-3 col-md-6 col-sm-12">
				        <div class="tile thumbnail offer offer-success" runat="server">
                                                
					        <img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' alt="<%#Eval("TenSanPham") %>" />
					        <div class="caption">
							    <div style="height:30px;">
                                    <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                                    <%--<h4><asp:LinkButton ID="link" runat="server" CommandName="GetProductDetail"><%#Eval("TenSanPham") %></asp:LinkButton></h4>--%>
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
