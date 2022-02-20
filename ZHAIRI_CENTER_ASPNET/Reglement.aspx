<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Reglement.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Reglement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style3 {
            height: 22px;
            width: 52px;
        }
    </style>
    <link href="Styles/GridView.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <table class="auto-style1">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                  &nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                  Recherche Par Nom :
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/Icons/Recherche.png" Width="20px" />
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                  &nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                  <asp:GridView ID="GridReg" CssClass="mydatagrid" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"  >
                      <AlternatingRowStyle BackColor="#CCCCCC" />
                      <FooterStyle BackColor="#CCCCCC" />
                      <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                      <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                      <SortedAscendingCellStyle BackColor="#F1F1F1" />
                      <SortedAscendingHeaderStyle BackColor="#808080" />
                      <SortedDescendingCellStyle BackColor="#CAC9C9" />
                      <SortedDescendingHeaderStyle BackColor="#383838" />
                  </asp:GridView>
            </td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                  &nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                  &nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
        <span style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16.44px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                  Choisissez une tâche...</span></td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LinkButton" runat="server">Imprimer Reçu</asp:LinkButton>
                  <br />
                <asp:Image ID="Image3" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LinkButton0" runat="server">Ajouter Réglement</asp:LinkButton>
                  <br />
                <asp:Image ID="Image4" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LinkButton1" runat="server">Modifier Réglement</asp:LinkButton>
                  <br />
                <asp:Image ID="Image5" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LinkButton2" runat="server">Supprimer Réglement</asp:LinkButton>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
    </table>

</asp:Content>
