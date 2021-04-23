using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class Connexion : System.Web.UI.Page
    {
        Connection C;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "ZHAIRI CENTER - Connexion";
        }

        

        protected void BConnexion_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();
            if (C.Connecter() == true)
            {
                if (C.Executer_Valeur("select count(*) from Utilisateur where NOM='" + TnomUtilisateur.Text + "' and CONVERT(varchar(50),DecryptByPassPhrase('AAD8ED7707',MOT_PASS_Crypte))='" + TmotPasse.Text + "'") == "0")
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Connexion erroné vérifier le Username et le Password')</script>");
                }
                else
                {

                    Server.Transfer("Accueil.aspx");
                }
            }

            C.Déconnecter();
        }

       
    }
}