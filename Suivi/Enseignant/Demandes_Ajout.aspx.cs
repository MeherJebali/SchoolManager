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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnAjouter_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String user = User.Identity.Name.ToString();
                String raison = Raisons.SelectedValue.ToString();
                String duree = txtDuree.Text;
                String date = Calendar.SelectedDate.ToString("dd/MM/yyyy");
                String cin = "";
                String nomEns = "";
                String datenotif = System.DateTime.Now.ToString();
                int etat = 0;
                SqlCommand cmd1 = new SqlCommand("Select CIN_ens,Prenom_ens + ' ' +Nom_ens AS Nom From Enseignant where Username_ens='"+user+"'",connection);
                try
                {
                    connection.Open();
                    SqlDataReader rd = cmd1.ExecuteReader();
                    while (rd.Read())
                    {
                        cin = rd.GetValue(0).ToString();
                        nomEns = rd.GetValue(1).ToString();
                    }
                    rd.Close();
                    SqlCommand cmd2 = new SqlCommand("Insert into Conge Values ('" + raison + "'," + duree + ",'" + date + "'," + etat + ",'" + cin + "')", connection);
                    cmd2.ExecuteNonQuery();
                    String msgNotif = "l\''enseignant " + nomEns + " a demandé un congé " +raison+ " d\''une durée de "+ duree + " jours à partir de " + date + "";
                    SqlCommand cmd3 = new SqlCommand("Insert into Notification Values('admin','"+msgNotif+"','"+datenotif+"',0)",connection);
                    cmd3.ExecuteNonQuery();
                    Response.Redirect("Index.aspx");
                    
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message.ToString());
                } 

            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Calendar.SelectedDate == null || Calendar.SelectedDate == new DateTime(0001, 1, 1, 0, 0, 0))// not click any date
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.DayOfWeek != DayOfWeek.Sunday) return;
            e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.Gray });
            e.Day.IsSelectable = false;
        }
    }
}
