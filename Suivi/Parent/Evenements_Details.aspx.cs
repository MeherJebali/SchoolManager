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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnConfirmer_Click(object sender, EventArgs e)
        {
            String idEvent = Request.Params.Get("ID_event");
            String user = User.Identity.Name.ToString();
            String cinp = "";
            String nomP = "";
            String nomEvent= ""; 
            String date = System.DateTime.Today.ToString("dd/MM/yyyy");
            String nbrPlace = txtNbPlaces.Text;
            SqlCommand cmdCin = new SqlCommand("Select CIN_parent,Prenom_parent+' '+Nom_parent as NomP From Parent where Username_parent='" + user + "'", connection);
            SqlCommand libEvent = new SqlCommand("Select Lib_event from Evenement where ID_event="+idEvent,connection);
            try
            {
                SqlDataReader rd = cmdCin.ExecuteReader();
                while (rd.Read())
                {
                    cinp = rd.GetValue(0).ToString();
                    nomP = rd.GetValue(1).ToString();
                }
                rd.Close();
                SqlDataReader rd2 = libEvent.ExecuteReader();
                while (rd2.Read())
                {
                    nomEvent = rd2.GetValue(0).ToString();
                }
                rd2.Close();
                SqlCommand cmdAdd = new SqlCommand("INSERT INTO Reservation Values('"+cinp+"',"+idEvent+",'"+date+"',"+nbrPlace+")",connection);
                cmdAdd.ExecuteNonQuery();
                SqlCommand cmdEdit = new SqlCommand("UPDATE Evenement SET NbrParticipants_event = NbrParticipants_event+"+nbrPlace+" where ID_event="+idEvent, connection); 
                cmdEdit.ExecuteNonQuery();
                String msgnotif = "Le parent "+nomP+" a reservé "+nbrPlace+" places pour l evenement de "+nomEvent;
                SqlCommand cmdNotif = new SqlCommand("INSERT INTO Notification values ('admin','"+msgnotif+"','"+date+"',0)",connection);
                cmdNotif.ExecuteNonQuery();
                pup1.HidePopupWindow();
                Response.Redirect(Request.RawUrl);
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void EventDetails_ItemCommand(object source, DataListCommandEventArgs e)
        {
            String idEvent = Request.Params.Get("ID_event");
            String cinp = "";
            String nomP = "";
            String nbrPlacesRes = "";
            String nomEvent = ""; 
            String user = User.Identity.Name.ToString();
            String date = System.DateTime.Today.ToString("dd/MM/yyyy");
            if(e.CommandName=="reserver")
            {
                Button btn = (Button)e.Item.FindControl("btnReserver");
                if (btn.Text == "Réserver")
                {
                    pup1.ShowPopupWindow();
                    btn.Text = "Annuler";
                }
                else
                {
                    SqlCommand cmdCin = new SqlCommand("Select CIN_parent,Prenom_parent+' '+Nom_parent as NomP From Parent where Username_parent='" + user + "'", connection);
                    try
                    {
                        SqlDataReader rd = cmdCin.ExecuteReader();
                        while (rd.Read())
                        {
                            cinp = rd.GetValue(0).ToString();
                            nomP = rd.GetValue(1).ToString();
                        }
                        rd.Close();
                        SqlCommand cmdNbr = new SqlCommand("Select NbrPlaces_res From Reservation where CIN_parent='"+cinp+"' AND ID_event="+idEvent,connection);
                        SqlDataReader rd2 = cmdNbr.ExecuteReader();
                        while (rd2.Read())
                        {
                            nbrPlacesRes = rd2.GetValue(0).ToString();
                        }
                        rd2.Close();
                        SqlCommand cmdDel = new SqlCommand("Delete From Reservation Where CIN_parent='"+cinp+"' AND ID_event="+idEvent,connection);
                        cmdDel.ExecuteNonQuery();
                        SqlCommand cmdModif = new SqlCommand("Update Evenement SET NbrParticipants_event = NbrParticipants_event-" + nbrPlacesRes+" Where ID_event="+idEvent, connection);
                        cmdModif.ExecuteNonQuery();
                        SqlCommand libEvent = new SqlCommand("Select Lib_event from Evenement where ID_event=" + idEvent, connection);
                        SqlDataReader rd3 = libEvent.ExecuteReader();
                        while (rd3.Read())
                        {
                            nomEvent = rd3.GetValue(0).ToString();
                        }
                        rd3.Close();
                        String msgnotif = "Le parent " + nomP + " a annulé sa réservation de  " + nbrPlacesRes + " places pour l evenement de " + nomEvent;
                        SqlCommand cmdNotif = new SqlCommand("INSERT INTO Notification values ('admin','" + msgnotif + "','" + date + "',0)", connection);
                        cmdNotif.ExecuteNonQuery();
                        btn.Text = "Réserver";
                    }
                    catch (SqlException ex)
                    {
                        Response.Write(ex.Message.ToString());
                    }
                }
            }
        }

        protected void EventDetails_ItemCreated(object sender, DataListItemEventArgs e)
        {
            String idEvent = Request.Params.Get("ID_event");
            String user = User.Identity.Name.ToString();
            String cinp = "";
            SqlCommand cmdCin = new SqlCommand("Select CIN_parent From Parent where Username_parent='"+user+"'",connection);
            try
            {
                connection.Open();
                SqlDataReader rd = cmdCin.ExecuteReader();
                while(rd.Read())
                {
                    cinp = rd.GetValue(0).ToString();
                }
                rd.Close();
                SqlCommand cmd = new SqlCommand("Select Count(CIN_parent) from Reservation Where ID_event=" + idEvent + " AND CIN_parent='" + cinp + "'", connection);
                int x = (int)cmd.ExecuteScalar();
                Button btn = (Button)e.Item.FindControl("btnReserver");
                if (x == 0)
                {
                    btn.Text = "Réserver";
                }
                else
                {
                    btn.Text = "Annuler";
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
        protected void MycloseWindow(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
        
    }
}
