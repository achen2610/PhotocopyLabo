<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Photocopy.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nhất Thiên Tân | Dịch vụ cho thuê máy photocopy , bảo hành sữa chữa và bảo trì máy</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h3 class="lienhe-h3">DỊCH VỤ CHO THUÊ MÁY PHOTOCOPY</h3>
    <div class="fb-share-button" style="float:right" data-href="http://nhatthientan.com/cho-thue-may-photocopy" data-layout="button_count"></div>
    <hr style="border-bottom: 2px solid #b7b7b7;"/>

    <div class="row">
        <div class="col-lg-6">
            <div class="rent-banner">
                <img src="../Images/office.jpg" class="img-responsive" />
            </div>

            <div class="rent-info">
                <ul class="fa-ul">
                    <li><i class="fa-li fa fa-info-circle fa-2x"></i>
                        <div class="media thumbnail-mod-1 media-mod-1">
                            <div class="media-body">
                                <p>Hiện tại, công ty Nhất Thiên Tân chúng tôi có cung cấp dịch vụ cho thuê máy photocopy , với các loại máy photocopy hiện đại của hãng Ricoh, Sharp, Toshiba.</p>
                            </div>
                        </div>
                    </li>
                    <li><i class="fa-li fa fa-users fa-2x"></i>
                        <div class="media thumbnail-mod-1 media-mod-1">
                            <div class="media-body">
                                <p>Chúng tôi đảm bảo dịch vụ được đáp ứng đầy đủ nhu cầu của khách hàng , giá cả phù hợp , máy móc hoạt động tốt qua đó giúp khách hàng có nhiều sự lựa chọn cho việc thuê máy.</p>
                            </div>
                        </div>
                    </li>
                    <li><i class="fa-li fa fa-thumbs-o-up fa-2x"></i>
                        <div class="media thumbnail-mod-1 media-mod-1">
                            <div class="media-body">
                                <p>Sự hài lòng của các bạn là niềm vui của chúng tôi. !!!</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-lg-6">

            <asp:Repeater ID="rptRentPhotocopy" runat="server" OnItemDataBound="rptRentPhotocopy_ItemDataBound">
                <ItemTemplate>
                    <div class="row rent-product" style="padding:5px 0">
                        <div class="col-lg-4">
                            <a href="/chi-tiet-san-pham/<%#Eval("SanPhamID") %>">
					            <img src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' class="img-responsive" alt="" />
				            </a>
                        </div>
                        <div class="col-lg-8">
                            <div class="rent-sp-detail">
							    <h4><%#Eval("TenSanPham") %></h4>
                                <asp:Label ID="idProduct" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                                <div class="info-detail-product" style="font-size:12px !important">
                                    <asp:Repeater ID="RepeaterOption" runat="server">
                                        <ItemTemplate>
                                            <div class="row option-detail">
                                                <div class="col-md-4 option-name">
                                                    <asp:Label ID="OptionName" runat="server" Text='<%#Eval("OptionName") %>'></asp:Label>
                                                </div>
                                                <div class="col-md-8 option-description">
                                                    <asp:Label ID="OptionDescription" runat="server" Text='<%#Eval("OptionDescription") %>'></asp:Label>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
						    </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="container full-service" style="padding:80px 0;">
        <h3 class="lienhe-h3">Các dịch vụ của chúng tôi</h3>
        <hr style="border-bottom: 2px solid #b7b7b7;"/>
        <div class="row" style="padding-top:30px">
            <div class="col-xs-12 col-sm-6 col-lg-4">
                <div class="thumbnail"><img src="../Images/service1.jpg" alt="" />
                    <div class="caption-mod-1">
                        <h4 class="color-blue"> Cho thuê máy photocopy</h4>
                        <p>Công ty chúng tôi có cung cấp dịch vụ cho thuê máy photocopy , với các loại máy photocopy hiện đại của hãng Ricoh, Sharp, Toshiba. Chúng tôi đảm bảo dịch vụ được đáp ứng đầy đủ nhu cầu của khách hàng , giá cả phù hợp , máy móc hoạt động tốt qua đó giúp khách hàng có nhiều sự lựa chọn cho việc thuê máy.</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
                <div class="thumbnail"><img src="../Images/service2.jpg" alt="" />
                    <div class="caption-mod-1">
                        <h4 class="color-blue"> Bảo hành, Sửa chữa</h4>
                        <p>Khi lựa chọn sản phẩm của công ty, chúng tôi sẽ lắp đặt miễn phí cho khách hàng, cung cấp dịch vụ bảo hành, sửa chữa, thay thế miễn phí trong thời gian bảo hành. Chúng tôi đảm bảo cung cấp cho khách hàng những quyền lợi tốt nhất.</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
                <div class="thumbnail"><img src="../Images/service3.jpg" alt="" />
                    <div class="caption-mod-1">
                        <h4 class="color-blue"> Bảo trì định kỳ</h4>
                        <p>Chúng tôi cung cấp dịch vụ bảo trì máy photocopy định kì theo hàng năm. Khi ký hợp đồng khách hàng với thời hạn 12 tháng với 1 khoản tiền cố định, khách hàng không phải quan tâm thiết bị phải sửa chữa bao nhiều lần trong tháng. Với dịch vụ này, khách hàng sẽ hài lòng với máy photocopy luôn được bảo trì tốt nhất.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
