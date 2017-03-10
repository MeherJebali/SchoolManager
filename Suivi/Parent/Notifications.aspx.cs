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
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = User.Identity.Name.ToString();
            String cinp = "";
            SqlCommand cmd1 = new SqlCommand("SELECT CIN_parent FROM Parent WHERE Username_parent='" + user + "'", connection);
            try
            {
                connection.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                while (rd.Read())
                {
                    cinp = rd.GetValue(0).ToString();
                }
                rd.Close();
                DSNotifs.SelectCommand = "Select Date_notif AS Date,Texte_notif As Notification, Vu_notif From Notification Where Recepteur_notif='" + cinp + "'ORDER by Date_notif DESC";
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                txtTest.Text = GridView1.DataKeys[i].Value.ToString();
                GridView1.Rows[i].Cells[0].Font.Bold = !Convert.ToBoolean(txtTest.Text);
                GridView1.Rows[i].Cells[1].Font.Bold = !Convert.ToBoolean(txtTest.Text);
            }
            try
            {
                SqlCommand cmd = new SqlCommand("UPDATE Notification SET Vu_notif='True' WHERE Recepteur_notif='" + cinp + "'", connection);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex2)
            {
                Response.Write(ex2.Message.ToString());
            }

        }
    }
}
