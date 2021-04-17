using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZHAIRI_CENTER_ASPNET
{
    public class Matiere
    {
        private int id;
        private String libelle;
        private String niveau_scolaire;
        private String prix;
        private Connection con;


        public Connection GetConnexion()
        {
            return con;
        }
        public int GetIdMat()
        {
            return id;
        }

        public Matiere()
        {

        }
        public Matiere(int ID, Connection CON)
        {
            this.id = ID;
            this.con = CON;
        }

        public Matiere(Connection CON)
        {
            this.con = CON;
        }
        public Matiere(String LIBELLE, String NIVEAU_SCAOLAIRE, String PRIX, Connection CON)
        {
            this.libelle = LIBELLE;
            this.niveau_scolaire = NIVEAU_SCAOLAIRE;
            this.prix = PRIX;
            this.con = CON;
        }

        public Matiere(int ID, String LIBELLE, String NIVEAU_SCAOLAIRE, String PRIX, Connection CON)
        {
            this.id = ID;
            this.libelle = LIBELLE;
            this.niveau_scolaire = NIVEAU_SCAOLAIRE;
            this.prix = PRIX;
            this.con = CON;
        }

        public Boolean Existance_Matiere()
        {
            if (con.Executer_Valeur("select count(*) from Matiere where ID='" + id + "'") == "0")
                return false;
            else
                return true;
        }

        public int Ajouter_Matiere()
        {
            return con.Executer("insert into Matiere values ('" + libelle + "','" + niveau_scolaire + "','" + prix + "')");
        }
        public int Modifier_Matiere()
        {
            return con.Executer("update Matiere set LIBELLE='" + libelle + "',NIVEAU_SCOLAIRE='" + niveau_scolaire + "',PRIX='" + prix + "' where ID='" + id + "'");
        }
        public int Supprimer_Matiere()
        {
            return con.Executer("delete from Matiere where ID='" + id + "'");
        }
        public void Lister_Matiere()
        {
            con.Executer_Liste_Déconnecté("select * from Matiere");
        }
        public void Rechercher_Matiere_par_Libelle()
        {
            con.Executer_Liste_Déconnecté("select * from Matiere where ID='" + id + "'");
        }

    }
}