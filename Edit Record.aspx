<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true" CodeFile="Edit Record.aspx.cs" Inherits="Edit_Record" Title="Egypt Flat Finder - Edit Flat Info"  Theme="Real Estate"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Edit Flat Info</h1>
<br /><br /><br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="FlatID" 
        DataSourceID="AccessDataSource1" >
        <Fields>
            <asp:BoundField DataField="FlatID" HeaderText="Flat ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="FlatID" />
            <asp:BoundField DataField="UserName" HeaderText="User Name" 
                SortExpression="UserName" ReadOnly="True" />
            <asp:BoundField DataField="OwnerName" HeaderText="Owner Name" 
                SortExpression="OwnerName" />
            <asp:BoundField DataField="FlatAddress" HeaderText="Address" 
                SortExpression="FlatAddress" />
            <asp:BoundField DataField="FlatCity" HeaderText="City" 
                SortExpression="FlatCity" />
            <asp:CheckBoxField DataField="FlatTelephone" HeaderText="Telephone" 
                SortExpression="FlatTelephone" />
            <asp:CheckBoxField DataField="FlatInternetCable" HeaderText="Internet Cable" 
                SortExpression="FlatInternetCable" />
            <asp:CheckBoxField DataField="FlatAirConditioner" HeaderText="Air Conditioner" 
                SortExpression="FlatAirConditioner" />
            <asp:CheckBoxField DataField="FlatFurnitured" HeaderText="Furnitured" 
                SortExpression="FlatFurnitured" />
            <asp:CheckBoxField DataField="FlatTelevision" HeaderText="Television" 
                SortExpression="FlatTelevision" />
            <asp:CheckBoxField DataField="FlatSatellite" HeaderText="Satellite" 
                SortExpression="FlatSatellite" />
            <asp:CheckBoxField DataField="FlatBillsPaid" HeaderText="Bills Paid" 
                SortExpression="FlatBillsPaid" />
            <asp:CheckBoxField DataField="FlatMeals" HeaderText="Meals" 
                SortExpression="FlatMeals" />
            <asp:CheckBoxField DataField="FlatDoorMan" HeaderText="Door Man" 
                SortExpression="FlatDoorMan" />
            <asp:CheckBoxField DataField="FlatCleaning" HeaderText="Cleaning" 
                SortExpression="FlatCleaning" />
            <asp:BoundField DataField="FlatArea" HeaderText="Area" 
                SortExpression="FlatArea" />
            <asp:BoundField DataField="FlatNumberOfRooms" HeaderText="Number Of Rooms" 
                SortExpression="FlatNumberOfRooms" />
            <asp:BoundField DataField="FlatNumberOfBedRooms" 
                HeaderText="Number Of BedRooms" SortExpression="FlatNumberOfBedRooms" />
            <asp:BoundField DataField="FlatCapacity" HeaderText="Capacity" 
                SortExpression="FlatCapacity" />
            <asp:BoundField DataField="FlatStartDate" HeaderText="Start Date" 
                SortExpression="FlatStartDate" />
            <asp:BoundField DataField="FlatEndDate" HeaderText="End Date" 
                SortExpression="FlatEndDate" />
            <asp:BoundField DataField="FlatMonthlyRent" HeaderText="Monthly Rent" 
                SortExpression="FlatMonthlyRent" />
            <asp:BoundField DataField="FlatWeeklyRent" HeaderText="Weekly Rent" 
                SortExpression="FlatWeeklyRent" />
            <asp:BoundField DataField="FlatDailyRent" HeaderText="Daily Rent" 
                SortExpression="FlatDailyRent" />
            <asp:BoundField DataField="ContactEMail" HeaderText="Contact E-Mail" 
                SortExpression="ContactEMail" />
            <asp:BoundField DataField="ContactTelephone" HeaderText="Contact Telephone" 
                SortExpression="ContactTelephone" />
            <asp:TemplateField HeaderText="Picture" SortExpression="FlatPictureURL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FlatPictureURL") %>' 
                        Enabled="False"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FlatPictureURL") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" 
                        PostBackUrl='<%# Eval("FlatID", "Upload Pics.aspx?FlatID={0}") %>' 
                        Text="Upload Pictures" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <br />
    <br />
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Back To Flat Information" 
                    onclick="Button2_Click" />
            </td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="Back To Catalog" PostBackUrl="~/Catalog.aspx" />
            </td>
        </tr>
    </table>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/Real Estate.mdb" 
        DeleteCommand="DELETE FROM [Flats] WHERE [FlatID] = ?" 
        InsertCommand="INSERT INTO [Flats] ([FlatID], [UserName], [OwnerName], [FlatAddress], [FlatCity], [FlatPictureURL], [FlatTelephone], [FlatInternetCable], [FlatAirConditioner], [FlatFurnitured], [FlatTelevision], [FlatSatellite], [FlatBillsPaid], [FlatMeals], [FlatDoorMan], [FlatCleaning], [FlatArea], [FlatNumberOfRooms], [FlatNumberOfBedRooms], [FlatCapacity], [FlatStartDate], [FlatEndDate], [FlatMonthlyRent], [FlatWeeklyRent], [FlatDailyRent], [ContactEMail], [ContactTelephone]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [Flats] WHERE ([FlatID] = ?)" 
        UpdateCommand="UPDATE [Flats] SET [UserName] = ?, [OwnerName] = ?, [FlatAddress] = ?, [FlatCity] = ?, [FlatPictureURL] = ?, [FlatTelephone] = ?, [FlatInternetCable] = ?, [FlatAirConditioner] = ?, [FlatFurnitured] = ?, [FlatTelevision] = ?, [FlatSatellite] = ?, [FlatBillsPaid] = ?, [FlatMeals] = ?, [FlatDoorMan] = ?, [FlatCleaning] = ?, [FlatArea] = ?, [FlatNumberOfRooms] = ?, [FlatNumberOfBedRooms] = ?, [FlatCapacity] = ?, [FlatStartDate] = ?, [FlatEndDate] = ?, [FlatMonthlyRent] = ?, [FlatWeeklyRent] = ?, [FlatDailyRent] = ?, [ContactEMail] = ?, [ContactTelephone] = ? WHERE [FlatID] = ?">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="FlatID" 
                QueryStringField="FlatID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="FlatID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="FlatAddress" Type="String" />
            <asp:Parameter Name="FlatCity" Type="String" />
            <asp:Parameter Name="FlatPictureURL" Type="String" />
            <asp:Parameter Name="FlatTelephone" Type="Boolean" />
            <asp:Parameter Name="FlatInternetCable" Type="Boolean" />
            <asp:Parameter Name="FlatAirConditioner" Type="Boolean" />
            <asp:Parameter Name="FlatFurnitured" Type="Boolean" />
            <asp:Parameter Name="FlatTelevision" Type="Boolean" />
            <asp:Parameter Name="FlatSatellite" Type="Boolean" />
            <asp:Parameter Name="FlatBillsPaid" Type="Boolean" />
            <asp:Parameter Name="FlatMeals" Type="Boolean" />
            <asp:Parameter Name="FlatDoorMan" Type="Boolean" />
            <asp:Parameter Name="FlatCleaning" Type="Boolean" />
            <asp:Parameter Name="FlatArea" Type="Int32" />
            <asp:Parameter Name="FlatNumberOfRooms" Type="Int32" />
            <asp:Parameter Name="FlatNumberOfBedRooms" Type="Int32" />
            <asp:Parameter Name="FlatCapacity" Type="Int32" />
            <asp:Parameter Name="FlatStartDate" Type="DateTime" />
            <asp:Parameter Name="FlatEndDate" Type="DateTime" />
            <asp:Parameter Name="FlatMonthlyRent" Type="Decimal" />
            <asp:Parameter Name="FlatWeeklyRent" Type="Decimal" />
            <asp:Parameter Name="FlatDailyRent" Type="Decimal" />
            <asp:Parameter Name="ContactEMail" Type="String" />
            <asp:Parameter Name="ContactTelephone" Type="String" />
            <asp:Parameter Name="FlatID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="FlatID" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="FlatAddress" Type="String" />
            <asp:Parameter Name="FlatCity" Type="String" />
            <asp:Parameter Name="FlatPictureURL" Type="String" />
            <asp:Parameter Name="FlatTelephone" Type="Boolean" />
            <asp:Parameter Name="FlatInternetCable" Type="Boolean" />
            <asp:Parameter Name="FlatAirConditioner" Type="Boolean" />
            <asp:Parameter Name="FlatFurnitured" Type="Boolean" />
            <asp:Parameter Name="FlatTelevision" Type="Boolean" />
            <asp:Parameter Name="FlatSatellite" Type="Boolean" />
            <asp:Parameter Name="FlatBillsPaid" Type="Boolean" />
            <asp:Parameter Name="FlatMeals" Type="Boolean" />
            <asp:Parameter Name="FlatDoorMan" Type="Boolean" />
            <asp:Parameter Name="FlatCleaning" Type="Boolean" />
            <asp:Parameter Name="FlatArea" Type="Int32" />
            <asp:Parameter Name="FlatNumberOfRooms" Type="Int32" />
            <asp:Parameter Name="FlatNumberOfBedRooms" Type="Int32" />
            <asp:Parameter Name="FlatCapacity" Type="Int32" />
            <asp:Parameter Name="FlatStartDate" Type="DateTime" />
            <asp:Parameter Name="FlatEndDate" Type="DateTime" />
            <asp:Parameter Name="FlatMonthlyRent" Type="Decimal" />
            <asp:Parameter Name="FlatWeeklyRent" Type="Decimal" />
            <asp:Parameter Name="FlatDailyRent" Type="Decimal" />
            <asp:Parameter Name="ContactEMail" Type="String" />
            <asp:Parameter Name="ContactTelephone" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
</asp:Content>

