<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangementMotPasse.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.ChangementMotPasse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Styles/ChangementMoPasse.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="Icons/icon_Connexion.ico" />
</head>
<body>
    <div class="loginbox">
        <img src="Images/logo.png" alt="Alternate Text" class="logo"/>
        <h3>Modification Mot de Passe</h3><br /><br />
        <form runat="server" id="label">
            <asp:Label Text="Nom Utilisateur" CssClass="labelusername" runat="server" />
            <asp:TextBox  ID="Tnom" runat="server" CssClass="txtusername" placeholder="Username"/>
            <asp:Label Text="Mot de passe actuel"  CssClass="labelpassword" runat="server" />
            <asp:TextBox  ID="Tmotpassactuel" runat="server" type="password" CssClass="txtpassword" placeholder="********" />

            <asp:Label Text="Nouveau mot de passe"  CssClass="labelpassword" runat="server" />
            <asp:TextBox  ID="TmotPasseNouveau" runat="server" type="password" CssClass="txtpassword" placeholder="********" />

            <asp:Label Text="Confirmer mot de passe"  CssClass="labelpassword" runat="server" />
            <asp:TextBox  ID="TconfirmationMotpasse" runat="server" type="password" CssClass="txtpassword" placeholder="********" />

            <asp:Button Text="Enregistrer" CssClass="BTNenregistrer" runat="server" ID="ButtonEnregistrer" OnClick="ButtonEnregistrer_Click"   />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Smaller" ForeColor="Lime"></asp:Label>
            <br />
            <asp:LinkButton Text="Retour au Page Connexion" CssClass="btnchangermdps" runat="server" href="Connexion.aspx" ID="Link_RetourConnexion" />
            
            <br />

            
        </form>
    </div>
</body>
</html>
