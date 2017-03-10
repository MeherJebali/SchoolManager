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
    public partial class WebForm4 : System.Web.UI.Page
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
                Response.Write(ex.Message);
            }
        }

        protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
        {
            TextBox cintxt = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtCin") as TextBox;
            TextBox usernametxt = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName") as TextBox;
            TextBox nomtxt = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtNom") as TextBox;
            TextBox prenomtxt = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtPrenom") as TextBox;
            TextBox teltxt = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtNumTel") as TextBox;
            TextBox emailtxt = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email") as TextBox;
            Label lblcheck = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("lblCheck") as Label;
            FileUpload photo = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Photo") as FileUpload;
            String cin = cintxt.Text.ToString();
            String nomusername = usernametxt.Text.ToString();
            String nom = nomtxt.Text.ToString();
            String prenom = prenomtxt.Text.ToString();
            String tel = teltxt.Text.ToString();
            String email = emailtxt.Text.ToString();
            String chminphoto = "";
            if (photo.HasFile)
            {
                photo.SaveAs(Server.MapPath("~\\img\\Avatar\\") + photo.FileName);
                chminphoto = "../img/Avatar/" + photo.PostedFile.FileName.ToString();
            }
            SqlCommand check = new SqlCommand("Select Count(*) From Enseignant where CIN_ens='"+cin+"'",connection);
            String rqtAdd = ("INSERT INTO [Enseignant] VALUES ('" + cin + "','" + nomusername + "', '" + nom + "', '" + prenom + "', " + tel + ", '" + email + "','" + chminphoto + "')");
            SqlCommand command = new SqlCommand(rqtAdd, connection);
            try
            {
                int nbcheck = (int) check.ExecuteScalar();
                if (nbcheck == 0)
                {
                    command.ExecuteNonQuery();
                    Roles.AddUserToRole(nomusername, "Enseignant");
                }
                else
                {
                    lblcheck.Text = "l'esnseignant avec le CIN : "+cin+" existe déjà !";
                    e.Cancel = true;
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }


        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}
