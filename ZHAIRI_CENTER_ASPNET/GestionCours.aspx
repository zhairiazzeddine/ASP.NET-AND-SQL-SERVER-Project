<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="GestionCours.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.GestionCours" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Gestion Cours
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 571px;
        }
        .auto-style6 {
            width: 571px;
            height: 1px;
        }
        .auto-style9 {
            height: 1px;
        }
        .auto-style14 {
            border-bottom: 1.5px solid black;
            outline: none;
            color: black;
            font-size: 16px;
            background-color: transparent;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
            margin-bottom: 0px;
        }
        .auto-style15 {
            width: 261px;
        }
        .auto-style16 {
            width: 261px;
            height: 1px;
        }
        .auto-style19 {
            width: 571px;
            height: 20px;
        }
        .auto-style22 {
            height: 20px;
        }
        .auto-style23 {
            width: 85px;
        }
        .auto-style24 {
            width: 85px;
            height: 1px;
        }
        .auto-style25 {
            width: 85px;
            height: 20px;
        }
        .auto-style26 {
            width: 261px;
            height: 20px;
        }
    </style>
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
    <link href="Styles/StyleButton.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <br /><br /><div style="font-size:xx-large; font-family: 'Adobe Heiti Std R';" align="center">Gestion des Cours</div><br /><br /><br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style15">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Professeur"></asp:Label>
                <asp:DropDownList ID="DropIDProfesseur" runat="server"  Width="190px" CssClass="Tbox">
                </asp:DropDownList>
            </td>
            <td class="auto-style15">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Jour"></asp:Label>
                <br />
                <asp:DropDownList ID="DropJour" runat="server" Width="160px" CssClass="auto-style14">
                    <asp:ListItem>Lundi</asp:ListItem>
                    <asp:ListItem>Mardi</asp:ListItem>
                    <asp:ListItem>Mercredi</asp:ListItem>
                    <asp:ListItem>Jeudi</asp:ListItem>
                    <asp:ListItem>Vendredi</asp:ListItem>
                    <asp:ListItem>Samedi</asp:ListItem>
                    <asp:ListItem>Dimanche</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="BTNremplissage" runat="server" OnClick="BTNremplissage_Click" Text="Remplir" Width="67px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style24"></td>
            <td class="auto-style16">
            </td><br />
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style15">
                <br />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Classe"></asp:Label>
                <br />
                <asp:DropDownList ID="DropIDClasse" runat="server" Width="190px" CssClass="Tbox">
                </asp:DropDownList>
            </td>
            <td class="auto-style15">
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="Durée"></asp:Label>
                <br />
                <asp:TextBox ID="Tduree" placeholder="hh:mm" runat="server" Width="63px" CssClass="Tbox"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td style="font-size: 12px; font-weight: bold" class="auto-style15">
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Horaires"></asp:Label>
                <br />
                Heure Début
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Heure Fin<br />
                <asp:TextBox ID="Theuredebut" placeholder="hh:mm" runat="server" Width="63px" CssClass="Tbox" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TheureFin" placeholder="hh:mm" runat="server" Width="63px" CssClass="Tbox"></asp:TextBox>
            </td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style15">
                <br />
            </td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19"></td>
            <td class="auto-style25">
            </td>
            <td id="DropJour" class="auto-style26">
                <asp:Button ID="Bajouter" CssClass="BUTTONAJOUTER" runat="server" Text="Ajouter" Width="90px" OnClick="Bajouter_Click" />
            </td>
            <td class="auto-style26">
                <asp:Button ID="Bmodifier" CssClass="BUTTONMODIFIER" runat="server" Text="Modifier" Width="90px" OnClick="Bmodifier_Click" />
            </td>
            <td class="auto-style22">
                <asp:Button ID="Bsupprimer" CssClass="BUTTONSUPPRIMER" runat="server" Text="Supprimer" Width="90px" OnClick="Bsupprimer_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style15">
                <br />
            </td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style15">
                <asp:Label ID="LabelEtat" runat="server"></asp:Label>
            </td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
