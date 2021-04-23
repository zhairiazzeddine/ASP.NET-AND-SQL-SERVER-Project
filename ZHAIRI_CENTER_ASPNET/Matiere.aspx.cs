using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class Matiere1 : System.Web.UI.Page
    {
        Connection C = new Connection(); //Connexion sql
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";

        public void remplissageGridview()
        {
            //Methode de remplissage GridView  des Matieres
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Matiere", sqlCon);
                sqlDa.Fill(dtbl); //remplissage de datatble par sqlDataAdapter
            }
            if (dtbl.Rows.Count > 0)
            {
                GridMatiere.DataSource = dtbl;
                GridMatiere.DataBind();
            }
            else
            {
                //si la table en base de donneé est Vide 
                dtbl.Rows.Add(dtbl.NewRow());
                GridMatiere.DataSource = dtbl;
                GridMatiere.DataBind();
                GridMatiere.Rows[0].Cells.Clear();
                GridMatiere.Rows[0].Cells.Add(new TableCell());
                GridMatiere.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridMatiere.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridMatiere.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                remplissageGridview(); //appele de la methode en "load"
                this.Title = "Gestion Matiere";
            }
        }

        protected void GridMatiere_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Ajout d'une Matiere
            try
            {
                if (e.CommandName.Equals("Addnew")) // si le nom de la commande GridView = "Addnew" donc le traitement d'ajout vas Executer
                {
                   using (SqlConnection sqlCon = new SqlConnection(CON))
                   {
                    sqlCon.Open();
                    string query = "INSERT INTO Matiere (LIBELLE,NIVEAU_SCOLAIRE,PRIX) VALUES (@Libelle,@Niveau_Scolaire,@Prix)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Libelle", (GridMatiere.FooterRow.FindControl("txtLibelleFooter") as TextBox).Text);// parametre SQL  depuis ligne footer
                        sqlCmd.Parameters.AddWithValue("@Niveau_Scolaire", (GridMatiere.FooterRow.FindControl("txtNiveauScolaireFooter") as TextBox).Text);//parametre SQL depuis ligne footer
                        sqlCmd.Parameters.AddWithValue("@Prix", (GridMatiere.FooterRow.FindControl("txtPrixFooter") as TextBox).Text.Trim());//parametre SQL depuis ligne footer

                        sqlCmd.ExecuteNonQuery();
                    remplissageGridview();
                    LabelleMessageAffectetion.Text = "Ajout Effectuer";
                    LabelleMessageErreur.Text = "";
                   }
                }
            }
            catch (Exception ex)
            {
                LabelleMessageAffectetion.Text = "";
                LabelleMessageErreur.Text = ex.Message;
            }
        }

        protected void GridMatiere_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
            GridMatiere.EditIndex = e.NewEditIndex;
            remplissageGridview();
            //Modification d'une ligne
        }

        protected void GridMatiere_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridMatiere.EditIndex = -1;
            remplissageGridview();
            //annulation de modification
        }

        protected void GridMatiere_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
                //enregistrement d'une modification sur la base de donnée
                    using (SqlConnection sqlCon = new SqlConnection(CON))
                    {
                        sqlCon.Open();
                        string query = "Update Matiere set LIBELLE=@Libelle,NIVEAU_SCOLAIRE=@Niveau_Scolaire,PRIX=@Prix where ID=@id";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Libelle", (GridMatiere.Rows[e.RowIndex].FindControl("txtLibelle") as TextBox).Text);
                        sqlCmd.Parameters.AddWithValue("@Niveau_Scolaire", (GridMatiere.Rows[e.RowIndex].FindControl("txtNiveau_Scolaire") as TextBox).Text);
                        sqlCmd.Parameters.AddWithValue("@Prix", (GridMatiere.Rows[e.RowIndex].FindControl("txtPrix") as TextBox).Text.Trim());
                       // sqlCmd.Parameters.AddWithValue("@id", (GridMatiere.Rows[e.RowIndex].FindControl("ID") as TextBox).Text);
                        sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridMatiere.DataKeys[e.RowIndex].Value.ToString()));

                        sqlCmd.ExecuteNonQuery();
                        remplissageGridview();
                         
                        LabelleMessageAffectetion.Text = "Modification Effectuer";
                        LabelleMessageErreur.Text = "";
                    }
                
           
        }

        protected void GridMatiere_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //suppression d'une Matiere
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Matiere WHERE ID = @id"; //Commande
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridMatiere.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    remplissageGridview();
                    LabelleMessageAffectetion.Text = "Selected Record Deleted";
                    LabelleMessageErreur.Text = "";
                }
            }
            catch (Exception ex)
            {
                LabelleMessageAffectetion.Text = "";
                LabelleMessageErreur.Text = ex.Message;
            }
        }


        private void Sauvegarder(String LIBBELE_MAT, String NIVEAU, String PRIX)
        {
            String query = "insert into Matiere values('" + LIBBELE_MAT + "','" + NIVEAU + "','" + PRIX + "')";
            String mycon = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //importation des données depuis fichier exel
            string path = Path.GetFileName(FileUpload.FileName);
            path = path.Replace(" ", "");
            FileUpload.SaveAs(Server.MapPath("~/Excel/") + path);// copier le fichier en dossier "Excel"
            String ExcelPath = Server.MapPath("~/Excel/") + path; //enregistrement du Chemin en dossier "Excel"
            String P2;
            OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");// connection Microsoft OleDb

            mycon.Open();
            OleDbCommand cmd = new OleDbCommand("select * from [MATIERE$]", mycon); // selectionner tous les colones depuis le classeur "MATIERE"
            OleDbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[3].ToString().Contains(','))// colone de prix
                {
                    P2 = dr[3].ToString().Replace(',', '.');// remplacement de vérgule par point pour sauvegarder le prix en float sur la BD
                    Sauvegarder(dr[1].ToString(), dr[2].ToString(), P2);
                }
                else
                {
                    Sauvegarder(dr[1].ToString(), dr[2].ToString(), dr[3].ToString());
                }

            }
            mycon.Close();

            LabelleMessageAffectetion.Text = "Donné importer avec succeé";
            remplissageGridview();

        }


        
    }
}