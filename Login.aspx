<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Photocopy.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/admin/SiteAdmin.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.11.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    

</head>
<body>
    <form runat="server">
    <div class="container" style="padding-top:150px;">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<a href="#" class="active" id="login-form-link">Login</a>

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
								<div id="login-form" style="display: block;">
									<div class="form-group">
                                        <asp:TextBox ID="txtUsername" TabIndex="1" CssClass="form-control" placeholder="Username" runat="server" />
										<%--<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" />--%>
									</div>
									<div class="form-group">
                                        <asp:TextBox ID="txtPassword" TabIndex="2" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server" />
										<%--<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" />--%>
									</div>
                                    <div class="form-group ver-mid">
                                        <asp:Image ID="imgError" ImageUrl="~/Images/error.png" Width="16" Visible="false" runat="server" />
                                        <asp:Label ID="lbMessage" Visible="false" runat="server" Text=""></asp:Label>
                                    </div>
									<div class="form-group text-center">
                                        <asp:CheckBox ID="cbRemember" TabIndex="3" runat="server" />
										<%--<input type="checkbox" tabindex="3" class="" name="remember" id="remember" />--%>
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
                                                <asp:Button ID="btnLogin" TabIndex="4" CssClass="form-control btn btn-login" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
												<%--<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In" />--%>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
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
		</div>
	</div>
    </form>
    <script type="text/javascript">
        $(function () {

            $('#login-form-link').click(function (e) {
                $("#login-form").delay(100).fadeIn(100);
                $("#register-form").fadeOut(100);
                $('#register-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });
            $('#register-form-link').click(function (e) {
                $("#register-form").delay(100).fadeIn(100);
                $("#login-form").fadeOut(100);
                $('#login-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });

        });

        

    </script>


</body>
</html>
