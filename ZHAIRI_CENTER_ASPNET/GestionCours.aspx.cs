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

        protected void Bajouter_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();
            if (Theuredebut.Text == "" || TheureFin.Text == "" || Tduree.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Verifier la saisie des champs');", true);
            }
            else
            {
                C.Executer("insert into Donner_Cours values ('" + Convert.ToInt32( DropIDProfesseur.SelectedItem.Value) + "','" + Convert.ToInt32(DropIDClasse.SelectedItem.Value) + "','" + Convert.ToDateTime(Theuredebut.Text) + "','" + Convert.ToDateTime(TheureFin.Text) + "','" + DropJour.Text + "','" + Convert.ToDateTime(Tduree.Text) + "')");
                LabelEtat.Text = "Ajout Effectuer";
                C.Déconnecter();
                

            }
            RemplissageDropClasse();
            RemplissageDropProf();

        }

        protected void Bmodifier_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();
            if (Theuredebut.Text == "" || TheureFin.Text == "" || Tduree.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Verifier la saisie des champs');", true);
            }
            else
            {
                C.Executer("update Donner_Cours set HEURE_DEBUT='" + Convert.ToDateTime(Theuredebut.Text) + "',HEURE_FIN='" + Convert.ToDateTime(TheureFin.Text) + "',JOUR='" + DropJour.Text + "', DUREE='" + Convert.ToDateTime(Tduree.Text) + "' where ID_PROFESSEUR='"+DropIDProfesseur.SelectedItem.Value+ "' and ID_CLASSE='"+DropIDClasse.SelectedItem.Value+"'");
                LabelEtat.Text = "Modification Effectuer";
                C.Déconnecter();


            }
        }

        protected void BTNremplissage_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();
            if (C.dt.Rows != null)
            {
                C.dt.Clear();
            }
            C.cmd = new SqlCommand();
            C.cmd.CommandText = "select * from Donner_Cours where ID_CLASSE='"+DropIDClasse.SelectedItem.Value+"' and ID_PROFESSEUR='"+DropIDProfesseur.SelectedItem.Value+"'";
            C.cmd.Connection = C.con;
            C.dr = C.cmd.ExecuteReader();

            while (C.dr.Read())
            {
                Theuredebut.Text = C.dr.GetValue(2).ToString();
                TheureFin.Text = C.dr.GetValue(3).ToString();
                DropJour.ClearSelection();
                switch ( C.dr.GetValue(4).ToString())
                {
                    case "Lundi" :
                        DropJour.Items.FindByText("Lundi").Selected = true;
                        break;
                    case "Mardi":
                        DropJour.Items.FindByText("Mardi").Selected = true;
                        break;
                    case "Mercredi":
                        DropJour.Items.FindByText("Mercredi").Selected = true;
                        break;
                    case "Jeudi":
                        DropJour.Items.FindByText("Jeudi").Selected = true;
                        break;
                    case "Vendredi":
                        DropJour.Items.FindByText("Vendredi").Selected = true;
                        break;
                    case "Samedi":
                        DropJour.Items.FindByText("Samedi").Selected = true;
                        break;
                    case "Dimanche":
                        DropJour.Items.FindByText("Dimanche").Selected = true;
                        break;

                }
                Tduree.Text = C.dr.GetValue(5).ToString();



            }
            RemplissageDropClasse();
            RemplissageDropProf();
            C.Déconnecter();
        }

        protected void Bsupprimer_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();
            
                C.Executer("delete from Donner_Cours where ID_PROFESSEUR= '" + DropIDProfesseur.SelectedItem.Value + "' and ID_CLASSE='" + DropIDClasse.SelectedItem.Value+ "'");
                LabelEtat.Text = "Suppression Effectuer";
            RemplissageDropClasse();
            RemplissageDropProf();
                C.Déconnecter();
            
        }
    }
}