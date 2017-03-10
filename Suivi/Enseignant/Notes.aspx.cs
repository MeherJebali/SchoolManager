using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Suivi.Enseignant
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        String CIN="";
        protected void Page_Load(object sender, EventArgs e)
        {   
            try
                {
                    connection.Open();
                    SqlCommand rqt = new SqlCommand("SELECT CIN_ens FROM [Enseignant] WHERE Username_ens ='" + User.Identity.Name + "'",connection);
                    SqlDataReader dr = rqt.ExecuteReader();
                    while (dr.Read())
                    {
                        CIN = dr.GetValue(0).ToString();
                    }
                    dr.Close();
                    txtCIN.Text = CIN;

                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message.ToString());
                }
            DSClasses.SelectCommand = "SELECT ID_classe FROM Enseigner WHERE (CIN_ens ='" + CIN +"')";
            //AfficherNotes();

        }

        private void AfficherNotes()
        {
            String matiere = ListeMatieres.SelectedValue;
            String trimestre = ListeTrimestre.SelectedValue;
            String note="";
            foreach (DataListItem L in DLEleves.Items)
            {
                String ID = ((Label)L.FindControl("lblID")).Text;
                SqlCommand cmd = new SqlCommand("SELECT COUNT(ID_eleve) FROM [Note] WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Trimestre ='" + trimestre + "'", connection);
                int x = (int)cmd.ExecuteScalar();
                if (x != 0)
                {
                    SqlCommand rqtNote = new SqlCommand("SELECT Valeur_note FROM [Note] WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Trimestre ='" + trimestre + "'", connection);
                    SqlDataReader drNote = rqtNote.ExecuteReader();
                    while (drNote.Read())
                    {
                        note = drNote.GetValue(0).ToString();
                    }
                    drNote.Close();
                    ((TextBox)L.FindControl("txtNote")).Text = note;
                }
                else
                {
                    ((TextBox)L.FindControl("txtNote")).Text = "0";
                }
            }
        }

        protected void ListeClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfficherNotes();
        }

        protected void ListeMatieres_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfficherNotes();
        }

        protected void ListeTrimestre_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfficherNotes();
        }

        protected void BtnEnregistrer_Click(object sender, EventArgs e)
        {
            //String test = "";
            String note = "";
            foreach (DataListItem L in DLEleves.Items)
            {
                
                    String matiere = ListeMatieres.SelectedValue;
                    String trimestre = ListeTrimestre.SelectedValue;
                    String ID = ((Label)L.FindControl("lblID")).Text;
                    TextBox txtnote = (TextBox)L.FindControl("txtNote");
                    note = txtnote.Text;
                    //SqlCommand rqtIns = new SqlCommand("IF NOT EXISTS(SELECT * FROM Absence WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Date_abs = '" + date + "') INSERT INTO Absence VALUES (" + matiere + "," + ID + ",'" + date + "')", connection);
                    //SqlCommand rqtIns = new SqlCommand("IF EXISTS (SELECT * FROM Note WHERE ID_eleve = 5 AND ID_mat = 2 AND Trimestre = 1) UPDATE [Note] SET Valeur_note =13.5 WHERE ID_eleve = 5 AND ID_mat = 2 AND Trimestre = 1", connection);
                    SqlCommand rqtIns = new SqlCommand("IF NOT EXISTS (SELECT * FROM [Note] WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Trimestre = " + trimestre + ")  INSERT INTO [Note] VALUES (" + matiere + "," + ID + "," + trimestre + ",'" + note + "') ELSE UPDATE [Note] SET Valeur_note = '" + note + "' WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Trimestre = " + trimestre, connection);
                    rqtIns.ExecuteNonQuery();
                    //test = test + ' ' + note;
            }
            //Response.Write(test);
            
        }

        protected void DLEleves_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            AfficherNotes();
        }
    }
}