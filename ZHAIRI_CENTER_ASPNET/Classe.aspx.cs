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
    public partial class Classe : System.Web.UI.Page
    {
        Connection C = new Connection(); //connexion SQL
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";

        public void remplissageGridview() //methode pour remplir le GRIDView des Classe
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Classe", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridClasse.DataSource = dtbl;
                GridClasse.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridClasse.DataSource = dtbl;
                GridClasse.DataBind();
                GridClasse.Rows[0].Cells.Clear();
                GridClasse.Rows[0].Cells.Add(new TableCell());
                GridClasse.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridClasse.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridClasse.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                remplissageGridview(); // appele de la methode en évenement load
                this.Title = "Gestion Classes";
            }
        }

        protected void GridClasse_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Addnew")) // si le nom du Commande est"Addnew" le traitement sera ajouter
                {
                    using (SqlConnection sqlCon = new SqlConnection(CON))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO Classe (LIBELLE,SOUS_GROUPE) VALUES (@Libelle,@Sous_Groupe)"; //la commande
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Libelle", (GridClasse.FooterRow.FindControl("txtLibelleFooter") as TextBox).Text); // parametres pour la commande
                        sqlCmd.Parameters.AddWithValue("@Sous_Groupe", (GridClasse.FooterRow.FindControl("txtSous_GroupeFooter") as DropDownList).Text);// parametres pour la commande


                        sqlCmd.ExecuteNonQuery();
                        remplissageGridview();
                        LabelleMessageAffectetion.Text = "Ajout Effectuer";
                        LabelleMessageErreur.Text = "";
                    }
                }
            
        }

        protected void GridClasse_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridClasse.EditIndex = e.NewEditIndex;
            remplissageGridview();
        }

        protected void GridClasse_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridClasse.EditIndex = -1;
            remplissageGridview();
        }

        protected void GridClasse_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Mise ajoure ou Modification d'une Classe
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                string query = "Update Classe set LIBELLE=@Libelle,SOUS_GROUPE=@Sous_Groupe where ID=@id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Libelle", (GridClasse.Rows[e.RowIndex].FindControl("txtLibelle") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@Sous_Groupe", (GridClasse.Rows[e.RowIndex].FindControl("txtSous_Groupe") as DropDownList).Text); //exstraction des donneés depuis le gridview
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridClasse.DataKeys[e.RowIndex].Value.ToString()));

                sqlCmd.ExecuteNonQuery();
                remplissageGridview();

                LabelleMessageAffectetion.Text = "Modification Effectuer";
                LabelleMessageErreur.Text = "";
            }
        }

        protected void GridClasse_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //suppression d'une ligne ou Classe 
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Classe WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridClasse.DataKeys[e.RowIndex].Value.ToString()));
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
        private void Sauvegarder(String LIBBELE, char sous_gb)
        {
            // methode pour Sauvegarder le contenu d'un fichier excel en Base de donnée 
            String query = "insert into Classe values('" + LIBBELE + "','" + sous_gb + "')";
            String mycon = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        private void Sauvegarder_2(String LIBBELE)
        {
            // methode pour Sauvegarder le contenu d'un fichier excel en Base de donnée si La colone "SOUS_GROUPE" est Vide
            String query = "insert into Classe(LIBELLE) values('" + LIBBELE + "')";
            String mycon = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void Bimporter_Click(object sender, ImageClickEventArgs e)
        {
            // importation des données depuis fichier excel
            string path = Path.GetFileName(FileUpload.FileName);
            path = path.Replace(" ", "");
            FileUpload.SaveAs(Server.MapPath("~/Excel/") + path);
            String ExcelPath = Server.MapPath("~/Excel/") + path;
            Char Sous_GROUPE;
            OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");

            mycon.Open();
            OleDbCommand cmd = new OleDbCommand("select * from [CLASSE$]", mycon);
            OleDbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[1].ToString() == "")// colone "SOUS_GROUPE"
                    Sauvegarder_2(dr[0].ToString()); // appele de la 2éme methode de sauvegarde sans colone "SOUS_GROUPE"
                else
                {
                    Sous_GROUPE = Convert.ToChar(dr[1].ToString());
                    Sauvegarder(dr[0].ToString(), Sous_GROUPE);
                }
                
            }
            mycon.Close();

            LabelleMessageAffectetion.Text = "Donné importer avec succeé";
            remplissageGridview();
        }

        protected void SupprimerTout_Click(object sender, EventArgs e)
        {
            //Suppression de tous les Classe
            String chaine = "delete from Classe";
            String mycon = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = chaine;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}