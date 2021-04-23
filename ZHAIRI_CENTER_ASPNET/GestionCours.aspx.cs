using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class GestionCours : System.Web.UI.Page
    {
        Connection C ;

        //public void RemplissageDropProf()
        //{
        //    DropIDProfesseur.Items.Clear();
        //    C = new Connection();
        //    C.Connecter();
        //    C.dap = new SqlDataAdapter("select * from Professeur", C.con);
        //    C.dap.Fill(C.dst, "id");
        //    DropIDProfesseur.DataSource = C.dst.Tables["id"];
        //    DropIDProfesseur.DataTextField = "NOM";
        //    DropIDProfesseur.DataValueField = "ID";
        //    DropIDProfesseur.DataBind();
        //    C.Déconnecter();
        //}

        public void RemplissageDropClasse()
        {
            DropIDClasse.Items.Clear();
            C = new Connection();
            C.Connecter();
            C.dap2 = new SqlDataAdapter("select * from Classe", C.con);
            C.dap2.Fill(C.dst2, "id");
            DropIDClasse.DataSource = C.dst2.Tables["id"];
            DropIDClasse.DataTextField = "LIBELLE";
            DropIDClasse.DataValueField = "ID";
            DropIDClasse.DataBind();
            C.Déconnecter();
        }

        public void RemplissageDropProf()
        {
            DropIDProfesseur.Items.Clear();
            C = new Connection();
            C.Connecter();
            C.dap = new SqlDataAdapter("select * from Professeur", C.con);
            C.dap.Fill(C.dst, "id");
            DropIDProfesseur.DataSource = C.dst.Tables["id"];
            DropIDProfesseur.DataTextField = "NOM";
            DropIDProfesseur.DataValueField = "ID";
            DropIDProfesseur.DataBind();
            C.Déconnecter();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                RemplissageDropProf();
                RemplissageDropClasse();
            }
            
        }
    }
}