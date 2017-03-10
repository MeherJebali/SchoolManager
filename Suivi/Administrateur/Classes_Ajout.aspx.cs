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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ListNiveau_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListNiveau.SelectedIndex == 0)
            {
                txtLibele.Enabled = false;
                txtLibele.Text = string.Empty;
            }
            else
            {
                
                txtLibele.Text = ListNiveau.SelectedValue.ToString();
                txtLibele.Enabled = true;
                txtLibele.Focus();
            }
            
        }

        protected void btnAjouter_Click(object sender, EventArgs e)
        {
            string ch = txtLibele.Text;
            string ch1 = ch.Substring(0, 1);
            SqlCommand check = new SqlCommand("Select Count(*) From Classe where ID_classe='" + txtLibele.Text.ToUpper() + "'", connection);
            String rqtAdd = ("INSERT INTO [Classe] VALUES ('" + txtLibele.Text.ToUpper() + "','" + ListNiveau.SelectedValue + "')");
            SqlCommand command = new SqlCommand(rqtAdd, connection);
            try
            {
                if (IsPostBack)
                {
                    if (ch1.Equals(ListNiveau.SelectedValue.ToString()))
                    {
                        lblIncomp.Text = string.Empty;
                        connection.Open();
                        int nbcheck = (int)check.ExecuteScalar();
                        if (nbcheck == 0)
                        {
                            command.ExecuteNonQuery();
                            Response.Redirect("Index.aspx");
                        }
                        else
                        {
                            lblIncomp.Text = string.Empty;
                            lblCheck.Text = "La classe : " + txtLibele.Text.ToUpper() + " existe déjà !";
                        }
                    }
                    else
                    {
                        lblCheck.Text = string.Empty;
                        lblIncomp.Text = "Incompatibilité entre le niveau et le libelle !";
                    }
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
