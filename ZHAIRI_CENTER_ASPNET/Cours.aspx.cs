using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class Cours : System.Web.UI.Page
    {
        Connection C = new Connection();
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";

        public void remplissageGridview()
        {
            //methode de remplissage GridView
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Donner_Cours" , sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
                GridCours.Rows[0].Cells.Clear();
                GridCours.Rows[0].Cells.Add(new TableCell());
                GridCours.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridCours.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridCours.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        public void RemplissageDropClasse()
        {
            //methode de Remplissage DropDownList de Classe
            DropRClasse.Items.Clear();
           
            C.Connecter();
            C.dap3 = new SqlDataAdapter("select * from Classe", C.con);
            C.dap3.Fill(C.dst3, "id");
            DropRClasse.DataSource = C.dst3.Tables["id"];
            DropRClasse.DataTextField = "LIBELLE"; // libelle qui vas afficher au utilisateur
            DropRClasse.DataValueField = "ID";// mais on traville par ID en programme
            DropRClasse.DataBind();// remplissage
            C.Déconnecter();
        }

        public void RemplissageDropProf()
        {
            //methode de Remplissage DropDownList de Professeur
            DropRProfesseur.Items.Clear();
            
            C.Connecter();
            C.dap4 = new SqlDataAdapter("select * from Professeur", C.con);
            C.dap4.Fill(C.dst4, "id");
            DropRProfesseur.DataSource = C.dst4.Tables["id"];
            DropRProfesseur.DataTextField = "NOM";// Le Nom qui vas afficher pour l'utilisateur 
            DropRProfesseur.DataValueField = "ID"; // et on travaille par ID en programme
            DropRProfesseur.DataBind();
            C.Déconnecter();
        }
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //appele des methodes en evenement load
                RemplissageDropProf();
                RemplissageDropClasse();
                remplissageGridview();
                
                this.Title = "Gestion des Cours";
               

            }
        }

        protected void GridCours_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           

            //if (e.CommandName.Equals("Addnew"))
            //{
            //    using (SqlConnection sqlCon = new SqlConnection(CON))
            //    {
            //        sqlCon.Open();
            //        string query = "INSERT INTO Classe (LIBELLE,SOUS_GROUPE) VALUES (@Libelle,@Sous_Groupe)";
            //        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            //        sqlCmd.Parameters.AddWithValue("@Libelle", (GridClasse.FooterRow.FindControl("txtLibelleFooter") as TextBox).Text);
            //        sqlCmd.Parameters.AddWithValue("@Sous_Groupe", (GridClasse.FooterRow.FindControl("txtSous_GroupeFooter") as DropDownList).Text);


            //        sqlCmd.ExecuteNonQuery();
            //        remplissageGridview();
            //        LabelleMessageAffectetion.Text = "Ajout Effectuer";
            //        LabelleMessageErreur.Text = "";
            //    }
            //}
        }

        protected void Brechercher_Click(object sender, ImageClickEventArgs e)
        {
            //recherche par horaires
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Donner_Cours where HEURE_DEBUT='"+Convert.ToDateTime(TRHeureDebut.Text)+ "' and HEURE_FIN='"+ Convert.ToDateTime(TRHeureFin.Text) + "'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
            }
            else
            {
                //si la table est vide ou les variables de recherche n'est pas trouvé
                dtbl.Rows.Add(dtbl.NewRow());
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
                GridCours.Rows[0].Cells.Clear();
                GridCours.Rows[0].Cells.Add(new TableCell());
                GridCours.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridCours.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridCours.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void Brechercher2_Click(object sender, ImageClickEventArgs e)
        {
            //recherche par Jour
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Donner_Cours where JOUR='"+TRJour.Text+"'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
            }
            else
            {
                //si la table est vide ou les variables de recherche n'est pas trouvé
                dtbl.Rows.Add(dtbl.NewRow());
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
                GridCours.Rows[0].Cells.Clear();
                GridCours.Rows[0].Cells.Add(new TableCell());
                GridCours.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridCours.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridCours.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void Brechercher0_Click(object sender, ImageClickEventArgs e)
        {
            //recherche par Dureé
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Donner_Cours where DUREE='" + Convert.ToDateTime(TRDuree.Text) + "'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
            }
            else
            {
                //si la table est vide ou les variables de recherche n'est pas trouvé
                dtbl.Rows.Add(dtbl.NewRow());
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
                GridCours.Rows[0].Cells.Clear();
                GridCours.Rows[0].Cells.Add(new TableCell());
                GridCours.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridCours.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridCours.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void Brechercher1_Click(object sender, ImageClickEventArgs e)
        {
            //recherche par Professeur
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Donner_Cours where ID_PROFESSEUR='" + Convert.ToInt32( DropRProfesseur.SelectedItem.Value) + "'", sqlCon); //on cherche ici par ID mais l'utilisateur Voir que les nom des professeur
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
            }
            else
            {
                //si la table est vide ou les variables de recherche n'est pas trouvé
                dtbl.Rows.Add(dtbl.NewRow());
                GridCours.DataSource = dtbl;
                GridCours.DataBind();
                GridCours.Rows[0].Cells.Clear();
                GridCours.Rows[0].Cells.Add(new TableCell());
                GridCours.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridCours.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridCours.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
    }
}