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
    public partial class Professeur1 : System.Web.UI.Page
    {
        Connection C = new Connection();
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";

        public void remplissageGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Professeur", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridProfesseur.DataSource = dtbl;
                GridProfesseur.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridProfesseur.DataSource = dtbl;
                GridProfesseur.DataBind();
                GridProfesseur.Rows[0].Cells.Clear();
                GridProfesseur.Rows[0].Cells.Add(new TableCell());
                GridProfesseur.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridProfesseur.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridProfesseur.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
               
            if(!IsPostBack)
            {
                remplissageGridview();
                this.Title = "Gestion Professeur";
            }
        }

        protected void GridProfesseur_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Addnew"))
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO Professeur VALUES (@Prenom,@Nom,@Sex,@Adresse,@Numero_GSM)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Prenom", (GridProfesseur.FooterRow.FindControl("txtPrenomFooter") as TextBox).Text);
                    sqlCmd.Parameters.AddWithValue("@Nom", (GridProfesseur.FooterRow.FindControl("txtNomFooter") as TextBox).Text);
                    sqlCmd.Parameters.AddWithValue("@Adresse", (GridProfesseur.FooterRow.FindControl("txtAdresseFooter") as TextBox).Text);
                    sqlCmd.Parameters.AddWithValue("@Numero_GSM", (GridProfesseur.FooterRow.FindControl("txtnumero_gsmFooter") as TextBox).Text);
                    sqlCmd.Parameters.AddWithValue("@Sex", (GridProfesseur.FooterRow.FindControl("txtSexFooter") as DropDownList).Text);


                    sqlCmd.ExecuteNonQuery();
                    remplissageGridview();
                    LabelleMessageAffectetion.Text = "Ajout Effectuer";
                    LabelleMessageErreur.Text = "";
                }
            }
        }

        protected void GridProfesseur_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridProfesseur.EditIndex = e.NewEditIndex;
            remplissageGridview();
        }

        protected void GridProfesseur_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridProfesseur.EditIndex = -1;
            remplissageGridview();
        }

        protected void GridProfesseur_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                string query = "update Professeur set PRENOM=@Prenom,NOM=@Nom,SEX=@Sex,ADRESSE=@Adresse,NUMERO_GSM=@Numero_GSM where ID=@id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Prenom", (GridProfesseur.Rows[e.RowIndex].FindControl("txtPrenom") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@Nom", (GridProfesseur.Rows[e.RowIndex].FindControl("txtNom") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@Sex", (GridProfesseur.Rows[e.RowIndex].FindControl("txtSex") as DropDownList).Text);
                sqlCmd.Parameters.AddWithValue("@Adresse", (GridProfesseur.Rows[e.RowIndex].FindControl("txtAdresse") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@Numero_GSM", (GridProfesseur.Rows[e.RowIndex].FindControl("txtnumero_gsm") as TextBox).Text);
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridProfesseur.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                remplissageGridview();
                LabelleMessageAffectetion.Text = "Modification Effectuer";
                LabelleMessageErreur.Text = "";
            }
            
        }

        protected void GridProfesseur_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(CON))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Professeur WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridProfesseur.DataKeys[e.RowIndex].Value.ToString()));
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
        private void Sauvegarder(String PRENOM, String NOM, char SEX, String ADRESSE, String NUMERO_GSM)
        {
            String query = "insert into Professeur values('" + PRENOM + "','" + NOM + "','" + SEX + "','" + ADRESSE + "','" + NUMERO_GSM + "')";
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
            string path = Path.GetFileName(FileUpload.FileName);
            path = path.Replace(" ", "");
            FileUpload.SaveAs(Server.MapPath("~/Excel/") + path);
            String ExcelPath = Server.MapPath("~/Excel/") + path;
           
            OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");

            mycon.Open();
            OleDbCommand cmd = new OleDbCommand("select * from [PROFESSEUR$]", mycon);
            OleDbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
               
                    Sauvegarder(dr[0].ToString(), dr[1].ToString(), Convert.ToChar( dr[2].ToString()), dr[3].ToString(), dr[4].ToString());
            }

            
            mycon.Close();

            LabelleMessageAffectetion.Text = "Donné importer avec succeé";
            remplissageGridview();
        }

        protected void SupprimerTout_Click(object sender, EventArgs e)
        {
            String chaine = "delete from Professeur";
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
