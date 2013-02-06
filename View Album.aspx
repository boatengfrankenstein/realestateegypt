<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true"
    CodeFile="View Album.aspx.cs" Inherits="View_Album" Title="Egypt Flat Finder - Flat Pictures" Theme="Real Estate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Flat Album</h1>
    <br />
    <h3>View available pictures of a certain flat or an apartment in Cairo.</h3>
    <br />
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ID" 
        DataSourceID="AccessDataSource1">
        <EmptyDataTemplate>
            No More Pictures&nbsp; Available!
        </EmptyDataTemplate>
        <Fields>
            <asp:BoundField DataField="FlatID" HeaderText="FlatID" SortExpression="FlatID" 
                Visible="False" />
            <asp:TemplateField ShowHeader="False" SortExpression="PictureURL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PictureURL") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PictureURL") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" 
                        ImageUrl='<%# Eval("PictureURL", "~/Images/Flats/{0}") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" Visible="False" />
        </Fields>
    </asp:DetailsView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/Real Estate.mdb" 
        SelectCommand="SELECT * FROM [Pictures] WHERE ([FlatID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="FlatID" 
                QueryStringField="FlatID" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:Button ID="ButtonDeleteRecord" runat="server" OnClick="ButtonDeleteRecord_Click"
        Text="Delete Picture" Visible="False" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Back To Flat Info" OnClick="Button1_Click" />
</asp:Content>
