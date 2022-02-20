using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class Accueil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection C = new Connection();
            C.Connecter();
            lblnBr.Text = C.Executer_Valeur("select Count(*) from Elève");
            lblnBrProf.Text = C.Executer_Valeur("select Count(*) from Professeur");
            lblnBrMat.Text = C.Executer_Valeur("select Count(*) from Matiere");
            lblnBrCla.Text= C.Executer_Valeur("select Count(*) from Classe");
            C.Déconnecter();


        }
    }
}