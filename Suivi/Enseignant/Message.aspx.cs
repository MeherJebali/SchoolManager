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

namespace Suivi.Enseignant
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID_msg"] != null)
            {
                String idmsg = Request.QueryString["ID_msg"].ToString();
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
                    SqlCommand update = new SqlCommand("Update Message SET Etat_msg='True' WHERE Recepteur_msg='" + cin + "' AND ID_msg=" + idmsg, connection);
                    update.ExecuteNonQuery();
                }

                catch (SqlException ex)
                {
                    Response.Write(ex.Message.ToString());
                }
            }
        }
    }
}