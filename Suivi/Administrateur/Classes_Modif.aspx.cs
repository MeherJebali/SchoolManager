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
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ToRight_Click(object sender, EventArgs e)
        {
            String rqt = "UPDATE Eleve SET ID_classe='"+ListClasses.SelectedValue+"' WHERE ID_eleve="+ListNull.SelectedValue;
            SqlCommand MAJ = new SqlCommand(rqt,connection);
            try
            {
                connection.Open();
                ListAffect.Items.Add(ListNull.SelectedItem);
                ListNull.Items.Remove(ListNull.SelectedItem);
                ListAffect.SelectedIndex = -1;
                MAJ.ExecuteNonQuery();
                ToRight.Enabled = false;
                toLeft.Enabled = false;
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }


        }

        protected void toLeft_Click(object sender, EventArgs e)
        {
            String rqt = "UPDATE Eleve SET ID_classe=NULL WHERE ID_eleve=" + ListAffect.SelectedValue;
            SqlCommand MAJ = new SqlCommand(rqt, connection);
            try
            {
                connection.Open();
                ListNull.Items.Add(ListAffect.SelectedItem);
                ListAffect.Items.Remove(ListAffect.SelectedItem);
                ListNull.SelectedIndex = -1;
                MAJ.ExecuteNonQuery();
                toLeft.Enabled = false;
                ToRight.Enabled = false;
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void ListNull_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListNull.Items.Count != 0 && ListNull.SelectedIndex != -1)
                ToRight.Enabled = true;
            else
                toLeft.Enabled = false;
        }

        protected void ListAffect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListAffect.Items.Count != 0 && ListAffect.SelectedIndex != -1)
                toLeft.Enabled = true;
                
            else
                ToRight.Enabled = false;
        }
    }
}
