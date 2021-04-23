<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="GestionCours.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.GestionCours" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 305px;
        }
        .auto-style6 {
            width: 305px;
            height: 1px;
        }
        .auto-style9 {
            height: 1px;
        }
        .auto-style10 {
            width: 230px;
        }
        .auto-style11 {
            width: 230px;
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
            width: 433px;
        }
        .auto-style16 {
            width: 433px;
            height: 1px;
        }
    </style>
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br /><div style="font-size:xx-large; font-family: 'Adobe Heiti Std R';" align="center">Gestion des Cours</div><br /><br /><br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Professeur"></asp:Label>
                <asp:DropDownList ID="DropIDProfesseur" runat="server"  Width="190px" CssClass="Tbox">
                </asp:DropDownList>
            </td>
            <td>
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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style16"></td>
            <td class="auto-style11">
            </td><br />
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10">
                <br />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Classe"></asp:Label>
                <br />
                <asp:DropDownList ID="DropIDClasse" runat="server" Width="190px" CssClass="Tbox">
                </asp:DropDownList>
            </td>
            <td>
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="Durée"></asp:Label>
                <br />
                <asp:TextBox ID="Tduree" placeholder="hh:mm" runat="server" Width="58px" CssClass="Tbox"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td style="font-size: 12px; font-weight: bold" class="auto-style10">
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Horaires"></asp:Label>
                <br />
                Heure Début
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Heure Fin<br />
                <asp:TextBox ID="Theuredebut" placeholder="hh:mm" runat="server" Width="61px" CssClass="Tbox" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TheureFin" placeholder="hh:mm" runat="server" Width="61px" CssClass="Tbox"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10">
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td id="DropJour" class="auto-style10">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10">
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
