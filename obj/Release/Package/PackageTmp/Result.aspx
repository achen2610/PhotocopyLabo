<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Photocopy.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>NHẤT THIÊN TÂN | KẾT QUẢ TÌM KIẾM</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-title">
        <h3><i class="fa fa-search"></i> Kết Quả Tìm Kiếm !!!</h3>
    </div>

    <div class="search-result">
        <asp:Repeater ID="rptSearch" runat="server">
            <ItemTemplate>
                <div class="a-result">
                    <div class="search-img">
                        <img class="img-responsive" src='http://i1056.photobucket.com/albums/t378/hungld/Photocopy/<%#Eval("HinhAnh") %>.jpg' data-src="holder.js/300x300" alt="..." />
                    </div>
                    <div class="search-name">
                        <h4><a href='/chi-tiet-san-pham/<%#Eval("SanPhamID") %>'><%#Eval("TenSanPham") %></a></h4>
                        <asp:Label ID="lbIDSP" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label>
                    </div>
                    <div class="search-price">
                        <p class="price-label">Giá : <%#Eval("Gia") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="lbnotification" runat="server" Text="" Visible="false"></asp:Label>


    </div>



</asp:Content>
