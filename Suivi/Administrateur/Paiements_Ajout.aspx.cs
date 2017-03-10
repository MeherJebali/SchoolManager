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
    public partial class WebForm35 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                
            }
            catch (SqlException ex)
            {
                Response.Write("erreur de connexion"+ex.Message.ToString());
            }

        }

        protected void btnEnregistrer_Click(object sender, EventArgs e)
        {
            String IDeleve = ListEleves.SelectedValue;
            foreach (DataListItem L in DLServices.Items)
            {
                String ID = ((Label)L.FindControl("ID_service")).Text;
                String Cout = ((Label)L.FindControl("Cout")).Text;
                String date = System.DateTime.Today.ToString("dd/MM/yyyy");
                CheckBox chk = ((CheckBox)L.FindControl("CB"));
                if (chk.Checked)
                {
                    SqlCommand rqtIns = new SqlCommand("IF NOT EXISTS(SELECT * FROM Paiement WHERE ID_eleve = " + IDeleve + " AND ID_service = " + ID + " AND Date_paiement >= DateAdd(day, -29, GetDate())) INSERT INTO Paiement VALUES (" + ID + "," + IDeleve + "," + Cout + ",'" + date + "')", connection);
                    rqtIns.ExecuteNonQuery();

                }
                else
                {
                    SqlCommand rqtDel = new SqlCommand("IF EXISTS(SELECT * FROM Paiement WHERE ID_eleve = " + IDeleve + " AND ID_service = " + ID + " AND Date_paiement >= DateAdd(day, -29, GetDate())) DELETE FROM Paiement WHERE ID_eleve = " + IDeleve + " AND ID_service = " + ID + " AND Date_paiement >= DateAdd(day, -29, GetDate())", connection);
                    rqtDel.ExecuteNonQuery();
                }
            }

            lblmsg.ForeColor = Color.Green;
            lblmsg.Text = "Paiement Sauvegardé !";
            Response.AddHeader("REFRESH", "1;URL=Paiements.aspx");
        }
        private void AfficherServices()
        {
            String IDeleve = ListEleves.SelectedValue;
            foreach (DataListItem L in DLServices.Items)
            {
                String ID = ((Label)L.FindControl("ID_service")).Text;
                String Cout = ((Label)L.FindControl("Cout")).Text;
                String date = System.DateTime.Today.ToShortDateString();
                SqlCommand cmd = new SqlCommand("Select COUNT(*) FROM Paiement WHERE ID_service=" + ID + " AND ID_eleve=" + IDeleve + " AND Date_paiement >= DateAdd(day, -29, GetDate())", connection);
                int x = (int)cmd.ExecuteScalar();
                if (x != 0)
                {
                    ((CheckBox)L.FindControl("CB")).Checked = true;
                }
            }
        }

        protected void ListEleves_SelectedIndexChanged(object sender, EventArgs e)
        {
            DLServices.DataBind();
            AfficherServices();
        }

        protected void DLServices_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            AfficherServices();
        }
    }
}
