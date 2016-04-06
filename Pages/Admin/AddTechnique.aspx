<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="AddTechnique.aspx.cs" Inherits="Photocopy.AddTechnique" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="add-technique">
        <div class="add-technique-h3">
            <h3 class="color-red">
                Thêm kỹ thuật hỗ trợ
            </h3>
            <hr />
        </div>
        <div class="add-technique-content">
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
                    <asp:Label ID="lbTechniqueContent" runat="server" Text="Nội dung"></asp:Label>
                </div>
                <div class="content-html-input col-lg-9">
                    <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                    <%--<blockquote style="margin:10px;">
                        <p >
                            <b style="color:red">Chọn code HTML ở trên , Copy xuống dưới</b>
                        </p>
                    </blockquote>
                    <asp:TextBox ID="txTechniqueContent" runat="server" TextMode="MultiLine" CssClass="form-control" onkeyup="document.getElementById('preview').innerHTML = this.value" />--%>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-1">
                    <div class="add-technique-button">
                        <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="lbketqua">
                        <b>Kết quả :</b> <asp:Label ID="lbKetQua" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>          
        </div>
        
        <%--<div class="preview-content">
            <h4>Xem qua nội dung</h4>
            <div id="preview">

            </div>
        </div>--%>


    </div>

</asp:Content>
