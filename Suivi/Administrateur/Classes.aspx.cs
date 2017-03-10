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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListNiveau_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListNiveau.SelectedIndex == 0)
            {
                DSclasses.SelectCommand = "SELECT Niveau,ID_classe FROM Classe GROUP BY Niveau, ID_classe";
                Classes.DataBind();
            }
            else
            {
                DSclasses.SelectCommand = "SELECT Niveau,ID_classe FROM Classe WHERE Niveau=" + ListNiveau.SelectedValue + " GROUP BY Niveau, ID_classe";
            }
        }
    }
}
