<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="Boss.aspx.cs" Inherits="Photocopy.Admin1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	
    <h1>Trang quản lý</h1>

    <p>Mập vào import dữ liệu nhớ xem STT sản phẩm hiện tại , rồi chỉnh trong file Excel sản phẩm với STT tiếp theo nhé, tránh bị lỗi</p>

    <div class="huong-dan-import">
        <h3>Hướng dẫn Import dữ liệu từ file excel vào SQLServer</h3>
        <hr />
        <p><b>Bước 1</b> : Vào trang <b class="color-red">Danh sách sản phẩm</b> kiểm tra <b class="color-red">STT</b> sản phẩm hiện tại đang có trong CSDL</p>
        <p><b>Bước 2</b> : Nhập liệu vào file Excel với <b class="color-red">STT</b> tiếp theo <b class="color-red">STT</b> trong danh sách sản phẩm</p>
        <p><b>Bước 3</b> : Nhấn nút Import để import dữ liệu vào, và xem thông báo thành công hay chưa .</p>
        <p>Done !</p>
    </div>
    
    
</asp:Content>
