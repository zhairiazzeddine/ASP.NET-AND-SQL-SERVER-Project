<%@ Page Title="" Language="C#" MasterPageFile="~/Page_Maitre.Master" AutoEventWireup="true" CodeBehind="Eleve.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Eleve1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Les Elèves
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/GridView.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
    <div>
        <br />
        <br />
 <asp:GridView ID="GridEleve" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowSorting="True"  >
     <Columns>
         
        

        
         <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
         <asp:BoundField DataField="ID_CLASSE" HeaderText="ID_CLASSE" SortExpression="ID_CLASSE" />
         <asp:BoundField DataField="PRENOM" HeaderText="PRENOM" SortExpression="PRENOM" />
         <asp:BoundField DataField="NOM" HeaderText="NOM" SortExpression="NOM" />
         <asp:BoundField DataField="DATE_NAISSANCE" HeaderText="DATE_NAISSANCE" SortExpression="DATE_NAISSANCE" />
         <asp:BoundField DataField="ADRESSE" HeaderText="ADRESSE" SortExpression="ADRESSE" />
         <asp:BoundField DataField="NUMERO_GSM" HeaderText="NUMERO_GSM" SortExpression="NUMERO_GSM" />
         <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
         <asp:BoundField DataField="SEX" HeaderText="SEX" SortExpression="SEX" />
         <asp:ImageField DataImageUrlField="PHOTO" HeaderText="PHOTO" >
             <ControlStyle Height="80px" Width="80px" />
         </asp:ImageField>
         
        

        
     </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
 </asp:GridView>
        <br />
&nbsp;&nbsp;&nbsp; Recherche Un Elève :
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZHAIRI_CENTER_DBConnectionString %>" SelectCommand="SELECT * FROM [Elève]"></asp:SqlDataSource>
        <span style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16.44px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
        <br />
        <br />
        &nbsp;&nbsp; Choisissez une tâche...</span><br />
&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBAjouter" runat="server" href="Gestion_Eleve.aspx" Font-Size="Medium">Ajouter Elève</asp:LinkButton>
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image3" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBModifier" runat="server" href="Gestion_Eleve.aspx" Font-Size="Medium">Modifier Elève</asp:LinkButton>
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image4" runat="server" Height="16px" ImageUrl="~/Icons/flesh.gif" Width="16px" />
               
                <asp:LinkButton ID="LBSupprimer" href="Gestion_Eleve.aspx" runat="server">Supprimer Elève</asp:LinkButton>
 </div>

</asp:Content>
