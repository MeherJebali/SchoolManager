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
    public partial class WebForm14 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAjout_Click(object sender, EventArgs e)
        {
            String rqt = "Insert into Matiere Values('"+txtLibMat.Text+"',"+txtCoef.Text+")";
            SqlCommand cmd = new SqlCommand(rqt,connection);
            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("Index.aspx");
            }
            catch(SqlException ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}
