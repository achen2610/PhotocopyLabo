<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="TechniqueSupport.aspx.cs" Inherits="Photocopy.TechniqueSupport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>NHẤT THIÊN TÂN | HỖ TRỢ KỸ THUẬT</title>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-lg-9">
            <div class="kythuatchitiet">
                <div class="kythuatchitiet-h3">
                    <h3><asp:Label ID="lbTechniqueH3" runat="server" Text=""></asp:Label></h3>
                    <p><asp:Label ID="lbTechniquePostDate" runat="server" Text=""></asp:Label></p>
                    <asp:Repeater ID="rptFacebook" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="fb-like" data-href='http://nhatthientan.com/ho-tro-ky-thuat/<%#Eval("TechniqueID") %>' data-width="1150" data-layout="standard" data-action="like" data-share="true"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <hr />
                </div>
                <div class="kythuatchitiet-content">
                    <asp:Label ID="lbTechniqueContent" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="col-lg-3">

        </div>
    </div>

</asp:Content>
