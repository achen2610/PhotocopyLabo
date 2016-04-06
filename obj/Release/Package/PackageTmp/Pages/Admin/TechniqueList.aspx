<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="TechniqueList.aspx.cs" Inherits="Photocopy.TechniqueList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="technique-list">
        <div class="technique-list-h3">
            <h3 class="color-red">
                Danh Sách Kỹ Thuật Hỗ Trợ
            </h3>
        </div>
        <hr />

        <div class="technique-list-content">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="rpTechniqueList" runat="server" OnItemCommand="rpTechniqueList_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-hover border-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tiêu đề</th>
                                        <th class="image-button">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="lbTechniqueID" runat="server" Text='<%#Eval("TechniqueID") %>' /></td>
                                        <td><%#Eval("TechniqueName") %></td>
                                        <td class="image-button">
                                            <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" runat="server" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" />
                                            <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" runat="server" OnClientClick="return confirm('Bạn có muốn xóa?');" CommandName="Delete"  CommandArgument='<%#Eval("TechniqueID") %>' />
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
