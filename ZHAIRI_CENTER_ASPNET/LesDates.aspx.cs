using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Diagnostics;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class LesDates1 : System.Web.UI.Page
    {
        
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";

        public void remplissageGridview() //methode pour remplir le GRIDView des Classe
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT ID,FORMAT (DATE_DEBUT, 'dd/MM/yyyy ') as DATE_DEBUT,FORMAT (DATE_FIN, 'dd/MM/yyyy ') as DATE_FIN from LesDates", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridDates.DataSource = dtbl;
                GridDates.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridDates.DataSource = dtbl;
                GridDates.DataBind();
                GridDates.Rows[0].Cells.Clear();
                GridDates.Rows[0].Cells.Add(new TableCell());
                GridDates.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridDates.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridDates.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                remplissageGridview();
                this.Title = "Gestion des Dates";
            }
        }

        protected void GridDates_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Addnew")) // si le nom du Commande est"Addnew" le traitement sera ajouter
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO LesDates (DATE_DEBUT,DATE_FIN) VALUES (@dateDebut,@DateFin)"; //la commande
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@dateDebut", (GridDates.FooterRow.FindControl("txtDateDebutFooter") as TextBox).Text); // parametres pour la commande
                    sqlCmd.Parameters.AddWithValue("@DateFin", (GridDates.FooterRow.FindControl("txtDateFinFooter") as TextBox).Text);// parametres pour la commande


                    sqlCmd.ExecuteNonQuery();
                    remplissageGridview();
                    LabelleMessageAffectetion.Text = "Ajout Effectuer";
                    LabelleMessageErreur.Text = "";
                }
            }
        }

        protected void GridDates_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridDates.EditIndex = e.NewEditIndex;
            remplissageGridview();
        }

        protected void GridDates_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridDates.EditIndex = -1;
            remplissageGridview();
        }

        protected void GridDates_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Mise ajoure ou Modification d'une Date
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                string query = "Update LesDates set DATE_DEBUT=@dateDebut,DATE_FIN=@dateFin where ID=@id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@dateDebut", (GridDates.Rows[e.RowIndex].FindControl("txtDateDebut") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@dateFin", (GridDates.Rows[e.RowIndex].FindControl("txtDateFin") as TextBox).Text); //exstraction des donneés depuis le gridview
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridDates.DataKeys[e.RowIndex].Value.ToString()));

                sqlCmd.ExecuteNonQuery();
                remplissageGridview();
               
                
                LabelleMessageAffectetion.Text = "Modification Effectuer";
                LabelleMessageErreur.Text = "";
            }
        }

        protected void GridDates_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //suppression d'une ligne ou Date 
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM LesDates WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridDates.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    remplissageGridview();
                    LabelleMessageAffectetion.Text = "une Date a été Supprimer";
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