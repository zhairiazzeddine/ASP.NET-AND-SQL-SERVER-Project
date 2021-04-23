<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Cours.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Cours" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/Style_TextBox.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 411px;
        }
        .auto-style2 {
            width: 411px;
            height: 22px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style5">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">
                </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold">
                
                Recherche Par Heure<br />
                <asp:Label ID="Label1" runat="server" Font-Size="X-Small" Text="Heure Début :"></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Font-Size="X-Small" Text="Heure Fin :"></asp:Label>
                <br />
                <asp:TextBox ID="TRHeureDebut" runat="server" Width="76px" CssClass="Tbox" placeholder="hh:mm"></asp:TextBox>
                &nbsp;<asp:TextBox ID="TRHeureFin" runat="server" Width="76px" CssClass="Tbox" placeholder="hh:mm"></asp:TextBox>
                <asp:ImageButton ID="Brechercher" runat="server" Height="18px" ImageUrl="~/Icons/Recherche.png" Width="18px" OnClick="Brechercher_Click" />
            </td>
            <td class="auto-style2">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold">
                <br />
                Recherche Par Jour<br />
                <asp:DropDownList ID="TRJour" runat="server" Height="23px" Width="164px" CssClass="Tbox" >
                    <asp:ListItem>Lundi</asp:ListItem>
                    <asp:ListItem>Mardi</asp:ListItem>
                    <asp:ListItem>Mercredi</asp:ListItem>
                    <asp:ListItem>Jeudi</asp:ListItem>
                    <asp:ListItem>Vendredi</asp:ListItem>
                    <asp:ListItem>Samedi</asp:ListItem>
                    <asp:ListItem>Dimanche</asp:ListItem>
                </asp:DropDownList>
                <asp:ImageButton ID="Brechercher2" runat="server" Height="18px" ImageUrl="~/Icons/Recherche.png" Width="18px" OnClick="Brechercher2_Click" />
                <br />
            </td>
            <td class="auto-style2">
                </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2" style="font-weight: bold; font-family: Arial, Helvetica, sans-serif">
                <br />
                Recherche Par Dureé<br />
                <asp:TextBox ID="TRDuree" runat="server" Width="164px" CssClass="Tbox" placeholder="hh:mm"></asp:TextBox>
                <asp:ImageButton ID="Brechercher0" runat="server" Height="18px" ImageUrl="~/Icons/Recherche.png" Width="18px" OnClick="Brechercher0_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold">
                <br />
                Recherche Par Professeur<br />
                <asp:DropDownList  ID="DropRProfesseur" CssClass="Tbox"  runat="server" Width="165px">
                </asp:DropDownList>
                <asp:ImageButton ID="Brechercher1" runat="server" Height="18px" ImageUrl="~/Icons/Recherche.png" Width="18px" OnClick="Brechercher1_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2" style="font-weight: bold; font-family: Arial, Helvetica, sans-serif">
                Recherche Par Classe<br />
                <asp:DropDownList ID="DropRClasse" CssClass="Tbox" runat="server" Width="165px">
                </asp:DropDownList>
                <asp:ImageButton ID="Brechercher3" runat="server" Height="18px" ImageUrl="~/Icons/Recherche.png" Width="18px" OnClick="Brechercher1_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:GridView ID="GridCours" runat="server" AutoGenerateColumns="false" ShowFooter="true" 
                    
               
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style7" style="margin-left: 0px" Width="767px">
                <%-- Theme Properties --%>
                
                <HeaderStyle BackColor="#3F3F3F" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <Columns>
                    <asp:TemplateField HeaderText="ID Professeur">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID_PROFESSEUR") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ID Classe">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID_CLASSE") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Heure Début">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("HEURE_DEBUT") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Heure Fin">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("HEURE_FIN") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>


                      <asp:TemplateField HeaderText="Jour">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("JOUR") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Dureé">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("DUREE") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br />
            <br />
                &nbsp;<span style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16.44px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Choisissez une tâche...</span></td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBAjouter" runat="server" href="GestionCours.aspx" Font-Size="Medium">Ajouter Cours</asp:LinkButton>
                <br />
                <asp:Image ID="Image3" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBModifier" runat="server" Font-Size="Medium">Modifier Cours</asp:LinkButton>
                <br />
                <asp:Image ID="Image4" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBSupprimer" runat="server">Supprimer Cours</asp:LinkButton>
                <br />
                <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBSupprimerTout" OnClientClick="return confirm('vous étes sur le point de supression de tous les Classes');"  runat="server" >Suppression de Tous Les Matieres</asp:LinkButton>
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
