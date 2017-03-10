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

namespace Suivi.Parent
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            String cin = "";
            String user = User.Identity.Name;
            try
            {
                connection.Open();
                
                SqlCommand cmd = new SqlCommand("Select CIN_parent FROM Parent WHERE Username_parent='" + user + "'",connection);
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