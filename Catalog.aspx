<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true"
    CodeFile="Catalog.aspx.cs" Inherits="Catalog" Title="Real Estate Egypt - Catalog" Theme="Real Estate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Traveller</h1>
    <br />
    <h3>View available flats and apartments in Cairo</h3>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="FlatID" DataSourceID="AccessDataSource1" PageSize="5" >
        <RowStyle VerticalAlign="Bottom" Wrap="False" />
        <Columns>
            <asp:TemplateField HeaderText="Picture" SortExpression="FlatPictureURL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FlatPictureURL") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("FlatPictureURL", "~/Images/Flats/thumb_{0}") %>'
                        PostBackUrl='<%# Eval("FlatID", "Flat Info.aspx?FlatId={0}") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="FlatAddress" HeaderText="Address" SortExpression="FlatAddress">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FlatCity" HeaderText="City" SortExpression="FlatCity">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FlatNumberOfRooms" HeaderText="Number Of Rooms" SortExpression="FlatNumberOfRooms">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Start Date" SortExpression="FlatStartDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FlatStartDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FlatStartDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date" SortExpression="FlatEndDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FlatEndDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FlatEndDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" PostBackUrl='<%# Eval("FlatID", "Flat Info.aspx?FlatID={0}") %>'
                        Text="View Details" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <blockquote>
                <p style="text-indent: 0px">
                    There is no Flats available now!</p>
                <br />
                <a href="UploadAFlat.aspx">Upload a New Flat</a>
            </blockquote>
        </EmptyDataTemplate>
        <HeaderStyle Wrap="False" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Real Estate.mdb"
        SelectCommand="SELECT [FlatID], [FlatPictureURL], [FlatAddress], [FlatCity], [FlatNumberOfRooms], [FlatStartDate], [FlatEndDate] FROM [Flats] ORDER BY [FlatStartDate]">
    </asp:AccessDataSource>
</asp:Content>
