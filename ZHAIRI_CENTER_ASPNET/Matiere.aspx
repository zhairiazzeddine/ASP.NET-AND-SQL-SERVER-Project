<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Matiere.aspx.cs"  Inherits="ZHAIRI_CENTER_ASPNET.Matiere1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Gestion Matieres
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/GridView.css" rel="stylesheet" />
    <style type="text/css">
       
        .style5 {
            width: 100%;
        }
       
        .style6 {
            width: 461px;
        }
       
        .style7 {
            margin-left: 62px;
        }
       
        .auto-style1 {
            width: 547px;
        }
       
        .auto-style2 {
            width: 547px;
            height: 349px;
        }
        .auto-style3 {
            height: 349px;
        }
       
    </style>
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
</asp:Content>

    


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

   
    
    
    
   
    
    <table class="style5">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style3">
                <asp:GridView ID="GridMatiere"  HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"  runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                ShowHeaderWhenEmpty="true"

                    OnRowCommand="GridMatiere_RowCommand" OnRowEditing="GridMatiere_RowEditing" 
                    OnRowCancelingEdit="GridMatiere_RowCancelingEdit" OnRowUpdating="GridMatiere_RowUpdating" 
                    OnRowDeleting="GridMatiere_RowDeleting" 
                    
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style7">
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
                            <asp:Label Text='<%# Eval("Libelle") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox  CssClass="Tbox" ID="txtLibelle" Text='<%# Eval("Libelle") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox placeholder="Libelle" CssClass="Tbox" ID="txtLibelleFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Niveau Scolaire">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("NIVEAU_SCOLAIRE") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox CssClass="Tbox" ID="txtNiveau_Scolaire" Text='<%# Eval("Niveau_Scolaire") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox placeholder="Niveau Scolaire" CssClass="Tbox" ID="txtNiveauScolaireFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prix (DH)">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Prix") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox CssClass="Tbox" ID="txtPrix" Text='<%# Eval("Prix") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox placeholder="Prix" CssClass="Tbox" ID="txtPrixFooter" runat="server" />
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
            <td>
                <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:Label ID="Label1" runat="server" BorderColor="Blue" ForeColor="Blue" Text="importation des Donneés depuis fichier Excel"></asp:Label>
                <asp:FileUpload ID="FileUpload" runat="server" Width="118px" />
                <asp:ImageButton ID="Bimporter" runat="server" Height="20px" ImageUrl="~/Icons/importation.png" OnClick="ImageButton1_Click" Width="70px" />
                <br />
                <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LinkButton" runat="server">Suppression de Tous Les Matieres</asp:LinkButton>
            </td>
        </tr>
    </table>
    
   
    
    
    
   
    
</asp:Content>
