<%@ Page Title="" Language="C#" MasterPageFile="~/TemplateAdmin.Master" AutoEventWireup="true" CodeBehind="NewProduct.aspx.cs" Inherits="Photocopy.NewProduct" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="color-red">Import dữ liệu Sản phẩm</h3>
    <hr />    

    <div class="import1">
        <div>
            <b>Import danh sách sản phẩm</b><br />
            <div>
                <p class="color-red" style="float:left">Stt Sản phẩm hiện tại : <asp:Label ID="lbSttSanPham" runat="server" Text=""></asp:Label></p>
                <p class="color-red" style="float:right">File đính kèm : <asp:LinkButton ID="linkExcel1" runat="server" OnClick="linkExcel1_Click">Excel mẫu</asp:LinkButton></p>
            </div>
        </div>
        <div class="row">    
            <div class="col-lg-8">  
                <!-- image-preview-filename input [CUT FROM HERE]-->
                <div class="input-group image-preview1">
                    <input type="text" class="form-control image-preview-filename1" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                    <span class="input-group-btn">
                        <!-- image-preview-clear button -->
                        <button type="button" class="btn btn-default image-preview-clear1" style="display:none;outline:none">
                            <span class="glyphicon glyphicon-remove"></span> Clear
                        </button>
                        <!-- image-preview-input -->
                        <div class="btn btn-default image-preview-input1">
                            <span class="glyphicon glyphicon-folder-open"></span>
                            <span class="image-preview-input-title1">Browse</span>
                            <asp:FileUpload ID="FileUpload1" runat="server" name="input-file-preview1"/>
                            <%--<input type="file" id="inputUpload" runat="server" name="input-file-preview"/>--%> <!-- rename it -->
                        </div>
                    </span>
                </div><!-- /input-group image-preview [TO HERE]--> 
            </div>
        </div>
        <div class="row ketqua">
            <div class="col-lg-1">
                <div>
                    <asp:Button ID="btImport" CssClass="btn btn-success" runat="server" Text="Import" OnClick="btImport_Click" />
                </div>
            </div>
            <div class="col-lg-9">
                <div class="lbketqua">
                    <b>Kết quả :</b> <asp:Label ID="lbKetQua" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            <div style="padding:0 20px;margin-top:15px;">
                <h5 style="font-weight:bold">Bảng danh sách sản phẩm hiện tại</h5>
                <hr />
            </div>
            
            <div style="margin: 20px;font-size: 11px !important;height: 400px;overflow: scroll;">
                <%--<asp:GridView ID="gvSanPham" runat="server" AutoGenerateColumns="false">
                    <EmptyDataTemplate>
                        <div style="padding:10px">
                            Không có sản phẩm
                        </div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField HeaderText="Sản Phẩm ID" DataField="SanPhamID"/>
                        <asp:BoundField HeaderText="Mã Sản Phẩm" DataField="MaSanPham"/>
                        <asp:BoundField HeaderText="Mã Sản Xuất" DataField="MaSanXuat"/>
                        <asp:BoundField HeaderText="Tên Sản Phẩm" DataField="TenSanPham"/>
                        <asp:BoundField HeaderText="Loại Máy" DataField="LoaiMay"/>
                        <asp:BoundField HeaderText="Đơn Giá" DataField="DonGia"/>
                        <asp:BoundField HeaderText="Ngày Nhập Hàng" DataField="NgayNhapHang"/>
                        <asp:BoundField HeaderText="Số Lượng" DataField="SoLuong"/>
                        <asp:BoundField HeaderText="Cho Thuê" DataField="ChoThue"/>
                        <asp:BoundField HeaderText="Nổi Bật" DataField="Hot"/>
                        <asp:BoundField HeaderText="Lượt Xem" DataField="LuotXem"/>
                        <asp:BoundField HeaderText="Giá" DataField="Gia"/>
                        <asp:BoundField HeaderText="Hình Ảnh" DataField="HinhAnh"/>
                    </Columns>
                </asp:GridView>--%>
                <asp:Repeater ID="rpSanPhamFromExcel" runat="server">
                    <HeaderTemplate>
                        <table class="table table-hover border-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>MãSP</th>
                                    <th>MãSX</th>
                                    <th>Tên</th>
                                    <th>Loại</th>
                                    <th>Đơn Giá</th>
                                    <th>Ngày Nhập</th>
                                    <th>Số Lượng</th>
                                    <th>Cho Thuê</th>
                                    <th>Nổi Bật</th>
                                    <th>Lượt Xem</th>
                                    <th>Giá</th>
                                    <th>Hình Ảnh</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("SanPhamID") %>
                                    </td>
                                    <td>
                                        <%#Eval("MaSanPham") %>
                                    </td>
                                    <td>
                                        <%#Eval("MaSanXuat") %>
                                    </td>
                                    <td>
                                        <%#Eval("TenSanPham") %>
                                    </td>
                                    <td>
                                        <%#Eval("LoaiMay") %>
                                    </td>
                                    <td>
                                        <%#Eval("DonGia") %>
                                    </td>
                                    <td>
                                        <%#Eval("NgayNhapHang") %>
                                    </td>
                                    <td>
                                        <%#Eval("SoLuong") %>
                                    </td>
                                    <td>
                                        <%#Eval("ChoThue") %>
                                    </td>
                                    <td>
                                        <%#Eval("Hot") %>
                                    </td>
                                        <td>
                                        <%#Eval("LuotXem") %>
                                    </td>
                                        <td>
                                        <%#Eval("Gia") %>
                                    </td>
                                        <td>
                                        <%#Eval("HinhAnh") %>
                                    </td>
                                </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                   </FooterTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>

    <div class="import2">
        <div>
            <b>Import chức năng sản phẩm</b><br />
            <div>
                <p class="color-red" style="float:left">Stt Option hiện tại : <asp:Label ID="lbSttOption" runat="server" Text="" /></p>
                <p class="color-red" style="float:right">File đính kèm : <asp:LinkButton ID="linkExcel2" runat="server" OnClick="linkExcel2_Click">Excel mẫu</asp:LinkButton></p>
            </div>
        </div>
        <div class="row">    
            <div class="col-lg-8">  
                <!-- image-preview-filename input [CUT FROM HERE]-->
                <div class="input-group image-preview2">
                    <input type="text" class="form-control image-preview-filename2" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                    <span class="input-group-btn">
                        <!-- image-preview-clear button -->
                        <button type="button" class="btn btn-default image-preview-clear2" style="display:none;outline:none">
                            <span class="glyphicon glyphicon-remove"></span> Clear
                        </button>
                        <!-- image-preview-input -->
                        <div class="btn btn-default image-preview-input2">
                            <span class="glyphicon glyphicon-folder-open"></span>
                            <span class="image-preview-input-title2">Browse</span>
                            <asp:FileUpload ID="FileUpload2" runat="server" name="input-file-preview2"/>
                            <%--<input type="file" id="inputUpload" runat="server" name="input-file-preview"/>--%> <!-- rename it -->
                        </div>
                    </span>
                </div><!-- /input-group image-preview [TO HERE]--> 
            </div>
        </div>
        <div class="row ketqua">
            <div class="col-lg-1">
                <div>
                    <asp:Button ID="btnImport2" CssClass="btn btn-success" runat="server" Text="Import" OnClick="btnImport2_Click" />
                </div>
            </div>
            <div class="col-lg-9">
                <div class="lbketqua">
                    <b>Kết quả :</b> <asp:Label ID="lbKetQua2" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">

            <div style="padding:0 20px;margin-top:15px;">
                <h5 style="font-weight:bold">Bảng danh sách chức năng hiện tại</h5>
                <hr />
            </div>

            <div style="margin: 20px;font-size: 11px !important;height: 400px;overflow: scroll;">
                <asp:Repeater ID="rpChucNangSanPhamFromExcel" runat="server">
                   <HeaderTemplate>
                     <table class="table table-striped">
                       <tr>
                            <th>OptionID</th>
                            <th>SanPhamID</th>
                            <th>OptionName</th>
                            <th>OptionDescription</th>
                       </tr>
                   </HeaderTemplate>
                   <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("OptionID") %>
                            </td>
                            <td>
                                <%#Eval("SanPhamID") %>
                            </td>
                            <td>
                                <%#Eval("OptionName") %>
                            </td>
                            <td>
                                <%#Eval("OptionDescription") %>
                            </td>
                        </tr>
                   </ItemTemplate>
                   <FooterTemplate>
                     </table>
                   </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    

    <script type="text/javascript">
        $(document).on('click', '#close-preview1', function () {
            $('.image-preview1').popover('hide');
            // Hover befor close the preview
            $('.image-preview1').hover(
                function () {
                    $('.image-preview1').popover('show');
                },
                 function () {
                     $('.image-preview1').popover('hide');
                 }
            );
        })
        .on('click', '#close-preview2', function () {
            $('.image-preview2').popover('hide');
            // Hover befor close the preview
            $('.image-preview2').hover(
                function () {
                    $('.image-preview2').popover('show');
                },
                 function () {
                     $('.image-preview2').popover('hide');
                 }
            );
        });

        $(function () {
            //Import 1
            // Create the close button
            var closebtn = $('<button/>', {
                type: "button",
                text: 'x',
                id: 'close-preview1',
                style: 'font-size: initial;',
            });
            closebtn.attr("class", "close pull-right");
            // Set the popover default content
            $('.image-preview1').popover({
                trigger: 'manual',
                html: true,
                title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
                content: "There's no image",
                placement: 'bottom'
            });
            // Clear event
            $('.image-preview-clear1').click(function () {
                $('.image-preview1').attr("data-content", "").popover('hide');
                $('.image-preview-filename1').val("");
                $('.image-preview-clear1').hide();
                $('.image-preview-input1 input:file').val("");
                $(".image-preview-input-title1").text("Browse");
            });
            // Create the preview image
            $(".image-preview-input1 input:file").change(function () {
                var file = this.files[0];
                var reader = new FileReader();
                // Set preview image into the popover data-content
                reader.onload = function (e) {
                    $(".image-preview-input-title1").text("Change");
                    $(".image-preview-clear1").show();
                    $(".image-preview-filename1").val(file.name);

                }
                reader.readAsDataURL(file);
            });


            //Import 2
            var closebtn = $('<button/>', {
                type: "button",
                text: 'x',
                id: 'close-preview2',
                style: 'font-size: initial;',
            });
            closebtn.attr("class", "close pull-right");
            // Set the popover default content
            $('.image-preview2').popover({
                trigger: 'manual',
                html: true,
                title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
                content: "There's no image",
                placement: 'bottom'
            });
            // Clear event
            $('.image-preview-clear2').click(function () {
                $('.image-preview2').attr("data-content", "").popover('hide');
                $('.image-preview-filename2').val("");
                $('.image-preview-clear2').hide();
                $('.image-preview-input2 input:file').val("");
                $(".image-preview-input-title2").text("Browse");
            });
            // Create the preview image
            $(".image-preview-input2 input:file").change(function () {
                var file = this.files[0];
                var reader = new FileReader();
                // Set preview image into the popover data-content
                reader.onload = function (e) {
                    $(".image-preview-input-title2").text("Change");
                    $(".image-preview-clear2").show();
                    $(".image-preview-filename2").val(file.name);

                }
                reader.readAsDataURL(file);
            });
        });
    </script>

    

</asp:Content>
