using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZHAIRI_CENTER_ASPNET
{
    public class Professeur
    {
        
        
            Connection con;
            int id;
            String prenom;
            String nom;
            char sex;
            String adresse;
            string numero_gsm;


            public Connection GetConnexion()
            {
                return con;
            }
            public int GetIdProf()
            {
                return id;
            }
            public Professeur()
            {

            }

            public Professeur(Connection Con)
            {
                this.con = Con;
            }

            public Professeur(int ID, Connection Con)
            {
                this.con = Con;
                this.id = ID;
            }
            public Professeur(String PRENOM, String NOM, char SEX, String ADRESSE, String NUMERO_GSM, Connection Con)
            {
                this.prenom = PRENOM;
                this.nom = NOM;
                this.sex = SEX;
                this.adresse = ADRESSE;
                this.numero_gsm = NUMERO_GSM;
                this.con = Con;
            }

            public Professeur(int ID, String PRENOM, String NOM, char SEX, String ADRESSE, String NUMERO_GSM, Connection CON)
            {
                this.id = ID;
                this.prenom = PRENOM;
                this.nom = NOM;
                this.sex = SEX;
                this.adresse = ADRESSE;
                this.numero_gsm = NUMERO_GSM;
                this.con = CON;
            }
            public Boolean Existance_Professeur()
            {
                if (con.Executer_Valeur("select count(*) from Professeur where ID='" + id + "'") == "0")
                    return false;
                else
                    return true;
            }

            public int Ajouter_Professeur()
            {
                return con.Executer("insert into Professeur values ('" + prenom + "','" + nom + "','" + sex + "','" + adresse + "','" + numero_gsm + "')");
            }
            public int Modifier_Professeur()
            {
                return con.Executer("update Professeur set PRENOM='" + prenom + "',NOM='" + nom + "', SEX='" + sex + "', ADRESSE='" + adresse + "', NUMERO_GSM='" + numero_gsm + "' where ID='" + id + "'");
            }
            public int Supprimer_Professeur()
            {
                return con.Executer("delete from Professeur where ID='" + id + "'");
            }
            public void Lister_Professeur()
            {
                con.Executer_Liste_Déconnecté("select * from Professeur");
            }
            public void Rehercher_Professeur_par_ID()
            {
                con.Executer_Liste_Déconnecté("select * from Professeur where ID='" + id + "'");
            }

    }
    
}