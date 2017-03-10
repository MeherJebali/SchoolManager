using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Drawing;
using System.Data.SqlClient;


namespace Suivi.Administrateur
{
    public partial class WebForm32 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAffecter_Click(object sender, EventArgs e)
        {
            String Enseignant = ListEnseignants.SelectedValue.ToString();
            String Classe = ListClasses.SelectedValue.ToString();
            String Matiere = ListMatieres.SelectedValue.ToString();
            String rqtAffectation = ("INSERT INTO [Enseigner] VALUES ('" + Enseignant + "','" + Classe + "'," + Matiere + ")");
            String rqtChercher = ("Select Count(*) From [Enseigner] Where ID_classe = '" + Classe + "' AND ID_mat = " + Matiere);
            SqlCommand ajout = new SqlCommand(rqtAffectation, connection);
            SqlCommand Chercher = new SqlCommand(rqtChercher, connection);
            try
            {
                connection.Open();
                int nbrAffectations = (int)Chercher.ExecuteScalar();
                if (nbrAffectations == 0)
                {
                    int nbr = (int)ajout.ExecuteNonQuery();
                    lblmsg.ForeColor = Color.Green;
                    lblmsg.Text = "Succès !";
                    Response.AddHeader("REFRESH", "1;URL=Enseignants_Affectation.aspx"); 
                }
                else
                {
                    lblmsg.ForeColor = Color.Red;
                    lblmsg.Text = "Cette affectation existe déjà !";
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
    }
}
