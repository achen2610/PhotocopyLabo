<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="AddRelatedNews.aspx.cs" Inherits="Photocopy.AddRelatedNews" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="color-red">Thêm tin tức liên quan cho sản phẩm</h3>
    <hr />

    <div class="addrelatednews">
        <div class="relatednews1 row">
            <div class="col-lg-5">
                <asp:DropDownList ID="dropdSanPham" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropdSanPham_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
        <div class="relatednews2">
            <div class="row">
                <div class="relatednews-name col-lg-2">
                    <p>Tên tin liên quan</p>
                </div>
                <div class="relatednews-name-txt col-lg-6">
                    <asp:TextBox ID="txRelatedNewsName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="relatednews-link col-lg-2">
                    <p>Đường link tin</p>
                </div>
                <div class="relatednews-link-txt col-lg-6">
                    <asp:TextBox ID="txtRelatedNewsLink" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="relatednews3">
            <div class="row">
                <div class="relatednews-direct col-lg-2">
                    <p>Chọn tin</p>
                </div>
                <div class="relatednews-direct-drop col-lg-6">
                    <asp:DropDownList ID="dropNews" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropNews_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="relatednews-tintucid-1 col-lg-2">
                    <p>Tin Tức ID</p>
                </div>
                <div class="relatednews-tintucid-2 col-lg-2">
                    <asp:Label ID="lbTinTucID" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="relatednews4">
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

    <div class="rprelatednews">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rpRelatedNews" runat="server" OnItemCommand="rpRelatedNews_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-hover border-table" id="table">
				            <thead>
                                <tr>
                                    <th style="width:4%;text-align:center">#</th>
                                    <th style="width:13%">Sản Phẩm ID</th>
							        <th style="width:35%">Tên Tin Liên Quan</th>
							        <th style="width:30%">Đường Dẫn Tin</th>
                                    <th>Tin Tức ID</th>
							        <th class="image-button">Action</th>
						        </tr>
					        </thead>
					        <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                                <tr>
                                    <td><asp:Label ID="lbRelatedNewsID" runat="server" Text='<%#Eval("relatedNewsID") %>' /></td>
                                    <td><asp:Label ID="lbSanphamID" runat="server" Text='<%#Eval("sanPhamID") %>' /><asp:TextBox ID="txtSanPhamID" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("sanPhamID") %>' /></td>
                                    <td><asp:Label ID="lbRelatedNewsName" runat="server" Text='<%#Eval("relatedNewsName") %>' /><asp:TextBox ID="txtRelatedNewsNameUpdate" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("relatedNewsName") %>' /></td>
                                    <td><asp:Label ID="lbRelatedNewsLink" runat="server" Text='<%#Eval("relatedNewsLink") %>' /><asp:TextBox ID="txtRelatedNewsLinkUpdate" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("relatedNewsLink") %>' /></td>                                            
                                    <td style="text-align:center"><asp:Label ID="lbTinTucID" runat="server" Text='<%#Eval("TinTucID") %>' /><asp:TextBox ID="txtTinTucID" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("TinTucID") %>' /></td>
                                    <td class="image-button">                                 
                                        <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Edit" />
                                        <asp:ImageButton ID="imgBtnOk" ImageUrl="~/Images/tick.png" Visible="false" CommandName="Ok" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Update" />
                                        <asp:ImageButton ID="imgBtnCancle" ImageUrl="~/Images/error.png" Visible="false" CommandName="Cancle" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Cancle" />
                                        <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" CommandName="Delete" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Delete option" />
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
