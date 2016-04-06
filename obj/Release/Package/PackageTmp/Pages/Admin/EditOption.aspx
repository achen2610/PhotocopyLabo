<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="EditOption.aspx.cs" Inherits="Photocopy.EditOption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="color-red">Sửa Chức Năng Sản Phẩm</h3>
    <hr />

    <div class="editoption">
        <div class="editoption1 row">
            <div class="col-lg-5" style="padding-left:0">
                <asp:DropDownList ID="dropdSanPham" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropdSanPham_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
        <div class="editoption2">
            <div class="row">
                <div class="option-name col-lg-3">
                    <p>Tên chức năng</p>
                </div>
                <div class="option-name-txt col-lg-9">
                    <asp:TextBox ID="txtOptionName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="option-description col-lg-3">
                    <p>Thông tin chức năng</p>
                </div>
                <div class="option-description-txt col-lg-9">
                    <asp:TextBox ID="txtOptionDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="editoption3">
            <div class="row">
                <div class="col-lg-2">
                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Thêm vào" OnClick="btnAdd_Click" />
                </div>
                <div class="col-lg-10">
                    <div class="lbketqua">
                        <b>Kết quả :</b> <asp:Label ID="lbKetQua" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />

    <div class="rpoptions">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rpOptions" runat="server" OnItemCommand="rpOptions_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-hover border-table" id="table">
				            <thead>
                                <tr>
                                    <th style="width:4%;text-align:center">#</th>
                                    <th style="width:15%">Sản Phẩm ID</th>
							        <th style="width:25%">Tên Chức Năng</th>
							        <th style="width:55%">Thông Tin Chức Năng</th>
							        <th class="image-button">Action</th>
						        </tr>
					        </thead>
					        <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                                <tr>
                                    <td style="text-align:center"><asp:Label ID="lbOptionID" runat="server" Text='<%#Eval("OptionID") %>'></asp:Label></td>
                                    <td style="text-align:center"><asp:Label ID="lbSanPhamID" runat="server" Text='<%#Eval("SanPhamID") %>' /><asp:TextBox ID="txtSanPhamID" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:TextBox></td>
                                    <td><asp:Label ID="lbOptionName" runat="server" Text='<%#Eval("OptionName") %>' /><asp:TextBox ID="txtOptionNameUpdate" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("OptionName") %>'></asp:TextBox></td>
                                    <td><asp:Label ID="lbOptionDescription" runat="server" Text='<%#Eval("OptionDescription") %>' /><asp:TextBox ID="txtOptionDescriptionUpdate" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("OptionDescription") %>'></asp:TextBox></td>                                            
                                    <td class="image-button">                                 
                                        <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Edit" />
                                        <asp:ImageButton ID="imgBtnOk" ImageUrl="~/Images/tick.png" Visible="false" CommandName="Ok" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Update" />
                                        <asp:ImageButton ID="imgBtnCancle" ImageUrl="~/Images/error.png" Visible="false" CommandName="Cancle" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Cancle" />
                                        <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" OnClientClick="return confirm('Bạn có muốn xóa?');" CommandName="Delete" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Delete option" />
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

</asp:Content>
