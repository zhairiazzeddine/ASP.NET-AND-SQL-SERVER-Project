<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="ZHAIRI_CENTER_ASPNET.Connexion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Styles/Connexion.css" rel="stylesheet" />
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
            <asp:Button Text="Connexion" CssClass="btnConnexion" runat="server"  /><br /><br /><br /><br />
            <asp:LinkButton Text="Changer Mot de Passe ?" CssClass="ChangerMotPasse" runat="server" href="" />

            </form>
    </div>
   
</body>
</html>
