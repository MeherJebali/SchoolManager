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
    public partial class WebForm16 : System.Web.UI.Page
    {
        SqlDataAdapter dadapter;
        DataSet dset;
        PagedDataSource adsource;
        SqlConnection connstring = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Scolarite.mdf;Integrated Security=True;User Instance=True");
        int pos;
        String rqt = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
            }
            pos = (int)this.ViewState["vs"];
            databind();
            if (dset.Tables[0].Rows.Count == 0)
            {
                Panel1.Visible = false;
            }
        }
        public void databind()
        {
            rqt = changer();
            dadapter = new SqlDataAdapter(rqt, connstring);
            dset = new DataSet();
            adsource = new PagedDataSource();
            dadapter.Fill(dset);
            adsource.DataSource = dset.Tables[0].DefaultView;
            adsource.PageSize = 8;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnfirst.Enabled = !adsource.IsFirstPage;
            btnprevious.Enabled = !adsource.IsFirstPage;
            btnlast.Enabled = !adsource.IsLastPage;
            btnnext.Enabled = !adsource.IsLastPage;
            DLEleve.DataSource = adsource;
            DLEleve.DataBind();
        }
        protected void btnfirst_Click(object sender, EventArgs e)
        {
            pos = 0;
            databind();
        }
        protected void btnprevious_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos -= 1;
            this.ViewState["vs"] = pos;
            databind();
        }
        protected void btnnext_Click(object sender, EventArgs e)
        {
            pos = (int)this.ViewState["vs"];
            pos += 1;
            this.ViewState["vs"] = pos;
            databind();
        }

        protected void btnlast_Click(object sender, EventArgs e)
        {
            pos = adsource.PageCount - 1;
            databind();
        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            changer();
        }

        private String changer()
        {
            if (txtSearch.Text != "")
            {
                return rqt = "select * from Eleve where Prenom_eleve like '" + txtSearch.Text + "%' or Nom_eleve like '" + txtSearch.Text + "%'";
            }
            else
            {
                return rqt = "select * from Eleve";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("test");
        }
    }
}
