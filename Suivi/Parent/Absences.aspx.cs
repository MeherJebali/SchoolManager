using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Suivi.Parent
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String cin = "";
            String user = User.Identity.Name;
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("Select CIN_parent FROM Parent WHERE Username_parent='" + user + "'", connection);
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
    }
}