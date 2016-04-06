<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Photocopy.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Scripts/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert/sweet-alert.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="panel panel-primary table-product">
		<div class="panel-heading">
			<h3 class="panel-title">Danh sách sản phẩm</h3>
		</div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">			
            <ContentTemplate>
            <asp:Repeater ID="RptProduct" runat="server" OnItemCommand="RptProduct_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-hover" id="table">
				        <thead>
                            <tr>
                                <th>#</th>
							    <th>Mã SP</th>
							    <th>Mã SX</th>
							    <th>Tên Sản Phẩm</th>
                                <th class="align-right">Đơn giá</th>
                                <th class="align-right">Số lượng</th>
                                <th class="image-button">Action</th>
						    </tr>
					    </thead>
					    <tbody>
                 </HeaderTemplate>
                 <ItemTemplate>
                            <tr>
                                 <td><%#Eval("SanPhamID") %></td>
                                 <td><%#Eval("MaSanPham") %><asp:Label ID="lbSanphamID" runat="server" Visible="false" Text='<%#Eval("SanPhamID") %>'></asp:Label></td>
                                 <td><%#Eval("MaSanXuat") %></td>
                                 <td><%#Eval("TenSanPham") %></td>
                                 <td class="align-right"><%#Eval("DonGia","{0:0,000}").Replace(",",".") %></td>
                                 <td class="align-right"><%#Eval("SoLuong") %></td>
                                 <td class="image-button">
                                    <asp:ImageButton ID="imgBtnEdit" ImageUrl="~/Images/Edit.png" runat="server" CommandName="Edit" CommandArgument="<%#Container.ItemIndex %>" />
                                    <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Images/Delete.png" runat="server" OnClientClick="return confirm('Bạn có muốn xóa sản phẩm này?');" CommandName="Delete"  CommandArgument="<%#Container.ItemIndex %>" />
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



    <%--
    <script>
        var _confirm = false;

        function confirmCheckIn(button) {
            if (_confirm == false) {
                jQuery('<div>')
                    .html("<p>Do you want to check in?</p>")
                    .dialog({
                        autoOpen: true,
                        modal: true,
                        title: "Check in?",
                        buttons: {
                            "No": function () {
                                jQuery(this).dialog("close");
                            },
                            "Yes": function () {
                                jQuery(this).dialog("close");
                                _confirm = true;
                                button.click();
                            }
                        },
                        close: function () {
                            jQuery(this).remove();
                        }
                    });
            }

            return _confirm;
        }
        document.getElementById("<%= imgBtnDelete.ClientID %>")
        <%--var s = 'imgBtnDelete';
        var v = document.getElementById(s);
        document.getElementById('<%=imgBtnDelete.ClientID%>').onclick = function () {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes, delete it!',
                closeOnConfirm: false,
                //closeOnCancel: false
            },
            function () {
                swal("Deleted!", "Your imaginary file has been deleted!", "success");
            });
        };
    </script>--%>

</asp:Content>
