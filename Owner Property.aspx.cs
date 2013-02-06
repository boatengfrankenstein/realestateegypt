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
using System.IO;
using System.Data.OleDb;

public partial class Owner_Property : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.LabelUserName.Text = this.User.Identity.Name.ToString();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string URL = ((ImageButton)this.GridView1.SelectedRow.Cells[2].Controls[1]).ImageUrl.ToString();
        string FlatID = ((Label)this.GridView1.SelectedRow.Cells[0].Controls[1]).Text.ToString();
        Convert.ToInt32(FlatID);

        Tools T = new Tools();
        T.DeleteFilePicture(Convert.ToInt32(FlatID));

        OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["RealEstate"].ConnectionString);
        OleDbCommand cmd = new OleDbCommand();

        conn.Open();
        cmd.Connection = conn;
        cmd.CommandText = String.Format("DELETE * FROM Flats WHERE FlatID = {0}", FlatID);
        cmd.ExecuteNonQuery();

        cmd.CommandText = String.Format("DELETE * FROM Pictures WHERE FlatID = {0}", FlatID);
        cmd.ExecuteNonQuery();
        conn.Close();

        Server.Transfer("Owner Property.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

    }
}