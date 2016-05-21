<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Photocopy.Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Nhất Thiên Tân | Danh sách tin tức</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-lg-12">
            <asp:Repeater ID="rpNewsList" runat="server">
                <ItemTemplate>
                    <div class="tin-tuc-list row">
                        <div class="col-lg-2 col-sm-4">
                            <div class="tintuc-image">
                                <img src='http://i1056.photobucket.com/albums/t378/hungld/Tintuc/<%#Eval("TinTucImage") %>.jpg' class="img-responsive img-thumbnail" />
                            </div>
                        </div>
                        <div class="col-lg-10 col-sm-8">
                            <div class="tintuc-content">
                                <div class="tintuc-content-h3">
                                    <a href='/tin-chi-tiet/<%#Eval("TinTucID") %>' class="tintuc-h3"><%#Eval("TinTucTitle") %></a>
                                    <%--<asp:LinkButton ID="linkTiTile" runat="server" CommandName="ToNewsDetail" CssClass="tintuc-h3"><%#Eval("TinTucTitle") %></asp:LinkButton>--%>
                                    <asp:Label ID="lbNewsID" runat="server" Visible="false" Text='<%#Eval("TinTucID") %>'></asp:Label>
                                </div>
                                <div class="tintuc-content-nd">
                                    <p><%#Eval("TinTucQuote") %></p>
                                </div>
                                <div class="tintuc-content-chitiet">
                                    <a href='/tin-chi-tiet/<%#Eval("TinTucID") %>'>chi tiết</a>
                                    <%--<asp:LinkButton ID="linkChiTiet" runat="server" CommandName="ToNewsDetail">chi tiết</asp:LinkButton>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    
    

</asp:Content>
