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
    public partial class WebForm34 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String mois = System.DateTime.Now.ToString("MMMM"); 
            lblMois.Text = "Les Paiements de Dernier Mois ";
            lblNonPayés.Text = "La Liste des élèves qui n'ont pas effectué leur paiements de dernier mois";
            try
            {
                connection.Open();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            if (ListNonPayes.Items.Count == 0)
            {
                ListNonPayes.Visible = false;
                lblNonPayés.Visible = false;
            }
        }

        protected void ListNonPayes_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            if (e.CommandName == "Alerter")
            {
                String cin = "";
                String nom = "";
                Label lblIDEleve = (Label)e.Item.FindControl("lblID");
                String Ideleve = lblIDEleve.Text;
                SqlCommand cmd = new SqlCommand("Select Prenom_eleve + ' ' + Nom_eleve as Nom, CIN_parent FROM Eleve WHERE ID_eleve = " + Ideleve, connection);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    nom = rd.GetValue(0).ToString();
                    cin = rd.GetValue(1).ToString();
                }
                rd.Close();
                String date = System.DateTime.Today.ToShortDateString();
                String mois = System.DateTime.Now.ToString("MMMM");
                String msgNotif = "Vous n''avez pas effectué votre paiement mensuel du "  +mois + " de l''élève "+nom;
                SqlCommand cmdNotif = new SqlCommand("Insert into Notification(Recepteur_notif,Texte_notif,Date_notif) Values ('" + cin + "','"+msgNotif+"','" + date + "')", connection);
                int x = (int) cmdNotif.ExecuteNonQuery();
                if (x != 0)
                {
                    lblSucces.ForeColor = Color.Green;
                    lblSucces.Text = "Parent alerté !";
                }
                 
            }
            Response.AddHeader("REFRESH", "1;URL=Paiements.aspx");
        }
    }
}
