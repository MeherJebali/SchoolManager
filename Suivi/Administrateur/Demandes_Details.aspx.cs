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
using System.Data.SqlClient;

namespace Suivi.Administrateur
{
    public partial class WebForm29 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        String idconge = "";
        String cinens = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID_conge"] != null)
            {
                idconge = Request.QueryString["ID_conge"].ToString();
            }
        }

        protected void btnConfirmer_Click(object sender, EventArgs e)
        {
            String date = System.DateTime.Today.ToString("dd/MM/yyyy");
            SqlCommand cmd1 = new SqlCommand("SELECT CIN_ens FROM Conge WHERE ID_conge="+idconge,connection);
            try
            {
                connection.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                while(rd.Read())
                {
                    cinens = rd.GetValue(0).ToString();
                }
                rd.Close();
                SqlCommand cmd2 = new SqlCommand("UPDATE Conge SET EtatDemande_conge='True' WHERE ID_conge=" + idconge, connection);
                cmd2.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand("Insert into Notification(Recepteur_notif,Texte_notif,Date_notif,Vu_notif) Values ('" + cinens + "','Votre demande de Congé a été confirmé ','" + date + "',0)", connection);
                cmd3.ExecuteNonQuery();
                
                Response.Redirect("Conges.aspx");
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void btnAnnuler_Click(object sender, EventArgs e)
        {
            String date = System.DateTime.Today.ToString("dd/MM/yyyy");
            SqlCommand cmd1 = new SqlCommand("SELECT CIN_ens FROM Conge WHERE ID_conge=" + idconge, connection);
            try
            {
                connection.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                while (rd.Read())
                {
                    cinens = rd.GetValue(0).ToString();
                }
                rd.Close();
                SqlCommand cmd2 = new SqlCommand("DELETE FROM Conge WHERE ID_conge=" + idconge, connection);
                cmd2.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand("Insert into Notification(Recepteur_notif,Texte_notif,Date_notif,Vu_notif) Values ('" + cinens + "','Votre demande de Congé a été Annulé ','" + date + "',0)", connection);
                cmd3.ExecuteNonQuery();

                Response.Redirect("Conges.aspx");
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
    }
}
