﻿using System;
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

namespace Suivi.Enseignant
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        

        protected void changePass_Click(object sender, EventArgs e)
        {
            pup1.ShowPopupWindow();
        }

        protected void EditInfo_Click(object sender, EventArgs e)
        {
            String user = User.Identity.Name.ToString();
            SqlCommand cmd = new SqlCommand("Select Nom_ens,Prenom_ens,Tel_ens,Email_ens From Enseignant where Username_ens='"+user+"'",connection);
            try
            {
                connection.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    txtNom.Text = rd.GetValue(0).ToString();
                    txtPrenom.Text = rd.GetValue(1).ToString();
                    txtNumTel.Text = rd.GetValue(2).ToString();
                    txtEmail.Text = rd.GetValue(3).ToString();
                }
                rd.Close();
            }
            catch(SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            pup2.ShowPopupWindow();
        }
        protected void btnModifier_Click(object sender, EventArgs e)
        {
            String user = User.Identity.Name.ToString();
            String nom = txtNom.Text;
            String prenom = txtPrenom.Text;
            String tel = txtNumTel.Text;
            String email = txtEmail.Text;
            String chminphoto = "";
            String rqt = "";
            if (photo.HasFile)
            {
                photo.SaveAs(Server.MapPath("~\\img\\Avatar\\") + photo.FileName);
                chminphoto = "../img/Avatar/" + photo.PostedFile.FileName.ToString();
                rqt = "Update Enseignant SET Nom_ens = '" + nom + "',Prenom_ens = '" + prenom + "',Tel_ens = " + tel + ",Email_ens = '" + email + "',Photo_ens = '" + chminphoto + "' Where Username_ens='" + user + "'";
            }
            else
            {
                rqt = "Update Enseignant SET Nom_ens = '" + nom + "',Prenom_ens = '" + prenom + "',Tel_ens = " + tel + ",Email_ens = '" + email + "' Where Username_ens='" + user + "'";
            }
            SqlCommand modif = new SqlCommand(rqt,connection);
            try
            {
                connection.Open();
                modif.ExecuteNonQuery();
                Response.Redirect("Enseignant_Compte.aspx");
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            String user = User.Identity.Name.ToString();
            DSDetailsEns.SelectCommand = "Select Username_ens,CIN_ens,Prenom_ens + ' ' + Nom_ens AS NomP,Tel_ens,Email_ens,Photo_ens from Enseignant where Username_ens='" + user + "'";
        }
    }
}
