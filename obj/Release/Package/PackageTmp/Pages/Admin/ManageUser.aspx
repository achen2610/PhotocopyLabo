<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="Photocopy.Page.Admin.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        //var $j = jQuery.noConflict();
        $(document).ready(function () {
            $("#<%=txtUserRegister.ClientID %>").blur(function () {
                if ($("#<%=txtUserRegister.ClientID %>").val() == "") {
                    $("#message1").css("display","block");
                    $("#lbMessageUserRegister").css({
                        "color": "red",
                        "font-weight": "bold",
                        "font-size": "small",
                        "padding-left": "5px"
                    });
                    $("#lbMessageUserRegister").text("Chưa nhập Username");
                    $("#imgUserRegisterStatus").attr({
                        "src": "Images/error.png",
                        "width": "16"
                    });
                    $("#imgUserRegisterStatus").show();
                    // Ẩn Nút Submit nếu UserName không hợp lệ
                    //$("#ContentPlaceHolder1_btnRegister").hide();
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "/CheckRegister.asmx/CheckUserIsValid",
                        data: "{'username':'" + $("#<%=txtUserRegister.ClientID %>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            if (message.d == false) {
                                $("#message1").css("display", "block");
                                $("#lbMessageUserRegister").css({
                                    "color": "red",
                                    "font-weight": "bold",
                                    "font-size": "small",
                                    "padding-left": "5px"
                                });
                                $("#lbMessageUserRegister").text("Username này đã tồn tại");
                                $("#imgUserRegisterStatus").attr({
                                    "src": "Images/error.png",
                                    "width": "16"
                                });
                                $("#imgUserRegisterStatus").show();
                                // Ẩn Nút Submit nếu UserName không hợp lệ
                                //$("#ContentPlaceHolder1_btnRegister").hide();
                            }
                            else {
                                $("#message1").css("display", "block");
                                $("#lbMessageUserRegister").css({
                                    "color": "green",
                                    "font-weight": "bold",
                                    "font-size": "small",
                                    "padding-left": "5px"
                                });
                                $("#imgUserRegisterStatus").attr({
                                    "src": "Images/tick.png",
                                    "width": "16"
                                });
                                //$("#imgErrorRegister").hide();
                                //$("#ContentPlaceHolder1_btnRegister").show();
                                $("#lbMessageUserRegister").text("UserName này chưa có. Bạn có thể sử dụng")
                            }
                        },
                        error: function (errormessage) {
                            //Hiển thị lỗi nếu xảy ra
                            $("#message1").css("display", "block");
                            $("#imgUserRegisterStatus").show();
                            $("#lbMessageUserRegister").text(errormessage.responseText);
                        }
                    });
                };
            });
            $("#<%=txtEmailRegister.ClientID %>").blur(function () {
                if ($("#<%=txtEmailRegister.ClientID %>").val() == "") {
                    $("#message2").css("display", "block");
                    $("#lbMessageEmailRegister").css({
                        "color": "red",
                        "font-weight": "bold",
                        "font-size": "small",
                        "padding-left": "5px"
                    });
                    $("#lbMessageEmailRegister").text("Chưa nhập Email");
                    $("#imgEmailRegisterStatus").attr({
                        "src": "Images/error.png",
                        "width": "16"
                    });
                    $("#imgEmailRegisterStatus").show();
                    //$("#ContentPlaceHolder1_btnRegister").hide();
                    // Ẩn Nút Submit nếu UserName không hợp lệ
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "CheckRegister.asmx/CheckEmail",
                        data: "{'email':'" + $("#<%=txtEmailRegister.ClientID %>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            if (message.d == false) {
                                $("#message2").css("display", "block");
                                $("#lbMessageEmailRegister").css({
                                    "color": "red",
                                    "font-weight": "bold",
                                    "font-size": "small",
                                    "padding-left": "5px"
                                });
                                $("#lbMessageEmailRegister").text("Email nhập không hợp lệ");
                                $("#imgEmailRegisterStatus").attr({
                                    "src": "Images/error.png",
                                    "width": "16"
                                });
                                $("#imgEmailRegisterStatus").show();
                                // Ẩn Nút Submit nếu UserName không hợp lệ
                                //$("#register").attr("display","block");
                            }
                            else {
                                $("#message2").css("display", "block");
                                $("#lbMessageEmailRegister").css({
                                    "color": "green",
                                    "font-weight": "bold",
                                    "font-size": "small",
                                    "padding-left": "5px"
                                });
                                $("#imgEmailRegisterStatus").attr({
                                    "src": "Images/tick.png",
                                    "width": "16"
                                });
                                //$("#imgErrorRegister").hide();
                                //$("#register").css("display", "block");
                                $("#lbMessageEmailRegister").text("Email hợp lệ")
                            }
                        },
                        error: function (errormessage) {
                            //Hiển thị lỗi nếu xảy ra
                            $("#message2").css("display", "block");
                            $("#imgEmailRegisterStatus").show();
                            $("#lbMessageEmailRegister").text(errormessage.responseText);
                        }
                    });
                };
            });

            $("#<%=txtPassRegister.ClientID %>").blur(function () {
                if ($("#<%=txtPassRegister.ClientID %>").val() == "") {
                    $("#message3").css("display", "block");
                    $("#lbMessagePassRegister").css({
                        "color": "red",
                        "font-weight": "bold",
                        "font-size": "small",
                        "padding-left": "5px"
                    });
                    $("#lbMessagePassRegister").text("Chưa nhập pass");
                    $("#imgPassRegisterStatus").attr({
                        "src": "Images/error.png",
                        "width": "16"
                    });
                    $("#imgPassRegisterStatus").show();
                    //$("#ContentPlaceHolder1_btnRegister").hide();
                    // Ẩn Nút Submit nếu UserName không hợp lệ
                }
                else {
                    $("#message3").css("display", "block");
                    $("#lbMessagePassRegister").css({
                        "color": "green",
                        "font-weight": "bold",
                        "font-size": "small",
                        "padding-left": "5px"
                    });
                    $("#imgPassRegisterStatus").attr({
                        "src": "Images/tick.png",
                        "width": "16"
                    });
                    //$("#imgErrorRegister").hide();
                    $("#register").css("display", "block");
                    $("#lbMessagePassRegister").text("Password hợp lệ")
                };
            });


        });
    </script>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    


    <div class="manage-user">
        <div class="manage-user-h3">
            <h3 class="color-red">
                Quản lý tài khoản
            </h3>
            <hr />
        </div>

        <div class="tabbable-panel">
			<div class="tabbable-line">
				<ul class="nav nav-tabs ">
					<li class="active">
						<a href="#tab_default_1" data-toggle="tab">
						Danh sách </a>
					</li>
					<li>
						<a href="#tab_default_2" data-toggle="tab">
						Tạo tài khoản </a>
					</li>
				</ul>
                <div class="tab-content">
					<div class="tab-pane active" id="tab_default_1">
						<div class="list-user">
                            <%--<h4>Danh sách</h4>--%>
                            <div class="list-user-content">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="rpUserList" runat="server" OnItemCommand="rpUserList_ItemCommand">
                                            <HeaderTemplate>
                                                <table class="table table-hover border-table">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Tài khoản</th>
                                                            <th>Mật khẩu</th>
                                                            <th>Email</th>
                                                            <th class="image-button">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                        <tr>
                                                            <td><asp:Label ID="lbUserID" runat="server" Text='<%#Eval("userID") %>' /></td>
                                                            <td><asp:Label ID="lbUserName" runat="server" Text='<%#Eval("userName") %>' /><asp:TextBox ID="txUserName" CssClass="form-control" Text='<%#Eval("userName") %>' Visible="false" runat="server" /></td>
                                                            <td><asp:Label ID="lbUserPass" runat="server" Text='<%#Eval("userPass") %>' /><asp:TextBox ID="txUserPass" CssClass="form-control" Text='<%#Eval("userPass") %>' Visible="false" runat="server" /></td>
                                                            <td><asp:Label ID="lbUserEmail" runat="server" Text='<%#Eval("userEmail") %>' /><asp:TextBox ID="txUserEmail" CssClass="form-control" Text='<%#Eval("userEmail") %>' Visible="false" runat="server" /></td>
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
                            <div class="lbketqua">
                                <b>Kết quả :</b> <asp:Label ID="lbKetQua" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
					</div> <!-- End tab-pane -->
					<div class="tab-pane" id="tab_default_2">
						<div class="row">
			                <div class="col-md-6 col-md-offset-3">
				                <div class="panel panel-login">
					                <div class="panel-heading">
						                <div class="row">
							                <a href="#" class="active" id="register-form-link">Register</a>

							                <%--<div class="col-xs-6">
							                </div>
							                <div class="col-xs-6">
								                <a href="#" id="register-form-link">Register</a>
							                </div>--%>
						                </div>
						                <hr />
					                </div>
                                    <div class="panel-body">
						                <div class="row">
							                <div class="col-lg-12">
                                                <div id="register-form">
		                                            <div class="form-group">
                                                        <asp:TextBox ID="txtUserRegister" TabIndex="1" CssClass="form-control" placeholder="Username" runat="server" />
			                                            <%--<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" />--%>
		                                            </div>
		                                            <div class="form-group">
                                                        <asp:TextBox ID="txtEmailRegister" TabIndex="2" CssClass="form-control" placeholder="Email Address" runat="server" />
			                                            <%--<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="" />--%>
		                                            </div>
		                                            <div class="form-group">
                                                        <asp:TextBox ID="txtPassRegister" TabIndex="3" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server" />
			                                            <%--<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" />--%>
		                                            </div>
                                                    <div class="form-group ver-mid" id="message1" style="display:none">
                                                        <img id="imgUserRegisterStatus" />
                                                        <span id="lbMessageUserRegister" ></span>
                                                    </div>
                                                    <div class="form-group ver-mid" id="message2" style="display:none">
                                                        <img id="imgEmailRegisterStatus" />
                                                        <span id="lbMessageEmailRegister" ></span>
                                                    </div>
                                                    <div class="form-group ver-mid" id="message3" style="display:none">
                                                        <img id="imgPassRegisterStatus" />
                                                        <span id="lbMessagePassRegister" ></span>
                                                    </div>
		                                            <div class="form-group" id="register" style="display:none">
			                                            <div class="row">
				                                            <div class="col-sm-6 col-sm-offset-3">
                                                                <asp:Button ID="btnRegister" TabIndex="5" CssClass="form-control btn btn-register" runat="server" Text="Đăng ký" OnClick="btnRegister_Click" />
					                                            <%--<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now" />--%>
				                                            </div>
			                                            </div>
		                                            </div>
	                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div> <!-- End tab-pane -->
                </div> <!-- End tab-content -->
            </div> <!-- End tabbable-line -->
        </div>

        



        
        
    </div>



</asp:Content>
