<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true"
    CodeFile="Flat Info.aspx.cs" Inherits="Flat_Info" Title="Egypt Flat Finder - Flat Info" Theme="Real Estate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Flat Info</h1>
    <br />
    <br />
    <br />
    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Manager,Operator">
                <ContentTemplate>
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="FlatID" DataSourceID="AccessDataSource1">
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("FlatPictureURL", "~/Images/Flats/{0}") %>' />
                            <br />
                            FlatID:
                            <asp:Label ID="FlatIDLabel" runat="server" Text='<%# Eval("FlatID") %>' />
                            <br />
                            User Name :&nbsp;<asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                            <br />
                            Owner Name :&nbsp;<asp:Label ID="OwnerNameLabel" runat="server" Text='<%# Eval("OwnerName") %>' />
                            <br />
                            Address :&nbsp;<asp:Label ID="FlatAddressLabel" runat="server" Text='<%# Eval("FlatAddress") %>' />
                            <br />
                            <asp:Label ID="FlatCityLabel" runat="server" Text='<%# Eval("FlatCity") %>' />
                            <br />
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="CheckBox11" runat="server" Checked='<%# Eval("FlatTelephone") %>'
                                            Enabled="False" Text="Telephone" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox12" runat="server" Checked='<%# Eval("FlatInternetCable") %>'
                                            Enabled="False" Text="Internet Cable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="CheckBox13" runat="server" Checked='<%# Eval("FlatAirConditioner") %>'
                                            Enabled="False" Text="Air Conditioner" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox14" runat="server" Checked='<%# Eval("FlatFurnitured") %>'
                                            Enabled="False" Text="Furniture" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="CheckBox15" runat="server" Checked='<%# Eval("FlatTelevision") %>'
                                            Enabled="False" Text="Television" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox16" runat="server" Checked='<%# Eval("FlatSatellite") %>'
                                            Enabled="False" Text="Satellite" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="CheckBox17" runat="server" Checked='<%# Eval("FlatBillsPaid") %>'
                                            Enabled="False" Text="Bills Paid" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox18" runat="server" Checked='<%# Eval("FlatMeals") %>' Text="Meals Included"
                                            Enabled="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="CheckBox19" runat="server" Checked='<%# Eval("FlatDoorMan") %>'
                                            Enabled="False" Text="Door Man" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox20" runat="server" Checked='<%# Eval("FlatCleaning") %>'
                                            Enabled="False" Text="Cleaning Service" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <br />
                            Area :&nbsp;<asp:Label ID="FlatAreaLabel" runat="server" Text='<%# Eval("FlatArea") %>' />
                            <br />
                            Number Of Rooms :&nbsp;<asp:Label ID="FlatNumberOfRoomsLabel" runat="server" Text='<%# Eval("FlatNumberOfRooms") %>' />
                            <br />
                            Number Of BedRooms :&nbsp;<asp:Label ID="FlatNumberOfBedRoomsLabel" runat="server"
                                Text='<%# Eval("FlatNumberOfBedRooms") %>' />
                            <br />
                            Capacity :
                            <asp:Label ID="FlatCapacityLabel" runat="server" Text='<%# Eval("FlatCapacity") %>' />
                            <br />
                            <br />
                            Start Date :
                            <asp:Label ID="FlatStartDateLabel" runat="server" Text='<%# Eval("FlatStartDate") %>' />
                            <br />
                            End Date :
                            <asp:Label ID="FlatEndDateLabel" runat="server" Text='<%# Eval("FlatEndDate") %>' />
                            <br />
                            <br />
                            Monthly Rent :
                            <asp:Label ID="FlatMonthlyRentLabel" runat="server" Text='<%# Eval("FlatMonthlyRent") %>' />
                            <br />
                            Weekly Rent :
                            <asp:Label ID="FlatWeeklyRentLabel" runat="server" Text='<%# Eval("FlatWeeklyRent") %>' />
                            <br />
                            Daily Rent :
                            <asp:Label ID="FlatDailyRentLabel" runat="server" Text='<%# Eval("FlatDailyRent") %>' />
                            <br />
                            <br />
                            Contact E-Mail :
                            <asp:Label ID="ContactEMailLabel" runat="server" Text='<%# Eval("ContactEMail") %>' />
                            <br />
                            Contact Telephone :
                            <asp:Label ID="ContactTelephoneLabel" runat="server" Text='<%# Eval("ContactTelephone") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Real Estate.mdb"
                        SelectCommand="SELECT * FROM [Flats] WHERE ([FlatID] = ?)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="FlatID" QueryStringField="FlatID"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <br />
                    <table>
                    <tr>
                    <td>
                    <asp:Button ID="ButtonDeleteRecord" runat="server" Text="Delete Record" OnClick="ButtonDeleteRecord_Click" />
                    </td>
                    <td>
                    <asp:Button ID="ButtonEditRecord" runat="server" Text="Edit Record" OnClick="ButtonEditRecord_Click" />
                    </td>
                    </tr>
                    </table>
                    <br />
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
        <LoggedInTemplate>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="FlatID" DataSourceID="AccessDataSource1">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval( "FlatPictureURL", "~/Images/Flats/{0}") %>' />
                    <br />
                    Address :
                    <asp:Label ID="FlatAddressLabel" runat="server" Text='<%# Eval("FlatAddress") %>' />
                    &nbsp;<asp:Label ID="FlatCityLabel" runat="server" Text='<%# Eval("FlatCity") %>' />
                    &nbsp;<br />
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("FlatTelephone") %>'
                                    Enabled="False" Text="Telephone" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("FlatInternetCable") %>'
                                    Enabled="False" Text="Internet Cable" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("FlatAirConditioner") %>'
                                    Enabled="False" Text="Air Conditioner" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("FlatFurnitured") %>'
                                    Enabled="False" Text="Furniture" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("FlatTelevision") %>'
                                    Enabled="False" Text="Television" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("FlatCleaning") %>'
                                    Enabled="False" Text="Cleaning Service" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("FlatDoorMan") %>'
                                    Enabled="False" Text="Door Man" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Eval("FlatMeals") %>' Enabled="False"
                                    Text="Meals Included" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Eval("FlatSatellite") %>'
                                    Enabled="False" Text="Satellite TV" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Eval("FlatBillsPaid") %>'
                                    Enabled="False" Text="All Bills Paid" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    Flat Area :
                    <asp:Label ID="FlatAreaLabel" runat="server" Text='<%# Eval("FlatArea") %>' />
                    <br />
                    Number Of Rooms :
                    <asp:Label ID="FlatNumberOfRoomsLabel" runat="server" Text='<%# Eval("FlatNumberOfRooms") %>' />
                    <br />
                    Number Of BedRooms :
                    <asp:Label ID="FlatNumberOfBedRoomsLabel" runat="server" Text='<%# Eval("FlatNumberOfBedRooms") %>' />
                    <br />
                    Capacity :
                    <asp:Label ID="FlatCapacityLabel" runat="server" Text='<%# Eval("FlatCapacity") %>' />
                    <br />
                    <br />
                    Start Date :
                    <asp:Label ID="FlatStartDateLabel" runat="server" Text='<%# Eval("FlatStartDate") %>' />
                    <br />
                    End Date :
                    <asp:Label ID="FlatEndDateLabel" runat="server" Text='<%# Eval("FlatEndDate") %>' />
                    <br />
                    <br />
                    Monthly Rent :
                    <asp:Label ID="FlatMonthlyRentLabel" runat="server" Text='<%# Eval("FlatMonthlyRent") %>' />
                    <br />
                    Daily Rent :
                    <asp:Label ID="FlatDailyRentLabel" runat="server" Text='<%# Eval("FlatDailyRent") %>' />
                    <br />
                    Weekly Rent :
                    <asp:Label ID="FlatWeeklyRentLabel" runat="server" Text='<%# Eval("FlatWeeklyRent") %>' />
                    <br />
                    <br />
                    <blockquote>
                        <br />
                        <br />
                        Contact Operator :
                        <br />
                        Name : Mustafa Mahrous
                        <br />
                        T.N. : (002) 018 3043 349
                        <br />
                        E-Mail : Info@RealStateEgypt.com
                    </blockquote>
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:Button ID="ButtonAddToFavourites" runat="server" Text="Add To Favourites" OnClick="ButtonAddToFavourites_Click" />
            <br />
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Real Estate.mdb"
                SelectCommand="SELECT [FlatID], [FlatAddress], [FlatCity], [FlatPictureURL], [FlatTelephone], [FlatInternetCable], [FlatAirConditioner], [FlatFurnitured], [FlatTelevision], [FlatArea], [FlatCleaning], [FlatDoorMan], [FlatMeals], [FlatBillsPaid], [FlatSatellite], [FlatNumberOfRooms], [FlatNumberOfBedRooms], [FlatCapacity], [FlatStartDate], [FlatEndDate], [FlatMonthlyRent], [FlatDailyRent], [FlatWeeklyRent] FROM [Flats] WHERE ([FlatID] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="FlatID" QueryStringField="FlatID"
                        Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
        </LoggedInTemplate>
        <AnonymousTemplate>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="FlatID" DataSourceID="AccessDataSource1">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval( "FlatPictureURL", "~/Images/Flats/{0}") %>' />
                    <br />
                    Address :
                    <asp:Label ID="FlatAddressLabel" runat="server" Text='<%# Eval("FlatAddress") %>' />
                    &nbsp;<asp:Label ID="FlatCityLabel" runat="server" Text='<%# Eval("FlatCity") %>' />
                    &nbsp;<br />
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("FlatTelephone") %>'
                                    Enabled="False" Text="Telephone" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("FlatInternetCable") %>'
                                    Enabled="False" Text="Internet Cable" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("FlatAirConditioner") %>'
                                    Enabled="False" Text="Air Conditioner" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("FlatFurnitured") %>'
                                    Enabled="False" Text="Furniture" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("FlatTelevision") %>'
                                    Enabled="False" Text="Television" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("FlatCleaning") %>'
                                    Enabled="False" Text="Cleaning Service" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("FlatDoorMan") %>'
                                    Enabled="False" Text="Door Man" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Eval("FlatMeals") %>' Enabled="False"
                                    Text="Meals Included" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Eval("FlatSatellite") %>'
                                    Enabled="False" Text="Satellite TV" />
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Eval("FlatBillsPaid") %>'
                                    Enabled="False" Text="All Bills Paid" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    Flat Area :
                    <asp:Label ID="FlatAreaLabel" runat="server" Text='<%# Eval("FlatArea") %>' />
                    <br />
                    Number Of Rooms :
                    <asp:Label ID="FlatNumberOfRoomsLabel" runat="server" Text='<%# Eval("FlatNumberOfRooms") %>' />
                    <br />
                    Number Of BedRooms :
                    <asp:Label ID="FlatNumberOfBedRoomsLabel" runat="server" Text='<%# Eval("FlatNumberOfBedRooms") %>' />
                    <br />
                    Capacity :
                    <asp:Label ID="FlatCapacityLabel" runat="server" Text='<%# Eval("FlatCapacity") %>' />
                    <br />
                    <br />
                    Start Date :
                    <asp:Label ID="FlatStartDateLabel" runat="server" Text='<%# Eval("FlatStartDate") %>' />
                    <br />
                    End Date :
                    <asp:Label ID="FlatEndDateLabel" runat="server" Text='<%# Eval("FlatEndDate") %>' />
                    <br />
                    <br />
                    Monthly Rent :
                    <asp:Label ID="FlatMonthlyRentLabel" runat="server" Text='<%# Eval("FlatMonthlyRent") %>' />
                    <br />
                    Daily Rent :
                    <asp:Label ID="FlatDailyRentLabel" runat="server" Text='<%# Eval("FlatDailyRent") %>' />
                    <br />
                    Weekly Rent :
                    <asp:Label ID="FlatWeeklyRentLabel" runat="server" Text='<%# Eval("FlatWeeklyRent") %>' />
                    <br />
                    <br />
                    <blockquote>
                        <br />
                        Contact Operator :
                        <br />
                        Name : Mustafa Mahrous
                        <br />
                        T.N. : (002) 018 3043 349
                        <br />
                        E-Mail : Info@RealStateEgypt.com
                    </blockquote>
                </ItemTemplate>
            </asp:DataList>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Real Estate.mdb"
                SelectCommand="SELECT [FlatID], [FlatAddress], [FlatCity], [FlatPictureURL], [FlatTelephone], [FlatInternetCable], [FlatAirConditioner], [FlatFurnitured], [FlatTelevision], [FlatArea], [FlatCleaning], [FlatDoorMan], [FlatMeals], [FlatBillsPaid], [FlatSatellite], [FlatNumberOfRooms], [FlatNumberOfBedRooms], [FlatCapacity], [FlatStartDate], [FlatEndDate], [FlatMonthlyRent], [FlatDailyRent], [FlatWeeklyRent] FROM [Flats] WHERE ([FlatID] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="FlatID" QueryStringField="FlatID"
                        Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
        </AnonymousTemplate>
    </asp:LoginView>
    <br />
    <table>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="View More Pictures" OnClick="Button1_Click1" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Back To Catalog" PostBackUrl="~/Catalog.aspx" />
            </td>
        </tr>
    </table>
</asp:Content>
