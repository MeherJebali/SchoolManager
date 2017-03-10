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
    public partial class WebForm37 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String IDeleve = "";
            String nomEleve = "";

            try
            {
                connection.Open();
                if (Request.QueryString["ID_eleve"] != null)
                {
                    IDeleve = Request.QueryString["ID_eleve"].ToString();
                    SqlCommand cmdeleve = new SqlCommand("SELECT [Prenom_eleve]+ ' ' + [Nom_eleve] as Eleve FROM [Eleve] WHERE [ID_eleve] = " + IDeleve, connection);
                    SqlDataReader rd = cmdeleve.ExecuteReader();
                    while (rd.Read())
                    {
                        nomEleve = rd.GetValue(0).ToString();
                    }
                    rd.Close();
                    lblNomEleve.Text = nomEleve;
                    //AfficherServices(IDeleve);
                }
                else
                {
                    DLServices.Visible = false;
                    btnSave.Visible = false;
                }

            }
            catch (SqlException ex)
            {
                Response.Write("erreur de connexion" + ex.Message.ToString());
            }
        }

        private void AfficherServices(String IDeleve)
        {
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String IDeleve = Request.QueryString["ID_eleve"].ToString();
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
        }

        protected void DLServices_DataBinding(object sender, EventArgs e)
        {
            String IDeleve = Request.QueryString["ID_eleve"].ToString();
            AfficherServices(IDeleve);
        }

        protected void DLServices_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            String IDeleve = Request.QueryString["ID_eleve"].ToString();
            AfficherServices(IDeleve);
        }
    }
}