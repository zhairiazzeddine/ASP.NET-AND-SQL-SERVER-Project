using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class ChangementMotPasse : System.Web.UI.Page
    {
        Connection C;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonEnregistrer_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();
            if (C.Connecter() == true)
            {
                if (C.Executer_Valeur("select count(*) from Utilisateur where NOM='" + Tnom.Text + "' and MOT_PASSE='" + Tmotpassactuel.Text + "'") == "0")//verification du mot passe et nom
                {
                    Label1.ForeColor = System.Drawing.Color.Orange;
                    Label1.Text = "Erreur de Nom Utilisateur Ou Le Mot de Passe";
                    
                }
                else
                {

                    if (TmotPasseNouveau.Text.Equals(TconfirmationMotpasse.Text))
                    {
                        C.Executer("update Utilisateur set MOT_PASSE='" + TmotPasseNouveau.Text + "' where NOM='" + Tnom.Text + "'");// changement du mot de passe
                        Label1.ForeColor = System.Drawing.Color.LightGreen;
                        Label1.Text = "Mot de Passe Changer avec Succeé";
                        
                    }
                    else
                    {
                        Label1.ForeColor = System.Drawing.Color.Orange;
                        Label1.Text = "Verifier Le Nouveau Mot de Passe ou Le MotPasse Actuel";
                    }
                }
            }

            C.Déconnecter();
        }
    }
}