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
    public partial class WebForm39 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID_msg"] != null)
            {
                String idmsg = Request.QueryString["ID_msg"].ToString();
                try
                {
                    connection.Open();
                    SqlCommand update = new SqlCommand("Update Message SET Etat_msg='True' WHERE Recepteur_msg='admin' AND ID_msg=" + idmsg, connection);
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