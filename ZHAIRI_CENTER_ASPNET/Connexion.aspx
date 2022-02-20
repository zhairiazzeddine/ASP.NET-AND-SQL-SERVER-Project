<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Connexion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> ZHAIRI CENTER - Connexion</title>
    <link href="Styles/Connexion.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="Icons/icon_Connexion.ico" />
</head>
<body>
    
        <div class="loginbox">
        
        <img src="Images/logo.png" alt="Alternate Text" class="LOGO"/>
        <h2>Connexion</h2><br />
        <form runat="server">
            <img src="Icons/Utilisateur.png" class="Utilisateur" /><br />
            <img src="Icons/MotPasse.png" class="MotPasse"/>
            <asp:TextBox  ID="TnomUtilisateur" runat="server" CssClass="TnomUtilisateur" placeholder="Nom Utilisateur"/><br />
            <asp:TextBox  ID="TmotPasse" runat="server" type="password" CssClass="TmotPasse" placeholder="********" /><br /><br /><br /><br /><br /><br />
            <asp:Button Text="Connexion" CssClass="btnConnexion" runat="server" ID="BConnexion" OnClick="BConnexion_Click"  /><br /><br /><br /><br />
            <asp:LinkButton Text="Changer Mot de Passe ?" CssClass="ChangerMotPasse" runat="server" href="ChangementMotPasse.aspx" ID="Link_ChangementMotPasse"  />

            </form>
    </div>
   
</body>
</html>
