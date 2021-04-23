using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ZHAIRI_CENTER_ASPNET
{
    public class Connection
    {
        public SqlConnection con=new SqlConnection("data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;"); // con : variable de connexion 
        public SqlCommand cmd;
        public SqlDataAdapter dap = new SqlDataAdapter();
        public SqlDataAdapter dap2 = new SqlDataAdapter();
        public SqlDataAdapter dap3 = new SqlDataAdapter();
        public SqlDataAdapter dap4 = new SqlDataAdapter();

        public DataSet dst = new DataSet();
        public DataSet dst2 = new DataSet();
        public DataSet dst3 = new DataSet();
        public DataSet dst4 = new DataSet();

        public DataTable dt = new DataTable();
        public SqlDataReader dr;



        // accesseur et Modificateurs les get et les set
        //public SqlConnection SqlCon
        //{
        //    get { return con; } //lecture
        //    set { con = value; }//ecriture
        //}
        //public SqlCommand SqlCmd
        //{
        //    get { return cmd; }
        //    set { cmd = value; }
        //}
        //public SqlDataAdapter SqlDap
        //{
        //    get { return dap; }
        //    set { dap = value; }
        //}
        //public DataSet SqlDst
        //{
        //    get { return dst; }
        //    set { dst = value; }
        //}
        //public DataTable SqlDt
        //{
        //    get { return dt; }
        //    set { dt = value; }
        //}
        //public SqlDataReader SqlDr
        //{
        //    get { return dr; }
        //    set { dr = value; }
        //}

        //constructeur par initialisation 


        //Création d’une méthode de la classe Connexion permettant de se connecter à SQl Server
        public Boolean Connecter()
        {
            String chaine;
            try
            {
                chaine = "data source=LAPTOP-S2NMGFIQ\\SQLEXPRESS ; initial catalog = ZHAIRI_CENTER_DB ;integrated security=true;";
                con = new SqlConnection(chaine);
                con.Open();
                return true;

            }
            catch (Exception s)
            {
                return false;
            }
        }

        public Boolean Déconnecter()
        {
            try
            {
                con.Close();
                return true;
            }

            catch (Exception e)
            {

                return false;

            }
        }


        public int Executer(String chaine_sql)
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = chaine_sql;

            return cmd.ExecuteNonQuery();
        }

        public String Executer_Valeur(String chaine_sql)
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = chaine_sql;
            return cmd.ExecuteScalar().ToString();
        }

        public void Executer_Liste_Déconnecté(String chaine_sql)
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = chaine_sql;
            dap = new SqlDataAdapter(cmd);
            dst = new DataSet();
            dt = new DataTable();
            dap.Fill(dst, cmd.CommandText);
            dt = dst.Tables[chaine_sql];
        }

    }
}