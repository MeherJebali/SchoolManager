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

namespace Suivi.Enseignant
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String cin = "";
            String user = User.Identity.Name;
            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select CIN_ens FROM Enseignant WHERE Username_ens='" + user + "'", connection);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    cin = rd.GetValue(0).ToString();
                }
                rd.Close();
                txtcin.Text = cin;
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            String date = System.DateTime.Today.ToShortDateString();
            String emeteur = txtcin.Text;

            String recepteur = ListParent.SelectedValue.ToString();
            String Objet = txtObjet.Text;
            String msg = txtMsg.Text;
            SqlCommand sendMsg = new SqlCommand("Insert INTO Message(Emetteur_msg,Recepteur_msg,Objet_msg,Corps_msg,Date_msg,Etat_msg) VALUES('" + emeteur + "','" + recepteur + "','" + Objet + "','" + msg + "','" + date + "',0)", connection);
            sendMsg.ExecuteNonQuery();
        }
    }
}