<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Photocopy.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <script src="Scripts/tooltip.js"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="back-home">
        <asp:LinkButton ID="linkBackHome" OnClick="linkBackHome_Click" runat="server"><img src="Images/back.png" /> Quay lại</asp:LinkButton>
    </div>

    <h3 class="subheader color-red">
		Thông tin sản phẩm
	</h3>
    <hr />
    <div class="edit-product-detail">
        <div class="product-detail-title">
            <div class="title-1 display-inline">
                <p>#</p>
            </div>
            <div class="title-2 display-inline">
                <p>Thông tin</p>
            </div>
        </div>
        <div class="product-detail-info">
            <div class="idsanpham">
                <div class="info-1 display-inline">
                    <p>ID Sản Phẩm</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtSanphamid" Width="20%" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="masanpham">
                <div class="info-1 display-inline">
                    <p>Mã Sản Phẩm</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtMasanpham" Width="20%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="masanxuat">
                <div class="info-1 display-inline">
                    <p>Mã Sản Xuất</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtMasanxuat" Width="20%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="tensanpham">
                <div class="info-1 display-inline">
                    <p>Tên Sản Phẩm</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtTensanpham" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="dongia">
                <div class="info-1 display-inline">
                    <p>Đơn Giá</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtDongia" Width="50%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="giahienthi">
                <div class="info-1 display-inline">
                    <p>Giá Hiển Thị</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtGiahienthi" Width="50%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="soluong">
                <div class="info-1 display-inline">
                    <p>Số Lượng</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtSoluong" Width="20%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="ngaynhaphang">
                <div class="info-1 display-inline">
                    <p>Ngày Nhập Hàng</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtNgaynhaphang" Enabled="false" Width="50%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="loaimay">
                <div class="info-1 display-inline">
                    <p>Loại Máy</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtLoaimay" Width="50%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="hinhanh">
                <div class="info-1 display-inline">
                    <p>Hình Ảnh</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:TextBox ID="txtHinhanh" Width="50%" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="chothue">
                <div class="info-1 display-inline">
                    <p>Cho Thuê</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:CheckBox ID="cbChoThue" runat="server" />
                </div>
            </div>
            <div class="noibat">
                <div class="info-1 display-inline">
                    <p>Nổi Bật</p>
                </div>
                <div class="info-2 display-inline">
                    <asp:CheckBox ID="cbHot" runat="server" />
                </div>
            </div>

        </div>
        <div class="pad-10">
            <asp:Button ID="btnUpdateProduct" OnClick="btnUpdateProduct_Click" CssClass="btn btn-success" runat="server" Text="Update" />
        </div>

    </div>
    <%--<hr />
    <h4 class="subheader">
		Thông tin chức năng
	</h4>
    <div class="edit-product-option">
        <div class="product-option-mainoption">
            <div class="product-option-drop display-inline"> 
                <asp:DropDownList ID="dropMainOption" CssClass="form-control dropoption" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropMainOption_SelectedIndexChanged" data-toggle="tooltip" data-placement="top" title="Main Option"></asp:DropDownList>
            </div>
            <div class="display-inline">
                <button id="btnmenu" type="button" data-toggle="tooltip" data-placement="top" title="..."><img src="Images/chevron-right-32.png" /></button>
            </div>

            <div class="menu" style="display:none">
                <div class="display-inline product-option-imgadd">
                    <asp:Button ID="btnAddMainOption" runat="server" OnClick="btnAddMainOption_Click" CssClass="btn-add btn" data-toggle="tooltip" data-placement="top" title="Add Main Option" />
                </div>
                <div class="display-inline product-option-imgedit">
                    <asp:Button ID="btnEditMainOption" runat="server" Enabled="false" OnClick="btnEditMainOption_Click" CssClass="btn-edit btn" data-toggle="tooltip" data-placement="top" title="Edit Main Option" />
                </div>                
                <div class="display-inline product-option-imgdelete">
                    <asp:Button ID="btnDeleteMainOption" runat="server" Enabled="false" OnClick="btnDeleteMainOption_Click" CssClass="btn-delete btn" data-toggle="tooltip" data-placement="top" title="Delete Main Option" />
                </div>
            </div>
            <div class="confirm display-inline">
                <div class="display-inline m-right" style="border-bottom:1px solid red">
                    <asp:Label ID="lbMessage" Visible="false" runat="server" Text="Bạn có muốn xóa không ?"></asp:Label>
                </div>
                <div class="display-inline">
                    <asp:Button ID="btnOk" runat="server" Visible="false" OnClick="btnOk_Click" CssClass="btn btn-success" Text="Đồng ý"/>
                </div>
                <div class="display-inline">
                    <asp:Button ID="btnCancle2" runat="server" Visible="false" OnClick="btnCancle2_Click" CssClass="btn btn-warning" Text="Không"/>
                </div>
            </div>
            <div class="display-inline m-right">
                <asp:TextBox ID="txtEditMainOption" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtAddMainOption" Visible="false" placeholder="Nhập chức năng chính" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="display-inline">
                <asp:Button ID="btnUpdateMainOption" Visible="false" CssClass="btn btn-success" OnClick="btnUpdateMainOption_Click" runat="server" Text="Update" />
                <asp:Button ID="btnAddMainOptionSuccess" Visible="false" OnClick="btnAddMainOptionSuccess_Click" CssClass="btn btn-success" runat="server" Text="Add" />
                <asp:Button ID="btnCancle1" runat="server" Visible="false" OnClick="btnCancle1_Click" CssClass="btn btn-warning" Text="Cancle" />
            </div>
        </div>

        <div class="product-option-options">
            <asp:Repeater ID="RptOption" runat="server" OnItemCommand="RptOption_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-hover" id="table">
				        <thead>
                            <tr>
                                <th>#</th>
							    <th style="width:35%">Tên Chức Năng</th>
							    <th style="width:45%">Chi Tiết Chức Năng</th>
							    <th class="image-button">Action</th>
						    </tr>
					    </thead>
					    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr>
                            <td><%#Eval("ID") %><asp:Label ID="lbOptionID" runat="server" Visible="false" Text='<%#Eval("OptionID") %>'></asp:Label></td>
                            <td><asp:Label ID="lbOptionName" runat="server" Text='<%#Eval("OptionName") %>' /><asp:TextBox ID="txtOptionNameUpdate" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("OptionName") %>'></asp:TextBox></td>
                            <td><asp:Label ID="lbOptions" runat="server" Text='<%#Eval("OptionDescription") %>' /><asp:TextBox ID="txtOptionUpdate" CssClass="form-control" runat="server" Visible="false" Text='<%#Eval("OptionDescription") %>'></asp:TextBox></td>                                            
                            <td class="image-button">                                 
                                <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Edit option" />
                                <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Visible="false" Text="Update" CommandName="Update" CommandArgument="<%#Container.ItemIndex %>" />
                                <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" CommandName="Delete" CommandArgument="<%#Container.ItemIndex %>" runat="server" data-toggle="tooltip" data-placement="top" title="Delete option" />
                            </td>
                        </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>


            </asp:Repeater>

            <div class="options-add alert alert-info" role="alert">
                <div class="display-inline m-right" style="padding:6px;">
                    <h4 class="display-inline"><span class="label label-warning">Thêm chức năng</span></h4>
                    <button id="btnmenu1" type="button" data-toggle="tooltip"  data-placement="top" class="display-inline" title="..."><img src="Images/chevron-right-32-small.png" /></button>
                </div>
                <div class="menu1" style="display:none">
                    <div class="display-inline m-right">
                        <asp:TextBox ID="txtOptionNameAdd" CssClass="form-control" Enabled="false" placeholder="Tên chức năng" runat="server"></asp:TextBox>
                    </div>
                    <div class="display-inline m-right">
                        <asp:TextBox ID="txtOptionDescriptionAdd" CssClass="form-control" Enabled="false" placeholder="Chi tiết" runat="server"></asp:TextBox>
                    </div>                
                    <div class="display-inline product-option-imgdelete">
                        <asp:Button ID="btnAddOption" runat="server" OnClick="btnAddOption_Click" Enabled="false" CssClass="btn-success btn" Text="Thêm" data-toggle="tooltip" data-placement="top" title="Add Option" />
                    </div>
                </div>
                        
            </div>
        </div>
    </div>--%>

    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var state = true;
            var state1 = true;
            $("#btnmenu").click(function () {
                if (state) {
                    $(".menu").addClass("effect");
                    state = false;
                } else {
                    $(".menu").removeClass("effect");
                    state = true;
                }
            });
            $("#btnmenu1").click(function () {
                if (state) {
                    $(".menu1").addClass("effect");
                    state = false;
                } else {
                    $(".menu1").removeClass("effect");
                    state = true;
                }
            });
        });

    </script>


</asp:Content>
