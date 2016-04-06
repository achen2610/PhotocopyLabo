<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="Photocopy.NewsList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="news-list">
        <div class="news-list-h3">
            <h3 class="color-red">
                Danh Sách Tin Tức
            </h3>
        </div>
        <hr />

        <div class="news-list-content">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="rpNewsList" runat="server" OnItemCommand="rpNewsList_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-hover border-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tựa đề tin</th>
                                        <th class="image-button">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="lbTinTucID" runat="server" Text='<%#Eval("TinTucID") %>' /></td>
                                        <td><%#Eval("TinTucTitle") %></td>
                                        <td class="image-button">
                                            <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" runat="server" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" />
                                            <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" runat="server" OnClientClick="return confirm('Bạn có muốn xóa tin tức này ?');" CommandName="Delete"  CommandArgument="<%#Container.ItemIndex %>" />
                                         </td>
                                    </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>

</asp:Content>
