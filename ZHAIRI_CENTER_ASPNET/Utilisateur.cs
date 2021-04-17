using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZHAIRI_CENTER_ASPNET
{
    public class Utilisateur
    {
        String nom;
        String mot_passe;
        String permission;
        Connection con;


        public Connection GetConnexion()
        {
            return con;
        }
        public String GetUsername()
        {
            return nom;
        }
        public Utilisateur()
        {

        }
        public Utilisateur(String NOM_UTILISATEUR, Connection CON)
        {
            this.nom = NOM_UTILISATEUR;
            this.con = CON;
        }
        public Utilisateur(String NOM_UTILISATEUR, String MOT_PASSE, Connection CON)
        {
            this.nom = NOM_UTILISATEUR;
            this.mot_passe = MOT_PASSE;
            this.con = CON;
        }
        public Utilisateur(String NOM_UTILISATEUR, String MOT_PASSE, String PERMISSION, Connection CON)
        {
            this.nom = NOM_UTILISATEUR;
            this.mot_passe = MOT_PASSE;
            this.permission = PERMISSION;
            this.con = CON;
        }

        public Boolean Existance_Utilisateur()
        {
            if (con.Executer_Valeur("select count(*) from Utilisateur where NOM='" + nom + "'") == "0")
                return false;
            else
                return true;
        }

        public int Ajouter_Utilisateur()
        {
            return con.Executer("insert into Utilisateur (NOM,MOT_PASSE,PERMISSION) values ('" + nom + "','" + mot_passe + "','" + permission + "')");
        }
        public int Modifier_Utilisateur()
        {
            return con.Executer("update Utilisateur set NOM='" + nom + "',MOT_PASSE='" + mot_passe + "',PERMISSION='" + permission + "' where NOM='" + nom + "'");
        }
        public int Supprimer_Utilisateur()
        {
            return con.Executer("delete from Utilisateur where NOM='" + nom + "'");
        }
        public int Supprimer_Tou_Les_Utilisateurs()
        {
            return con.Executer("delete from Utilisateur");
        }
        public void Lister_Utilisateur()
        {
            con.Executer_Liste_Déconnecté("select * from Utilisateur");
        }
        public void Rechercher_Utilisateur_parnom_nom_utilisateur()
        {
            con.Executer_Liste_Déconnecté("select * from Utilisateur where NOM='" + nom + "'");
        }
    }
}