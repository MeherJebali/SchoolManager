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

namespace Suivi.Administrateur
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        String user = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvEnseignant_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            user = (String)e.Values["Nom d'utilisateur"].ToString();
        }

        protected void GvEnseignant_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Membership.DeleteUser(user, true);
        }
    }
}
