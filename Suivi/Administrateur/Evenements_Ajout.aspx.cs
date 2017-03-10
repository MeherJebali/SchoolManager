using System;
using System.Collections;
using System.Collections.Generic;
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
    public partial class WebForm20 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            string[] tableau;
            List<string> result = new List<string>();
            String nomEvent = txtEvent.Text;
            String details = txtDetails.Text;
            DateTime d = new DateTime();
            d = Convert.ToDateTime(txtDate.Text);
            String dateEvent = d.ToShortDateString();
            String nbrPlaces = txtNombres.Text;
            String chminphoto = "";
            String date = System.DateTime.Now.ToString();
            String prix = txtPrix.Text;
            if (photo.HasFile)
            {
                photo.SaveAs(Server.MapPath("~\\img\\Avatar\\") + photo.FileName);
                chminphoto = "../img/Avatar/" + photo.PostedFile.FileName.ToString();
            }
            String rqtAdd = ("INSERT INTO [Evenement](Lib_event,Desc_event,Prix_event,Photo_event,Date_event,NbrPlaces_event,NbrParticipants_event) VALUES ('" + nomEvent + "','" + details + "'," + prix + ", '" + chminphoto + "', '" + dateEvent + "', " + nbrPlaces + ",'0')");
            SqlCommand ajout = new SqlCommand(rqtAdd,connection);
            try
            {
                connection.Open();
                ajout.ExecuteNonQuery();
                SqlCommand cmdCinP = new SqlCommand("Select CIN_parent FROM parent", connection);
                SqlDataReader rd = cmdCinP.ExecuteReader();
                while (rd.Read())
                {
                    result.Add(rd.GetString(0));
                }
                tableau = result.ToArray();
                rd.Close();
                foreach (String cin in tableau)
                {
                    String msgNotif = "un nouveau évènément "+nomEvent+" a été ajouté ";
                    SqlCommand cmdNotif = new SqlCommand("INSERT Into Notification Values('"+cin+"','"+msgNotif+"','"+date+"',0)",connection);
                    cmdNotif.ExecuteNonQuery();
                }
                Response.Redirect("Evenements.aspx");
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
    }
}
