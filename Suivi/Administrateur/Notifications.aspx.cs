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
    public partial class WebForm27 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = User.Identity.Name.ToString();
            DSNotifs.SelectCommand = "Select Date_notif AS Date,Texte_notif As Notification, Vu_notif From Notification Where Recepteur_notif='" + user + "'ORDER by Date_notif DESC";
            for (int i = 0; i < GVNotif.Rows.Count; i++)
            {
                txtTest.Text = GVNotif.DataKeys[i].Value.ToString();
                GVNotif.Rows[i].Cells[0].Font.Bold = !Convert.ToBoolean(txtTest.Text);
                GVNotif.Rows[i].Cells[1].Font.Bold = !Convert.ToBoolean(txtTest.Text);
            }
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Notification SET Vu_notif='True' WHERE Recepteur_notif='admin'",connection);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                 Response.Write(ex.Message.ToString());
            }
        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            
        }
    }
}
