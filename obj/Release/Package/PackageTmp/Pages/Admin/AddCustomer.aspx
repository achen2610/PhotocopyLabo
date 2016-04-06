<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="Photocopy.AddCustomer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="add-customer">
        <div class="add-customer-h3">
            <h3 class="color-red">
                Thêm đối tác & khách hàng
            </h3>
            <hr />
        </div>
        <div class="add-customer-content">
            <div class="content-title row">
                <div class="content-title-lb col-lg-3">
                    <asp:Label ID="lbCustomerName" runat="server" Text="Tiêu Đề"></asp:Label>
                </div>
                <div class="content-title-input col-lg-9">
                    <asp:TextBox ID="txCustomerName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="content-image row">
                <div class="content-image-lb col-lg-3">
                    <asp:Label ID="lbCustomerImage" runat="server" Text="Hình Ảnh"></asp:Label>
                </div>
                <div class="content-image-input col-lg-9">
                    <asp:TextBox ID="txCustomerImage" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-1">
                    <div class="add-customer-button">
                        <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="lbketqua">
                        <b>Kết quả :</b> <asp:Label ID="lbKetQua" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>          
        </div>
        
        <div class="list-customer">
            <h4>Danh sách</h4>
            <div class="list-customer-content">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="rpCustomerList" runat="server" OnItemCommand="rpCustomerList_ItemCommand">
                            <HeaderTemplate>
                                <table class="table table-hover border-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Tên khách hàng</th>
                                            <th>Hình ảnh</th>
                                            <th class="image-button">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                        <tr>
                                            <td><asp:Label ID="lbCustomerID" runat="server" Text='<%#Eval("customerID") %>' /></td>
                                            <td><asp:Label ID="lbCustomerName" runat="server" Text='<%#Eval("customerName") %>' /><asp:TextBox ID="txCustomerName" CssClass="form-control" Text='<%#Eval("customerName") %>' Visible="false" runat="server" /></td>
                                            <td><asp:Label ID="lbCustomerImage" runat="server" Text='<%#Eval("customerImage") %>' /><asp:TextBox ID="txCustomerImage" CssClass="form-control" Text='<%#Eval("customerImage") %>' Visible="false" runat="server" /></td>
                                            <td class="image-button">
                                                <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Edit" />
                                                <asp:ImageButton ID="imgBtnOk" ImageUrl="~/Images/tick.png" Visible="false" CommandName="Ok" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Update" />
                                                <asp:ImageButton ID="imgBtnCancle" ImageUrl="~/Images/error.png" Visible="false" CommandName="Cancle" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Cancle" />
                                                <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" runat="server" OnClientClick="return confirm('Bạn có muốn xóa?');" CommandName="Delete"  CommandArgument="<%#Container.ItemIndex %>"  data-toggle="tooltip" data-placement="top" title="Delete" />
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


    </div>


</asp:Content>
