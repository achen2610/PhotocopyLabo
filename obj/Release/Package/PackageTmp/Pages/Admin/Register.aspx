<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Photocopy.Page.Admin.Register" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        //var $j = jQuery.noConflict();
        $(document).ready(function () {
            $("#<%=txtUserRegister.ClientID %>").blur(function () {
                if ($("#<%=txtUserRegister.ClientID %>").val() == "") {
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
                    $("#btnRegister").hide();
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "CheckRegister.asmx/CheckUserIsValid",
                        data: "{'username':'" + $("#<%=txtUserRegister.ClientID %>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            if (message.d == false) {
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
                                $("#btnRegister").hide();
                            }
                            else {
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
                                $("#btnRegister").show();
                                $("#lbMessageUserRegister").text("UserName này chưa có. Bạn có thể sử dụng")
                            }
                        },
                        error: function (errormessage) {
                            //Hiển thị lỗi nếu xảy ra
                            $("#imgUserRegisterStatus").show();
                            $("#lbMessageUserRegister").text(errormessage.responseText);
                        }
                    });
                };
            });
            $("#<%=txtEmailRegister.ClientID %>").blur(function () {
                if ($("#<%=txtEmailRegister.ClientID %>").val() == "") {
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
                                $("#btnRegister").hide();
                            }
                            else {
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
                                $("#btnRegister").show();
                                $("#lbMessageEmailRegister").text("Email hợp lệ")
                            }
                        },
                        error: function (errormessage) {
                            //Hiển thị lỗi nếu xảy ra
                            $("#imgEmailRegisterStatus").show();
                            $("#lbMessageEmailRegister").text(errormessage.responseText);
                        }
                    });
                };
            });
        });
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
		<%--<div class="form-group">
            <asp:TextBox ID="txtPassConfirmRegister" TabIndex="4" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server" />
			<%--<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password" />
		</div>--%>
        <div class="form-group ver-mid">
            <img id="imgUserRegisterStatus" />
            <span id="lbMessageUserRegister" ></span>
            <%--<asp:Image ID="imgUserRegisterStatus" runat="server" /> <%--ImageUrl="~/Images/error.png"
            <asp:Label ID="lbMessageUserRegister" Visible="true" runat="server" Text="" />--%>
        </div>
        <div class="form-group ver-mid">
            <asp:Image ID="imgEmailRegisterStatus" runat="server" /> <%--ImageUrl="~/Images/error.png"--%>
            <asp:Label ID="lbMessageEmailRegister" Visible="true" runat="server" Text="" />
        </div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
                    <asp:Button ID="btnRegister" TabIndex="5" CssClass="form-control btn btn-register" runat="server" Text="Đăng ký" />
					<%--<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now" />--%>
				</div>
			</div>
		</div>
	</div>

</asp:Content>
