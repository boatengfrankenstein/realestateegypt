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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.User.IsInRole("Manager") || this.User.IsInRole("Operator"))
        {
            this.DropDownList1.Items[2].Enabled = true;
            this.DropDownList1.Items[3].Enabled = true;
        }
    }

    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        RealStateDSTableAdapters.aspnet_UsersInRolesTableAdapter adapter = new RealStateDSTableAdapters.aspnet_UsersInRolesTableAdapter();
        string SRoleID = Convert.ToString(adapter.QueryRoleIDByRoleName(this.DropDownList1.SelectedValue));
        string SUserID = Convert.ToString(adapter.QueryUserIDByUserName(this.User.Identity.Name));

        System.Guid UserID = new Guid(SUserID);
        System.Guid RoleID = new Guid(SRoleID);

        adapter.InsertUserInRole(UserID, RoleID);
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("Catalog.aspx");
    }
}