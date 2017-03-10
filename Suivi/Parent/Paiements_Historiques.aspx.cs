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

namespace Suivi.Parent
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String mois = System.DateTime.Now.ToString("MMMM");
            lbl.Text = "Les Paiements de Dernier Mois ";
            if (GVPaiements.Rows.Count == 0)
            {
                lbl.Visible = false;
                btnSignaler.Visible = false;
            }
            if (GVPaiementsMois.Rows.Count == 0)
            {
                Label1.Visible = false;
            }
            try
            {
                connection.Open();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void btnSignaler_Click(object sender, EventArgs e)
        {
            pup1.ShowPopupWindow();
        }
        protected void btnEnvoyer_Click(object sender, EventArgs e)
        {
            String user = User.Identity.Name;
            String cin = "";
            String date = System.DateTime.Today.ToShortDateString();
            String objet = "Reclamation";
            String cat = Request.QueryString["ID_eleve"].ToString();
            String msg = txtMsg.Text;
            try
            {

                SqlCommand cmdCin = new SqlCommand("SELECT CIN_parent FROM Parent WHERE Username_parent='" + user + "'", connection);
                SqlDataReader rd = cmdCin.ExecuteReader();
                while (rd.Read())
                {
                    cin = rd.GetValue(0).ToString();
                }
                rd.Close();
                SqlCommand SendMsg = new SqlCommand("INSERT INTO Message(Emetteur_msg,Recepteur_msg,Objet_msg,Corps_msg,Date_msg,Etat_msg,Categorie_msg) VALUES('"+cin+"','admin','"+objet+"','"+msg+"','"+date+"',0,'"+cat+"')",connection);
                SendMsg.ExecuteNonQuery();
                pup1.HidePopupWindow();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }



        }
    }
}