using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Suivi.Parent
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID_eleve"] != null)
            {
                String IDEleve = Request.QueryString["ID_eleve"].ToString();
                txtID.Text = IDEleve;
            }
        }
    }
}