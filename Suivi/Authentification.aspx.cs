using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Suivi
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String user1 = User.Identity.Name.ToString();
            if (User.Identity.IsAuthenticated)
            {
                if (Roles.IsUserInRole(user1, "Admin"))
                    Response.Redirect("~/Administrateur/Index.aspx");
                else if (Roles.IsUserInRole(user1, "Enseignant"))
                    Response.Redirect("~/Enseignant/Index.aspx");
                else
                    Response.Redirect("~/Parent/Index.aspx");
            }
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Login controlLogin = (Login)sender;
            MembershipUser user = (MembershipUser)Membership.GetUser(controlLogin.UserName);
            if (Roles.IsUserInRole(user.ToString(), "Admin"))
                Response.Redirect("~/Administrateur/Index.aspx");
            else if (Roles.IsUserInRole(user.ToString(), "Enseignant"))
                Response.Redirect("~/Enseignant/Index.aspx");
            else
                Response.Redirect("~/Parent/Index.aspx");
        }
    }
}
