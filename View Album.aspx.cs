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
using System.Data.OleDb;

public partial class View_Album : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = this.Request.QueryString.ToString();
        int index = query.IndexOf('=');
        query = query.Substring(index + 1);
        int FlatID = Convert.ToInt32(query);

        string UserName;

        OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["RealEstate"].ConnectionString);
        OleDbCommand cmd = new OleDbCommand(String.Format("SELECT UserName FROM Flats WHERE FlatID = {0}", FlatID), conn);
        cmd.Connection = conn;

        conn.Open();
        UserName = cmd.ExecuteScalar().ToString();
        conn.Close();

        if (this.User.Identity.Name == UserName || this.User.IsInRole("Manager") || this.User.IsInRole("Operator"))
        {
            this.ButtonDeleteRecord.Visible = true;
        }
        else
        {
            this.ButtonDeleteRecord.Visible = false;
        }

    }

    protected void ButtonDeleteRecord_Click(object sender, EventArgs e)
    {
        Image MyImage = (Image)this.DetailsView1.FindControl("Image1");
        Tools T = new Tools();
        string ImageName = MyImage.ImageUrl;
        if (MyImage.ImageUrl != null)
        {
            int index = MyImage.ImageUrl.LastIndexOf('/');
            ImageName = MyImage.ImageUrl.Substring(index + 1);
            T.DeleteFile(ImageName);
        }

        string query = this.Request.QueryString.ToString();
        int CharIndex = query.IndexOf('=');
        query = query.Substring(++CharIndex);
        int FlatID = Convert.ToInt32(query);

        RealStateDSTableAdapters.FlatsTableAdapter A = new RealStateDSTableAdapters.FlatsTableAdapter();
        A.DeletePicture(FlatID, ImageName);

        this.DetailsView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string query = this.Request.QueryString.ToString();
        int index = query.IndexOf('=');
        query = query.Substring(++index);
        int FlatID = Convert.ToInt32(query);
        Server.Transfer(String.Format("Flat Info.aspx?FlatID={0}", FlatID));
    }
}