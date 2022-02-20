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
    public partial class Utilisateur1 : System.Web.UI.Page
    {
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
        public void remplissageGridview() //methode pour remplir le GRIDView des Classe
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Utilisateur", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridUtilisateur.DataSource = dtbl;
                GridUtilisateur.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridUtilisateur.DataSource = dtbl;
                GridUtilisateur.DataBind();
                GridUtilisateur.Rows[0].Cells.Clear();
                GridUtilisateur.Rows[0].Cells.Add(new TableCell());
                GridUtilisateur.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridUtilisateur.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridUtilisateur.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                remplissageGridview();
                this.Title = "Gestion Utilisateurs";
            }

        }

        protected void GridUtilisateur_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Addnew")) // si le nom du Commande est"Addnew" le traitement sera ajouter
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    TextBox txtMotPasse = GridUtilisateur.FooterRow.FindControl("txtMotPasseFooter") as TextBox;
                    TextBox txtConfirmMotPasse = GridUtilisateur.FooterRow.FindControl("txtConfirmMotPasseFooter") as TextBox;
                    DropDownList DropPermission = GridUtilisateur.FooterRow.FindControl("txtPermissionFooter") as DropDownList;
                    if (txtMotPasse.Text.Equals(txtConfirmMotPasse.Text))
                    {
                        string query = "INSERT INTO Utilisateur (NOM,MOT_PASSE,PERMISSION) VALUES (@Nom,@MotPasse,@Permission)"; //la commande
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Nom", (GridUtilisateur.FooterRow.FindControl("txtNomFooter") as TextBox).Text); // parametres pour la commande
                        sqlCmd.Parameters.AddWithValue("@MotPasse", txtMotPasse.Text);// parametres pour la commande
                        sqlCmd.Parameters.AddWithValue("@Permission",DropPermission.SelectedItem.Text);// parametres pour la commande
                        sqlCmd.ExecuteNonQuery();
                        remplissageGridview();
                        LabelleMessageAffectetion.Text = "Ajout Effectuer";
                        LabelleMessageErreur.Text = "";
                    }
                   
                }
            }
        }

        protected void GridUtilisateur_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridUtilisateur.EditIndex = e.NewEditIndex;
            remplissageGridview();
        }

        protected void GridUtilisateur_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridUtilisateur.EditIndex = -1;
            remplissageGridview();
        }

        protected void GridUtilisateur_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Mise ajoure ou Modification d'un utilisateur
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                string query = "Update Utilisateur set MOT_PASSE=@MotPasse,PERMISSION=@Permission where NOM=@Nom";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@MotPasse", (GridUtilisateur.Rows[e.RowIndex].FindControl("txtMotPasse") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@Permission", (GridUtilisateur.Rows[e.RowIndex].FindControl("txtPermission") as DropDownList).Text); //exstraction des donneés depuis le gridview
                sqlCmd.Parameters.AddWithValue("@Nom", GridUtilisateur.DataKeys[e.RowIndex].Value.ToString());

                sqlCmd.ExecuteNonQuery();
                remplissageGridview();

                LabelleMessageAffectetion.Text = "Modification Effectuer";
                LabelleMessageErreur.Text = "";
            }
        }

        protected void GridUtilisateur_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //suppression d'une ligne ou Utilisateur
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Utilisateur WHERE NOM = @Nom";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Nom", GridUtilisateur.DataKeys[e.RowIndex].Value.ToString());
                    sqlCmd.ExecuteNonQuery();
                    remplissageGridview();
                    LabelleMessageAffectetion.Text = "1 ligne a été Supprimer !";
                    LabelleMessageErreur.Text = "";
                }
            }
            catch (Exception ex)
            {
                LabelleMessageAffectetion.Text = "";
                LabelleMessageErreur.Text = ex.Message;
            }
        }
    }
}