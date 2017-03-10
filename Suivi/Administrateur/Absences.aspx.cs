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
    public partial class WebForm33 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
            }
            catch (SqlException ex)
            {
                Response.Write("erreur de connexion"+ex.Message);
            }
        }

        protected void Calendrier_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.DayOfWeek != DayOfWeek.Sunday) return;
            e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.Gray });
            e.Day.IsSelectable = false;
        }

        protected void Calendrier_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendrier.SelectedDate.ToString("dd/MM/yyyy");
            DLAbsences.DataBind();
            AbsenesAffich();
            
        }
        private void AbsenesAffich()
        {
            String date = txtDate.Text;
            String matiere = ListMatieres.SelectedValue;
            foreach (DataListItem L in DLAbsences.Items)
            {
                String ID = ((Label)L.FindControl("lblID")).Text;
                SqlCommand cmd = new SqlCommand("Select count(ID_eleve) from [Absence] WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Date_abs ='" + date + "'", connection);
                int x = (int)cmd.ExecuteScalar();
                if (x != 0)
                {
                    ((CheckBox)L.FindControl("CBAbsence")).Checked = true;
                }
            }
        }

        protected void ListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                AbsenesAffich();
            }
        }

        protected void ListMatieres_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                AbsenesAffich();
            }
        }

        protected void BtnSauvegarder_Click(object sender, EventArgs e)
        {
            String date = txtDate.Text;
            String matiere = ListMatieres.SelectedValue;
            foreach (DataListItem L in DLAbsences.Items)
            {
                String ID = ((Label)L.FindControl("lblID")).Text;
                CheckBox chk = ((CheckBox)L.FindControl("CBAbsence"));
                if (chk.Checked)
                {
                    SqlCommand rqtIns = new SqlCommand("IF NOT EXISTS(SELECT * FROM Absence WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Date_abs = '" + date + "') INSERT INTO Absence VALUES (" + matiere + "," + ID +",'" + date + "')", connection);
                    rqtIns.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand rqtDel = new SqlCommand("IF EXISTS(SELECT * FROM Absence WHERE ID_eleve = " + ID + " AND ID_mat = " + matiere + " AND Date_abs = '" + date + "') DELETE FROM Absence WHERE ID_mat="+matiere+" AND ID_eleve="+ID+" AND Date_abs='"+date+"'", connection);
                    rqtDel.ExecuteNonQuery();
                }
            }
        }
    }
}
