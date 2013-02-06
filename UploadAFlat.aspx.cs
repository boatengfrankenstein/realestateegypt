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
using System.Drawing;
using System.Drawing.Imaging;

public partial class UploadAFlat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Server.Transfer("Catalog.aspx");
    }

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            this.LabelUpload.Text = "";
            this.FileUpload1.Visible = true;
            this.Button1.Visible = true;

            if (this.User.Identity.IsAuthenticated)
            {
                this.Wizard1.ActiveStepIndex = 2;
            }
        }

        if (e.CurrentStepIndex == 7)
        {
            OleDbConnection conn;
            OleDbCommand cmd;
            OleDbTransaction trans;
            conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["RealEstate"].ConnectionString);
            conn.Open();
            trans = conn.BeginTransaction();
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.Transaction = trans;
            cmd.CommandText = "INSERT INTO Flats ( UserName, OwnerName, FlatAddress, FlatCity, FlatPictureURL, FlatTelephone, FlatInternetCable, FlatAirConditioner, FlatFurnitured, FlatTelevision, FlatSatellite, FlatBillsPaid, FlatMeals, FlatDoorMan, FlatCleaning, FlatArea, FlatNumberOfRooms, FlatNumberOfBedRooms, FlatCapacity, FlatStartDate, FlatEndDate, FlatMonthlyRent, FlatWeeklyRent, FlatDailyRent, ContactTelephone, ContactEMail) VALUES ( @UserName, @OwnerName, @FlatAddress, @FlatCity, @FlatPictureURL, @FlatTelephone, @FlatInternetCable, @FlatAirConditioner, @FlatFurnitured, @FlatTelevision, @FlatSatellite, @FlatBillsPaid, @FlatMeals, @FlatDoorMan, @FlatCleaning, @FlatArea, @FlatNumberOfRooms, @FlatNumberOfBedRooms, @FlatCapacity, @FlatStartDate, @FlatEndDate, @FlatMonthlyRent, @FlatWeeklyRent, @FlatDailyRent, @ContactTelephone, @ContactEMail)";

            cmd.Parameters.Add("UserName", OleDbType.WChar, 50);
            cmd.Parameters.Add("OwnerName", OleDbType.WChar, 50);
            cmd.Parameters.Add("FlatAddress", OleDbType.WChar, 255);
            cmd.Parameters.Add("FlatCity", OleDbType.WChar, 50);
            cmd.Parameters.Add("FlatPictureURL", OleDbType.WChar, 50);
            cmd.Parameters.Add("FlatTelephone", OleDbType.Boolean);
            cmd.Parameters.Add("FlatInternetCable", OleDbType.Boolean);
            cmd.Parameters.Add("FlatAirConditioner", OleDbType.Boolean);
            cmd.Parameters.Add("FlatFurnitured", OleDbType.Boolean);
            cmd.Parameters.Add("FlatTelevision", OleDbType.Boolean);
            cmd.Parameters.Add("FlatSatellite", OleDbType.Boolean);
            cmd.Parameters.Add("FlatBillsPaid", OleDbType.Boolean);
            cmd.Parameters.Add("FlatMeals", OleDbType.Boolean);
            cmd.Parameters.Add("FlatDoorMan", OleDbType.Boolean);
            cmd.Parameters.Add("FlatCleaning", OleDbType.Boolean);
            cmd.Parameters.Add("FlatArea", OleDbType.Integer);
            cmd.Parameters.Add("FlatNumberOfRooms", OleDbType.Integer);
            cmd.Parameters.Add("FlatNumberOfBedRooms", OleDbType.Integer);
            cmd.Parameters.Add("FlatCapacity", OleDbType.Integer);
            cmd.Parameters.Add("FlatStartDate", OleDbType.Date);
            cmd.Parameters.Add("FlatEndDate", OleDbType.Date);
            cmd.Parameters.Add("FlatMonthlyRent", OleDbType.Currency);
            cmd.Parameters.Add("FlatWeeklyRent", OleDbType.Currency);
            cmd.Parameters.Add("FlatDailyRent", OleDbType.Currency);
            cmd.Parameters.Add("ContactEMail", OleDbType.WChar, 50);
            cmd.Parameters.Add("ContactTelephone", OleDbType.WChar, 15);

            cmd.Parameters["UserName"].Value = this.User.Identity.Name;
            cmd.Parameters["OwnerName"].Value = ((TextBox)this.Wizard1.FindControl("TBName")).Text.ToString().Trim();
            cmd.Parameters["FlatAddress"].Value = ((TextBox)this.Wizard1.FindControl("TBAddress_1")).Text.Trim() + "  " + ((TextBox)this.Wizard1.FindControl("TBAddress_2")).Text.Trim();
            cmd.Parameters["FlatCity"].Value = ((TextBox)this.Wizard1.FindControl("TBCity")).Text.ToString().Trim();
            cmd.Parameters["FlatPictureURL"].Value = ((Label)this.LabelFileName).Text.ToString().Trim();
            cmd.Parameters["FlatTelephone"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxTelephone")).Checked;
            cmd.Parameters["FlatInternetCable"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxInternet")).Checked;
            cmd.Parameters["FlatAirConditioner"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxAirConditioner")).Checked;
            cmd.Parameters["FlatFurnitured"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxFurniture")).Checked;
            cmd.Parameters["FlatTelevision"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxTelevision")).Checked;
            cmd.Parameters["FlatSatellite"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxSatellite")).Checked;
            cmd.Parameters["FlatBillsPaid"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxBills")).Checked;
            cmd.Parameters["FlatMeals"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxMeals")).Checked;
            cmd.Parameters["FlatDoorMan"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxDoorMan")).Checked;
            cmd.Parameters["FlatCleaning"].Value = ((CheckBox)this.Wizard1.FindControl("CheckBoxCleaning")).Checked;
            cmd.Parameters["FlatArea"].Value = Convert.ToInt32(((TextBox)this.Wizard1.FindControl("TBArea")).Text.ToString().Trim());
            cmd.Parameters["FlatNumberOfRooms"].Value = Convert.ToInt32(((TextBox)this.Wizard1.FindControl("TBRooms")).Text.ToString().Trim());
            cmd.Parameters["FlatNumberOfBedRooms"].Value = Convert.ToInt32(((TextBox)this.Wizard1.FindControl("TBBedRooms")).Text.ToString().Trim());
            cmd.Parameters["FlatCapacity"].Value = Convert.ToInt32(((TextBox)this.Wizard1.FindControl("TBCapacity")).Text.ToString().Trim());
            cmd.Parameters["FlatMonthlyRent"].Value = ((TextBox)this.Wizard1.FindControl("TBRentPerMonth")).Text.ToString().Trim();
            cmd.Parameters["FlatWeeklyRent"].Value = ((TextBox)this.Wizard1.FindControl("TBRentPerWeek")).Text.ToString().Trim();
            cmd.Parameters["FlatDailyRent"].Value = ((TextBox)this.Wizard1.FindControl("TBRentPerDay")).Text.ToString().Trim();
            cmd.Parameters["ContactEMail"].Value = ((TextBox)this.Wizard1.FindControl("TBEmail")).Text.ToString().Trim();
            cmd.Parameters["ContactTelephone"].Value = ((TextBox)this.Wizard1.FindControl("TBTelephone")).Text.ToString().Trim();

            int year = Convert.ToInt32(((DropDownList)this.Wizard1.FindControl("StartDateYear")).SelectedValue.ToString());
            int month = Convert.ToInt32(((DropDownList)this.Wizard1.FindControl("StartDateMonth")).SelectedValue.ToString());
            int day = Convert.ToInt32(((DropDownList)this.Wizard1.FindControl("StartDateDay")).SelectedValue.ToString());
            DateTime StartDate = new DateTime(year, month, day);

            year = Convert.ToInt32(((DropDownList)this.Wizard1.FindControl("EndDateYear")).SelectedValue.ToString());
            month = Convert.ToInt32(((DropDownList)this.Wizard1.FindControl("EndDateMonth")).SelectedValue.ToString());
            day = Convert.ToInt32(((DropDownList)this.Wizard1.FindControl("EndDateDay")).SelectedValue.ToString());
            DateTime EndDate = new DateTime(year, month, day);

            cmd.Parameters["FlatStartDate"].Value = StartDate;
            cmd.Parameters["FlatEndDate"].Value = EndDate;
            try
            {
                cmd.ExecuteScalar();
                trans.Commit();
            }
            catch
            {
                trans.Rollback();
                this.Wizard1.ActiveStepIndex = 0;
                ((Label)this.Wizard1.FindControl("ErrorLabel")).Visible = true;
                //throw;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ImagesFolder = "Images/Flats";
        string SavePath;
        string SaveFile;
        if (((FileUpload)this.Wizard1.FindControl("FileUpload1")).HasFile)
        {
            try
            {
                SavePath = Path.Combine(Request.PhysicalApplicationPath, ImagesFolder);
                SaveFile = Path.Combine(SavePath, ((FileUpload)this.Wizard1.FindControl("FileUpload1")).FileName);
                ((Label)this.LabelFileName).Text = this.FileUpload1.FileName.ToString().Trim();
                FileUpload1.SaveAs(SaveFile);
                ((FileUpload)this.Wizard1.FindControl("FileUpload1")).Visible = false;
                this.Button1.Visible = false;
                LabelUpload.Text = "File Uploaded Successfully!";
                LabelUpload.Text += "\n";
                LabelUpload.Text += "To Upload More Pictures Edit Flat Info Link On Your Properties Page would help";

                //Create a Thumb
                Tools t = new Tools();
                bool success = t.adaptPicture(this.FileUpload1.FileName.ToString().Trim());
                if (!success)
                {
                    throw new System.Exception();
                };
            }
            catch (Exception ex)
            {
                LabelUpload.Text = "Failed !";
                LabelUpload.Text += "\n\n";
                LabelUpload.Text += ex.Message;
            }
        }
        else
        {
            LabelUpload.Text = "Please, Choose A File First";
        }
    }
}