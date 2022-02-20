using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;

namespace ZHAIRI_CENTER_ASPNET
{
    public partial class Eleve : System.Web.UI.Page
    {
        Char sex;
        Connection C = new Connection();
        public void RemplissageDropClasse()
        {
            DropIDClasse.Items.Clear();
            C = new Connection();
            C.Connecter();
            C.dap2 = new SqlDataAdapter("select * from Classe", C.con);
            C.dap2.Fill(C.dst2, "id");
            DropIDClasse.DataSource = C.dst2.Tables["id"];
            DropIDClasse.DataTextField = "LIBELLE";
            DropIDClasse.DataValueField = "ID";
            DropIDClasse.DataBind();
            C.Déconnecter();
        }

        public void RemplissageDropID()
        {
            DropIDEleve.Items.Clear();
            C = new Connection();
            C.Connecter();
            C.dap = new SqlDataAdapter("select * from Elève", C.con);
            C.dap.Fill(C.dst, "id");
            DropIDEleve.DataSource = C.dst.Tables["id"];
            DropIDEleve.DataTextField = "PRENOM";
            DropIDEleve.DataValueField = "ID";
            DropIDEleve.DataBind();
            C.Déconnecter();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RemplissageDropID();
                RemplissageDropClasse();
            }
        }

        protected void Bajouter_Click(object sender, EventArgs e)
        {

            C = new Connection();
            C.Connecter();
            if (Tnom.Text == "" || Tprenom.Text == "" || TdateNaissance.Text == "" || Tadresse.Text == "" || Temail.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Verifier la saisie des champs');", true);
            }
            if (Tnum.Text.Length > 10 || Tnum.Text.Length < 10)
                Labelnum.Text = "*Numero Nom Valide";
            else
            {
                FileUploadPhoto.SaveAs(Server.MapPath("~/PHOTOS/") + Path.GetFileName(FileUploadPhoto.FileName));
                String Lien = "PHOTOS/" + Path.GetFileName(FileUploadPhoto.FileName);
                C.Executer("insert into Elève values ('" + DropIDClasse.SelectedItem.Value + "','" + Tprenom.Text + "','" + Tnom.Text + "','" + Convert.ToDateTime(TdateNaissance.Text) + "','" + Tadresse.Text + "','" + Tnum.Text + "','" + Temail.Text + "','" + sex + "','" + Lien + "')");
                LabelEtat.Text = "Ajout Effectuer";
                C.Déconnecter();


            }
            RemplissageDropClasse();

        }

    


        protected void RadioM_CheckedChanged(object sender, EventArgs e)
        {
            sex = 'M';
        }

        protected void RadioF_CheckedChanged(object sender, EventArgs e)
        {
            sex = 'F';
        }

        protected void Bmodifier_Click(object sender, EventArgs e)
        {
            C.Connecter();
            if (FileUploadPhoto.HasFile)
            {
                C = new Connection();
               
                if (Tnom.Text == "" || Tprenom.Text == "" || TdateNaissance.Text == "" || Tadresse.Text == "" || Temail.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Verifier la saisie des champs');", true);
                }
                else
                {
                    FileUploadPhoto.SaveAs(Server.MapPath("~/PHOTOS/") + Path.GetFileName(FileUploadPhoto.FileName));
                    String Lien = "PHOTOS/" + Path.GetFileName(FileUploadPhoto.FileName);
                   
                    C.Executer("update Elève set PRENOM='" + Tprenom.Text + "',NOM='" + Tnom.Text + "',DATE_NAISSANCE='" + Convert.ToDateTime(TdateNaissance.Text) + "', ADRESSE='" + Tadresse.Text + "', NUMERO_GSM='"+Tnum.Text+ "', EMAIL='" + Temail.Text + "', SEX='" + sex + "', PHOTO='" + Lien + "' where ID='" + DropIDEleve.SelectedItem.Value + "' and ID_CLASSE='" + DropIDClasse.SelectedItem.Value + "'");
                    LabelEtat.Text = "Modification Effectuer";
                    C.Déconnecter();


                }
            }
            else
            {
                
                C.Executer("update Elève set PRENOM='" + Tprenom.Text + "',NOM='" + Tnom.Text + "',DATE_NAISSANCE='" + Convert.ToDateTime(TdateNaissance.Text) + "', ADRESSE='" + Tadresse.Text + "', NUMERO_GSM='" + Tnum.Text + "', EMAIL='" + Temail.Text + "', SEX='" + sex + "' where ID='" + DropIDEleve.SelectedItem.Value + "' and ID_CLASSE='" + DropIDClasse.SelectedItem.Value + "'");
                LabelEtat.Text = "Modification Effectuer";
                C.Déconnecter();
            }
        }

        protected void BSUPPRIMER_Click(object sender, EventArgs e)
        {
            C = new Connection();
            C.Connecter();

            C.Executer("delete from Elève where ID= '" + DropIDEleve.SelectedItem.Value + "' and ID_CLASSE='" + DropIDClasse.SelectedItem.Value + "'");
            LabelEtat.Text = "Suppression Effectuer";
            RemplissageDropClasse();
            RemplissageDropID();
           
            C.Déconnecter();
        }
    }
}