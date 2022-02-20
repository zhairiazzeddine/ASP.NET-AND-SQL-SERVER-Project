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
    public partial class Reglement : System.Web.UI.Page
    {
       
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
        Connection C = new Connection();



        public void remplissageGridview()
        {
            //Methode de remplissage GridView  des Matieres
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select E.PRENOM,E.NOM,M.LIBELLE as Matiere,M.NIVEAU_SCOLAIRE as NiveauScolaire,M.PRIX from Elève E, Matiere M, Réglement R where E.ID=R.ID_ELEVE and M.ID=R.ID_MATIERE", sqlCon);
                sqlDa.Fill(dtbl); //remplissage de datatble par sqlDataAdapter
            }
            if (dtbl.Rows.Count > 0)
            {
                GridReg.DataSource = dtbl;
                GridReg.DataBind();
            }
            else
            {
                //si la table en base de donneé est Vide 
                dtbl.Rows.Add(dtbl.NewRow());
                GridReg.DataSource = dtbl;
                GridReg.DataBind();
                GridReg.Rows[0].Cells.Clear();
                GridReg.Rows[0].Cells.Add(new TableCell());
                GridReg.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridReg.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridReg.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                remplissageGridview();
            }
        }
    }
}