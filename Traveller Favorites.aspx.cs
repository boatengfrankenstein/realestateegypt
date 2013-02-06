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

public partial class Traveller_Favorites : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.User.Identity.IsAuthenticated)
        {
            if (!this.IsPostBack)
            {
                RealStateDSTableAdapters.FlatsTableAdapter adapter = new RealStateDSTableAdapters.FlatsTableAdapter();
                RealStateDS.FlatsDataTable table = adapter.GetDataByUserName(this.User.Identity.Name.ToString());

                GridView1.DataSource = table;
                GridView1.DataBind();
            }
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Server.Transfer(string.Format("Flat Info.aspx?FlatID={0}", this.GridView1.SelectedValue.ToString()));
        }
        catch
        {
            this.Label1Error.Visible = true;
            this.Label1Error.Text = "Select a Flat First!";
        }
        finally
        {
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            RealStateDSTableAdapters.FlatsTableAdapter adapter = new RealStateDSTableAdapters.FlatsTableAdapter();
            adapter.DeleteFav(Convert.ToInt32(this.GridView1.SelectedValue.ToString()), this.User.Identity.Name);

            GridView1.DataSource = adapter.GetDataByUserName(this.User.Identity.Name);
            GridView1.DataBind();
        }
        catch
        {
            this.Label1Error.Visible = true;
            this.Label1Error.Text = "Select A Flat First!";
        }
        finally
        {
        }
    }
}