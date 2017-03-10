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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = User.Identity.Name.ToString();
            String cinens = "";
            SqlCommand cmd1 = new SqlCommand("SELECT CIN_ens FROM Enseignant WHERE Username_ens='"+user+"'",connection);
            try
            {
                connection.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                while (rd.Read())
                {
                    cinens = rd.GetValue(0).ToString();
                }
                rd.Close();
                DSConge.SelectCommand = "SELECT Raison_conge,Duree_conge,DateDebut_conge FROM Conge WHERE CIN_ens='"+cinens+"'";
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            
        }
    }
}
