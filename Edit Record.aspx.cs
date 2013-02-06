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

public partial class Edit_Record : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer(string.Format("Flat Info.aspx?FlatID={0}", GetFlatID()));
    }
    private int GetFlatID()
    {
        string query = this.Context.Request.QueryString.ToString();
        int index = query.IndexOf('=');
        query = query.Substring(index + 1);
        int FlatID = Convert.ToInt32(query);
        return FlatID;
    }
}
