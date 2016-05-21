<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="Photocopy.NewsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Nhất Thiên Tân | Tin tức chi tiết</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="tinchitiet">
            <div class="tinchitiet-h3">
                <h3><asp:Label ID="lbTinTucH3" runat="server" Text=""></asp:Label></h3>
                <p><asp:Label ID="lbTinTucPostDate" runat="server" Text=""></asp:Label></p>
                <asp:Repeater ID="rptFacebook" runat="server">
                    <ItemTemplate>
                        <div class="row">
                            <div class="fb-like" data-href='http://nhatthientan.com/tin-chi-tiet/<%#Eval("TinTucID") %>' data-width="1150" data-layout="standard" data-action="like" data-share="true"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <hr />
            </div>
            <div class="tinchitiet-content">
                <asp:Label ID="lbTinTucContent" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>

    <div id="fb-root"></div>
    <script>
        (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>


</asp:Content>
