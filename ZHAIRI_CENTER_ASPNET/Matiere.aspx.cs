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
    public partial class Matiere1 : System.Web.UI.Page
    {
        Connection C = new Connection();
        String CON = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";

        public void remplissageGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(CON))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Matiere", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridMatiere.DataSource = dtbl;
                GridMatiere.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridMatiere.DataSource = dtbl;
                GridMatiere.DataBind();
                GridMatiere.Rows[0].Cells.Clear();
                GridMatiere.Rows[0].Cells.Add(new TableCell());
                GridMatiere.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridMatiere.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridMatiere.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
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