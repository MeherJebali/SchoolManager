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

namespace Suivi.Enseignant
{
    public partial class Enseignant : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String date = System.DateTime.Now.Date.ToString("dd/MM/yyyy");
            lbldate.Text = "Aujourdhui le " + date;
        }
    }
}
