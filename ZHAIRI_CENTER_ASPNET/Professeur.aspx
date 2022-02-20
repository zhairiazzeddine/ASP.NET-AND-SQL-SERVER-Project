<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Professeur.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Professeur1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Gestion des Professeurs
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 534px;
        }
    </style>
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <table >
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:GridView ID="GridProfesseur" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                    OnRowCommand="GridProfesseur_RowCommand" OnRowEditing="GridProfesseur_RowEditing" OnRowCancelingEdit="GridProfesseur_RowCancelingEdit"
                    OnRowUpdating="GridProfesseur_RowUpdating" OnRowDeleting="GridProfesseur_RowDeleting"
                    
            
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style7" style="margin-left: 0px" Width="960px">
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

                    <asp:TemplateField HeaderText="Prénom">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("PRENOM") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox  CssClass="Tbox" ID="txtPrenom" Text='<%# Eval("PRENOM") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="Tbox" ID="txtPrenomFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nom">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("NOM") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox  CssClass="Tbox" ID="txtNom" Text='<%# Eval("NOM") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="Tbox" ID="txtNomFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Sex">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("SEX") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:DropDownList CssClass="Tbox" ID="txtSex"  Text='<%# Eval("SEX") %>' runat="server" >
                               <asp:ListItem>M</asp:ListItem>
                               <asp:ListItem>F</asp:ListItem>
                           </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList CssClass="Tbox" ID="txtSexFooter"  runat="server" >
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                             </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Adresse">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ADRESSE") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox  CssClass="Tbox" ID="txtAdresse" Text='<%# Eval("ADRESSE") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="Tbox" ID="txtAdresseFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Numéro GSM">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("NUMERO_GSM") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox CssClass="Tbox" ID="txtnumero_gsm" Text='<%# Eval("NUMERO_GSM") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox placeholder="06xxxxxxxx" CssClass="Tbox" ID="txtnumero_gsmFooter" runat="server" />
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
            <asp:Label ID="LabelleMessageErreur" Text="" runat="server" ForeColor="Red" />&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Image ID="flesh1" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:Label ID="Label1" runat="server" BorderColor="Blue" ForeColor="Blue" Text="Fichier Excel (.xlsx .xlsb .xls)"></asp:Label>
                <asp:FileUpload ID="FileUpload" runat="server" />
                <asp:ImageButton ID="Bimporter" runat="server" Height="20px" ImageUrl="~/Icons/importation.png" Width="73px" OnClick="Bimporter_Click"  />
                <br />
                <asp:Image ID="flesh2" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="SupprimerTout" OnClientClick="return confirm('vous étes sur le point de supression de tous les Classes');"  runat="server" OnClick="SupprimerTout_Click" >Suppression de Tous Les Matieres</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
