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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        String[] TabDays = new String[7];
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand rqtMsg = new SqlCommand("Select count(*) from Message WHERE Recepteur_msg='admin' AND Etat_msg='False'", connection);
            SqlCommand rqtEvent = new SqlCommand("Select count(*) from Evenement", connection);
            SqlCommand rqtConge = new SqlCommand("Select count(*) from Conge WHERE EtatDemande_conge='False'", connection);
            SqlCommand rqtParent = new SqlCommand("Select count(*) from Parent", connection);
            SqlCommand rqtEns = new SqlCommand("Select count(*) from Enseignant", connection);
            SqlCommand rqtEleve = new SqlCommand("Select count(*) from Eleve", connection);
            SqlCommand rqtClasse = new SqlCommand("Select count(*) from Classe", connection);
            SqlCommand rqtMatiere = new SqlCommand("Select count(*) from Matiere", connection);
            SqlCommand rqtPaiement = new SqlCommand("Select count(*) from Paiement WHERE Date_paiement >= DateAdd(day, -29, GetDate())", connection);
            SqlCommand rqtService = new SqlCommand("Select count(*) from Service", connection);
            try
            {
                connection.Open();
                int nbMsg = (int)rqtMsg.ExecuteScalar();
                int nbEvent = (int)rqtEvent.ExecuteScalar();
                int nbConge = (int)rqtConge.ExecuteScalar();
                int nbParent = (int)rqtParent.ExecuteScalar();
                int nbEns = (int)rqtEns.ExecuteScalar();
                int nbEleve = (int)rqtEleve.ExecuteScalar();
                int nbClasses = (int)rqtClasse.ExecuteScalar();
                int nbMatiere = (int)rqtMatiere.ExecuteScalar();
                int nbPaiement = (int)rqtPaiement.ExecuteScalar();
                int nbService = (int)rqtService.ExecuteScalar();


                lblNbMsg.Text = nbMsg.ToString();
                lblNbEvent.Text = nbEvent.ToString();
                lblNbConge.Text = nbConge.ToString();
                lblNbParent.Text = nbParent.ToString();
                lblNbEns.Text = nbEns.ToString();
                lblNbEleve.Text = nbEleve.ToString();
                lblNbClasse.Text = nbClasses.ToString();
                lblNbMatiere.Text = nbMatiere.ToString();
                lblNbPaiement.Text = nbPaiement.ToString();
                lblNbService.Text = nbService.ToString();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            SqlCommand rqt = new SqlCommand();
            rqt.Connection = connection;
            this.Chart1.Series[0]["PieLabelStyle"] = "Outside";
            //this.Chart1.Legends.Add("My Legend Text");            
            // Set these other two properties so that you can see the connecting lines
            this.Chart1.Series[0].BorderWidth = 1;
            this.Chart1.Series[0].BorderColor = System.Drawing.Color.FromArgb(26, 59, 105);
            // Set the pie label as well as legend text to be displayed as percentage
            // The P2 indicates a precision of 2 decimals
            this.Chart1.Series[0].Label = "#PERCENT{P2}";
            //this.Chart1.Series[0].Label = "#PERCENT";
            this.Chart1.Series[0].LegendText = "#VALX";
            this.Chart2.Series[0].Label = "#PERCENT{P2}";
            this.Chart2.Series[0].LegendText = "#VALX";
            for (int i = 0; i < 7; i++)
            {
                TabDays[i] = System.DateTime.Today.AddDays(-i).ToShortDateString();
                rqt.CommandText = "SELECT COUNT(*) FROM [Absence] WHERE Date_abs = '" + TabDays[i] + "'";
                int nbr = (int)rqt.ExecuteScalar();
                this.Chart3.Series[0].Points.AddXY(TabDays[i], nbr);
            }
        }
    }
}
