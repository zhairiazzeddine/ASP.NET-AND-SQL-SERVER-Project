<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="LesDates.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.LesDates1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
   Les Dates
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/GridView.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style1 {
        width: 558px;
    }
</style>
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
                <asp:GridView ID="GridDates"  HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"  runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                  ShowHeaderWhenEmpty="true"   OnRowCommand="GridDates_RowCommand" OnRowEditing="GridDates_RowEditing" OnRowCancelingEdit="GridDates_RowCancelingEdit" OnRowUpdating="GridDates_RowUpdating" OnRowDeleting="GridDates_RowDeleting"
                    
                    
                
                    
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style7" style="margin-left: 0px; margin-right: 0px;" Width="629px">
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

                    <asp:TemplateField HeaderText="Date Début">
                        <ItemTemplate>
                            <asp:Label ID="LabelDateDebut" Text='<%# Eval("DATE_DEBUT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                           
                            <asp:TextBox ID="txtDateDebut" type="date" CssClass="Tbox" runat="server" Text='<%# Eval("DATE_DEBUT") %>' placeholder="Date" ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDateDebutFooter" type="date" CssClass="Tbox" runat="server" placeholder="Date" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Date Fin">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("DATE_FIN") %>' runat="server" />
                        </ItemTemplate>

                        <EditItemTemplate>
                             <asp:TextBox ID="txtDateFin" type="date" CssClass="Tbox" runat="server" Text='<%# Eval("DATE_FIN") %>' placeholder="Date" ></asp:TextBox>
                            
                        </EditItemTemplate>

                        <FooterTemplate>
                              <asp:TextBox ID="txtDateFinFooter" type="date" CssClass="Tbox" runat="server" placeholder="Date" ></asp:TextBox>
                            
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
                <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="SupprimerTout" OnClientClick="return confirm('vous étes sur le point de supression de tous les Classes');"  runat="server" >Suppression de Tous Les Matieres</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
