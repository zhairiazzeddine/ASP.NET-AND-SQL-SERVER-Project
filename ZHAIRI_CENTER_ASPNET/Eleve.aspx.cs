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
    public partial class Eleve1 : System.Web.UI.Page
    {
        Connection C = new Connection();
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
        public void remplissageGridview() //methode pour remplir le GRIDView des Classe
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Elève", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                
                GridEleve.DataSource = dtbl;
                GridEleve.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridEleve.DataSource = dtbl;
                GridEleve.DataBind();
                GridEleve.Rows[0].Cells.Clear();
                GridEleve.Rows[0].Cells.Add(new TableCell());
                GridEleve.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridEleve.Rows[0].Cells[0].Text = "Pas d'enregistrement...!";
                GridEleve.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}