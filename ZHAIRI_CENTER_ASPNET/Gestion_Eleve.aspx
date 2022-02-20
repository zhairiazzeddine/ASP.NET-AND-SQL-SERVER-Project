<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Gestion_Eleve.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Eleve" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Gestion des Elèves

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleButton.css" rel="stylesheet" />
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style2 {
            width: 309px;
        }
        .style3 {
            width: 361px;
        }
        .style4 {
            height: 22px;
        }
        .style5 {
            width: 309px;
            height: 22px;
        }
        .style6 {
            width: 361px;
            height: 22px;
        }
        .style7 {
            height: 61px;
        }
        .style8 {
            width: 309px;
            height: 61px;
        }
        .style9 {
            width: 361px;
            height: 61px;
        }
        .style10 {
            height: 43px;
        }
        .style11 {
            width: 309px;
            height: 43px;
        }
        .style12 {
            width: 361px;
            height: 43px;
        }
        .auto-style5 {
            width: 82px;
        }
        .auto-style6 {
            width: 82px;
            height: 61px;
        }
        .auto-style7 {
            width: 82px;
            height: 43px;
        }
        .auto-style8 {
            width: 82px;
            height: 22px;
        }
        .auto-style9 {
            width: 366px;
        }
        .auto-style10 {
            width: 366px;
            height: 61px;
        }
        .auto-style11 {
            width: 366px;
            height: 43px;
        }
        .auto-style12 {
            width: 366px;
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table class="style1">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Elève"></asp:Label>
                <br />
                <asp:DropDownList CssClass="Tbox" ID="DropIDEleve" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Date Naissance"></asp:Label>
                <br />
                <asp:TextBox CssClass="Tbox" type="date" ID="TdateNaissance" runat="server"></asp:TextBox>
                
                </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">
                <br />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Classe"></asp:Label>
                <br />
                <asp:DropDownList CssClass="Tbox" ID="DropIDClasse" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <br />
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Numéro Mobile"></asp:Label>
                <br />
                <asp:TextBox CssClass="Tbox" ID="Tnum" placeholder="06xxxxxxxx" runat="server"></asp:TextBox>
                <asp:Label ID="Labelnum" runat="server" BackColor="White" BorderColor="White" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style7"></td>
            <td class="auto-style6"></td>
            <td class="style9">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Prénom"></asp:Label>
                <br />
                <asp:TextBox ID="Tprenom" CssClass="Tbox" placeholder="Prénom" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <br />
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Email :"></asp:Label>
                <br />
                <asp:TextBox CssClass="Tbox" ID="Temail" placeholder="Email@domaine.com" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td class="style7"></td>
        </tr>
        <tr>
            <td class="style10"></td>
            <td class="auto-style7"></td>
            <td class="style12">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Nom"></asp:Label>
                <br />
                <asp:TextBox ID="Tnom" CssClass="Tbox" placeholder="Nom" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Sex"></asp:Label>
                <br />
                <asp:RadioButton ID="RadioM" runat="server" GroupName="Genre" Text="Masculin" OnCheckedChanged="RadioM_CheckedChanged" />
                <asp:RadioButton ID="RadioF" runat="server" GroupName="Genre" Text="Feminin" OnCheckedChanged="RadioF_CheckedChanged" />
                <br />
            </td>
            <td class="style10"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">
                <br />
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Adresse"></asp:Label>
                <br />
                <asp:TextBox CssClass="Tbox" ID="Tadresse" placeholder="Adresse" runat="server" TextMode="MultiLine" Height="50px" Width="200px" EnableTheming="True"></asp:TextBox>
                
                <br />
            </td>
            <td class="auto-style9">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Photo"></asp:Label>
                <br />
                <br />
                <asp:FileUpload ID="FileUploadPhoto"  runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style4"></td>
            <td class="auto-style8"></td>
            <td class="style6">
                <br />
                
                <asp:Label ID="LabelEtat" runat="server"></asp:Label>
                
                <br />
            </td>
            <td class="auto-style12"></td>
            <td class="style4"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">
                <asp:Button ID="Bmodifier" CssClass="BUTTONMODIFIER" runat="server"  Text="Modifier" Width="100px" OnClick="Bmodifier_Click" />
                <br />
            </td>
            <td class="auto-style9">
                <asp:Button ID="Bajouter" CssClass="BUTTONAJOUTER" runat="server" OnClick="Bajouter_Click" Text="Ajouter" Width="100px" />
            </td>
            <td>
                <asp:Button ID="BSUPPRIMER" CssClass="BUTTONSUPPRIMER" runat="server"  Text="Supprimer" Width="100px" OnClick="BSUPPRIMER_Click"  />
                </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">
                <br />
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="style3">
                <br />
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
