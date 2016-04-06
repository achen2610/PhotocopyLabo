<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="Photocopy.EditNews" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="back-home">
        <asp:LinkButton ID="linkBackHome" OnClick="linkBackHome_Click" runat="server"><img src="Images/back.png" /> Quay lại</asp:LinkButton>
    </div>

    <div class="edit-news">
        <div class="edit-news-h3">
            <h3>
                Sửa tin tức<asp:Label ID="lbTinTucID" runat="server" Text="" Visible="false"></asp:Label>
            </h3>
            <hr />
        </div>
        <div class="edit-news-content">
            <div class="content-title row">
                <div class="content-title-lb col-lg-3">
                    <asp:Label ID="lbTitle" runat="server" Text="Tiêu đề tin tức"></asp:Label>
                </div>
                <div class="content-title-input col-lg-9">
                    <asp:TextBox ID="txTitle" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="content-html row">
                <div class="content-html-lb col-lg-3">
                    <asp:Label ID="lbHtml" runat="server" Text="Nội dung tin tức"></asp:Label>
                </div>
                <div class="content-html-input col-lg-9">
                    <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                    <%--<blockquote style="margin:10px;">
                        <p >
                            <b style="color:red">Chọn code HTML ở trên , Copy xuống dưới</b>
                        </p>
                    </blockquote>
                    <asp:TextBox ID="txHtml" runat="server" TextMode="MultiLine" CssClass="form-control" onclick="document.getElementById('preview').innerHTML = this.value" onkeyup="document.getElementById('preview').innerHTML = this.value"></asp:TextBox>--%>
                </div>
            </div>
            <div class="content-image row">
                <div class="content-image-lb col-lg-3">
                    <asp:Label ID="lbImage" runat="server" Text="Hình ảnh tin tức"></asp:Label>
                </div>
                <div class="content-image-input col-lg-4">
                    <asp:TextBox ID="txImage" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="content-quote row">
                <div class="content-quote-lb col-lg-3">
                    <asp:Label ID="lbQuote" runat="server" Text="Sơ lược tin tức"></asp:Label>
                </div>
                <div class="content-quote-input col-lg-9">
                    <asp:TextBox ID="txQuote" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="content-hot row">
                <div class="content-hot-lb col-lg-3">
                    <asp:Label ID="lbHot" runat="server" Text="Có phải nổi bật không ?"></asp:Label>
                </div>
                <div class="content-hot-input col-lg-4">
                    <asp:CheckBox ID="cbHot" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-1">
                    <div class="edit-news-button">
                        <asp:Button ID="btnSave" runat="server" Text="Cập Nhập" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    </div>
                </div>
                <%--<div class="col-lg-9">
                    <div class="lbketqua">
                        <b>Kết quả :</b> <asp:Label ID="lbKetQua" runat="server" Text=""></asp:Label>
                    </div>
                </div>--%>
            </div>
            
        </div>
        
       <%-- <div class="preview-content">
            <h4>Xem qua nội dung trang tin tức</h4>
            <div id="preview">

            </div>
        </div>--%>


    </div>

</asp:Content>
