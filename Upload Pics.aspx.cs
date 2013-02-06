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
using System.IO;


public partial class Upload_Pics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Button2.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Upload More
        this.Button1.Visible = true;
        this.FileUpload1.Visible = true;
        this.Button2.Visible = false;
        this.Label1.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.FileUpload1.HasFile)
        {
            string SavePath, SaveFile, ImagesFolder = "Images/Flats";
            SavePath = Path.Combine(Request.PhysicalApplicationPath, ImagesFolder);
            SaveFile = Path.Combine(SavePath, this.FileUpload1.FileName);
            //upload
            try
            {
                try
                {
                    this.FileUpload1.SaveAs(SaveFile);
                }
                catch
                {
                    throw;
                }
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["RealEstate"].ConnectionString);
                OleDbCommand cmd = new OleDbCommand("INSERT INTO Pictures (FlatID, PictureURL) VALUES ( @FlatID, @PictureURL)", conn);
                cmd.Parameters.Add("FlatID", OleDbType.Integer);
                cmd.Parameters.Add("PictureURL", OleDbType.VarWChar);

                string query = this.Request.QueryString.ToString();
                int index = query.IndexOf('=');
                query = query.Substring(index + 1);
                cmd.Parameters["FlatID"].Value = Convert.ToInt32(query);
                cmd.Parameters["PictureURL"].Value = this.FileUpload1.FileName.ToString().Trim();
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                //thumb
                Tools t = new Tools();
                t.adaptPicture(this.FileUpload1.FileName.ToString().Trim());
                //end thumb
                this.FileUpload1.Visible = false;
                this.Button1.Visible = false;
                this.Label1.Text = "File Upload Successfully";
                this.Button2.Visible = true;
            }
            catch
            {
                this.Label1.Text = "Upload Failed, Please Try Again";
                this.FileUpload1.Visible = true;
                this.Button1.Visible = true;
                this.Button2.Visible = false;
            }
            finally
            {

            }
        }
        else
        {
            this.Label1.Text = "Please , Choose a file first!";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string query = this.Request.QueryString.ToString();
        int index = query.IndexOf('=');
        query = query.Substring(index + 1);
        int FlatID = Convert.ToInt32(query);
        Server.Transfer(String.Format("Edit Record.aspx?FlatID={0}", FlatID));
    }
}
