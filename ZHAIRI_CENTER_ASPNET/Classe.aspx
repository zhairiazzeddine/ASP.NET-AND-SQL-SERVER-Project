<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Classe.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Classe" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
   Gestion Classes
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 625px;
        }
        .auto-style2 {
            width: 718px;
        }
    </style>
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
    <link href="Styles/GridView.css" rel="stylesheet" />
    <link href="Styles/StyleButton.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <table class="style5">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:GridView ID="GridClasse" ssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="ID"
                ShowHeaderWhenEmpty="True" OnRowCommand="GridClasse_RowCommand" OnRowEditing="GridClasse_RowEditing" OnRowCancelingEdit="GridClasse_RowCancelingEdit" OnRowUpdating="GridClasse_RowUpdating" OnRowDeleting="GridClasse_RowDeleting"
                    
                    
                    
                
                    
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style7" style="margin-left: 0px; margin-right: 154px;" Width="592px">
                <%-- Theme Properties --%>
                <FooterStyle BackColor="White" ForeColor="#3F3F3F" />
                <HeaderStyle BackColor="#3F3F3F" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server" />
                        </ItemTemplate>
                        <%--<EditItemTemplate>
                           <asp:TextBox  ReadOnly="true" ID="txtID" Text='<%# Eval("ID") %>' runat="server" />
                        </EditItemTemplate>--%>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Libelle">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("LIBELLE") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox  CssClass="Tbox" ID="txtLibelle" Text='<%# Eval("LIBELLE") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox placeholder="Libelle" CssClass="Tbox" ID="txtLibelleFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Sous_Groupe">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("SOUS_GROUPE") %>' runat="server" />
                        </ItemTemplate>

                        <EditItemTemplate>
                           <asp:DropDownList CssClass="Tbox" ID="txtSous_Groupe"  Text='<%# Eval("SOUS_GROUPE") %>' runat="server" >
                               <asp:ListItem>A</asp:ListItem>
                               <asp:ListItem>B</asp:ListItem>
                           </asp:DropDownList>
                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:DropDownList CssClass="Tbox" ID="txtSous_GroupeFooter"  runat="server" >
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                             </asp:DropDownList>
                        </FooterTemplate>


                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Icons/Modifier.png" runat="server" CommandName="Edit" ToolTip="Modifer" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Icons/supprimer.png" runat="server" CommandName="Delete" ToolTip="Supprimer" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>

                            <asp:ImageButton ImageUrl="~/Icons/enregitrer.png" runat="server" CommandName="Update" ToolTip="Enregistrer" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Icons/annuler.png" runat="server" CommandName="Cancel" ToolTip="Annuler" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Icons/ajouter.png" runat="server" CommandName="Addnew" ToolTip="Ajouter un Nouveau" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField FooterText="hs" HeaderText="hddd" Target="_blank" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="LabelleMessageAffectetion" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="LabelleMessageErreur" Text="" runat="server" ForeColor="Red" />&nbsp;<br />
        <span style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16.44px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                Choisissez une tâche...</span></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:Label ID="Label1" runat="server" BorderColor="Blue" ForeColor="Blue" Text="Fichier Excel (.xlsx .xlsb .xls)"></asp:Label>
                <asp:FileUpload ID="FileUpload" runat="server" Width="121px" />
                &nbsp;
                <asp:ImageButton ID="Bimporter" runat="server" Height="20px" ImageUrl="~/Icons/importation.png" Width="70px" OnClick="Bimporter_Click" />
                <br />
                <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="SupprimerTout" OnClientClick="return confirm('vous étes sur le point de supression de tous les Classes');"  runat="server" OnClick="SupprimerTout_Click">Suppression de Tous Les Matieres</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
