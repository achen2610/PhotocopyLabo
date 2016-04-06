<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="EditTechnique.aspx.cs" Inherits="Photocopy.EditTechnique" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="back-home">
        <asp:LinkButton ID="linkBackHome" OnClick="linkBackHome_Click" runat="server"><img src="Images/back.png" /> Quay lại</asp:LinkButton>
    </div>

    <div class="edit-technique">
        <div class="edit-technique-h3">
            <h3>
                Sửa<asp:Label ID="lbTechniqueID" runat="server" Text="" Visible="false"></asp:Label>
            </h3>
            <hr />
        </div>
        <div class="edit-technique-content">
            <div class="content-title row">
                <div class="content-title-lb col-lg-3">
                    <asp:Label ID="lbTechniqueName" runat="server" Text="Tiêu đề"></asp:Label>
                </div>
                <div class="content-title-input col-lg-9">
                    <asp:TextBox ID="txTechniqueName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="content-html row">
                <div class="content-html-lb col-lg-3">
                    <asp:Label ID="lbHtml" runat="server" Text="Nội dung"></asp:Label>
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
            <div class="row">
                <div class="col-lg-1">
                    <div class="edit-technique-button">
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
        
<%--        <div class="preview-content">
            <h4>Xem qua nội dung trang</h4>
            <div id="preview">

            </div>
        </div>--%>


    </div>


</asp:Content>
