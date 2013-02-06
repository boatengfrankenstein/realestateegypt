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

public partial class Flat_Info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ButtonDeleteRecord_Click(object sender, EventArgs e)
    {
        int FlatID = GetFlatID();

        Tools T = new Tools();
        T.DeleteFilePicture(FlatID);

        OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["RealEstate"].ConnectionString);
        OleDbCommand command = new OleDbCommand();
        command.CommandText = string.Format("DELETE * FROM Flats WHERE FlatID = {0}", FlatID);
        conn.Open();
        command.Connection = conn;
        command.ExecuteNonQuery();

        command.CommandText = string.Format("DELETE * FROM Pictures WHERE FlatID = {0}", FlatID);
        command.ExecuteNonQuery();

        conn.Close();

        Server.Transfer("Catalog.aspx");
    }
    
    protected void ButtonAddToFavourites_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["RealEstate"].ConnectionString);
        OleDbCommand command = new OleDbCommand();
        command.Connection = conn;
        command.CommandText = "INSERT INTO Favorites ( UserName, FlatID) VALUES ( @UserName, @FlatId)";
        command.Parameters.Add("UserName", OleDbType.VarWChar);
        command.Parameters.Add("FlatID", OleDbType.Integer);
        command.Parameters["UserName"].Value = this.User.Identity.Name.ToString();
        command.Parameters["FlatID"].Value = GetFlatID();
        conn.Open();
        command.ExecuteNonQuery();
        conn.Close();
    }

    private int GetFlatID()
    {
        string query = this.Context.Request.QueryString.ToString();
        int index = query.IndexOf('=');
        query = query.Substring(index + 1);
        int FlatID = Convert.ToInt32(query);
        return FlatID;
    }

    protected void ButtonEditRecord_Click(object sender, EventArgs e)
    {
        Server.Transfer(String.Format("Edit Record.aspx?FlatID={0}",GetFlatID()));
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string query = this.Request.QueryString.ToString();
        int index = query.IndexOf('=');
        query = query.Substring(index + 1 );
        int FlatID = Convert.ToInt32(query);
        Server.Transfer(String.Format("View Album.aspx?FlatID={0}", FlatID));
    }
}
