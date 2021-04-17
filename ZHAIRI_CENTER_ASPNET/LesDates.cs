using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZHAIRI_CENTER_ASPNET
{
    public class LesDates
    {
        int id;
        DateTime date_début;
        DateTime date_fin;
        Connection con;


        public Connection GetConnexion()
        {
            return con;
        }
        public int GetIdDate()
        {
            return id;
        }

        public LesDates()
        {

        }
        public LesDates(int ID, Connection CON)
        {
            this.id = ID;
            this.con = CON;
        }
        public LesDates(DateTime DATE_DEBUT, DateTime DATE_FIN, Connection CON)
        {
            this.date_début = DATE_DEBUT;
            this.date_fin = DATE_FIN;
            this.con = CON;
        }

        public Boolean Existance_DATE()
        {
            if (con.Executer_Valeur("select count(*) from LesDates where ID='" + id + "'") == "0")
                return false;
            else
                return true;
        }

        public int Ajouter_Date()
        {
            return con.Executer("insert into LesDates values ('" + date_début + "','" + date_fin + "')");
        }
        public int Modifier_Date()
        {
            return con.Executer("update LesDates set DATE_DEBUT='" + date_début + "',DATE_FIN='" + date_fin + "' where ID='" + id + "'");
        }
        public int Supprimer_Date()
        {
            return con.Executer("delete from LesDates where ID_DATE='" + id + "'");
        }
        public void Lister_Date()
        {
            con.Executer_Liste_Déconnecté("select * from LesDate");
        }
        public void Rechercher_Date_par_ID()
        {
            con.Executer_Liste_Déconnecté("select * from LesDate where ID='" + id + "'");
        }
        public void Rechercher_Date_par_Periode()
        {
            con.Executer_Liste_Déconnecté("select * from LesDate where DATE_DEBUT='" + date_début + "' and DATE_FIN='" + date_fin + "'");
        }
        public void Rechercher_Date_par_Periode2(DateTime D1, DateTime D2)
        {
            con.Executer_Liste_Déconnecté("select * from LesDate where DATE_DEBUT='" + date_début + "' between '" + D1 + "' and '" + D2 + "' ");
        }

    }
}