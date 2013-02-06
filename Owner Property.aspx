<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true"
    CodeFile="Owner Property.aspx.cs" Inherits="Owner_Property" Title="Egypt Flat Finder - Property"  Theme="Real Estate"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Property</h1>
    <br />
    <h3>Owner's Catalog of flats and apartments available in Cairo</h3>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataSourceID="AccessDataSource1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <RowStyle VerticalAlign="Bottom" Wrap="False" />
        <Columns>
            <asp:TemplateField HeaderText="Id" SortExpression="FlatID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FlatID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FlatID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FlatAddress" HeaderText="Address" SortExpression="FlatAddress" />
            <asp:TemplateField HeaderText="Picture" SortExpression="FlatPictureURL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FlatPictureURL") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("FlatPictureURL", "~/Images/Flats/thumb_{0}") %>'
                        PostBackUrl='<%# Eval("FlatID", "Flat Info.aspx?FlatID={0}") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Capacity" SortExpression="FlatCapacity">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FlatCapacity") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FlatCapacity") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FlatStartDate" HeaderText="Start Date" SortExpression="FlatStartDate" />
            <asp:BoundField DataField="FlatEndDate" HeaderText="End Date" SortExpression="FlatEndDate" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                        PostBackUrl='<%# Eval("FlatID", "Flat Info.aspx?FlatID={0}") %>' Text="View Details"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        PostBackUrl='<%# Eval("FlatID", "Edit Record.aspx?FlatID={0}") %>' Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select"
                        Text="Delete" onclick="LinkButton3_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <blockquote>
                <p style="text-indent: 0px">
                    You are either logged out or never uploaded a property</p>
                <br />
                <a href="UploadAFlat.aspx">Upload A Flat</a>
            </blockquote>
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Real Estate.mdb"
        SelectCommand="SELECT [FlatAddress], [FlatPictureURL], [FlatCapacity], [FlatStartDate], [FlatEndDate], [FlatID] FROM [Flats] WHERE ([UserName] = ?)">
        <DeleteParameters>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelUserName" Name="UserName" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:Label ID="LabelUserName" runat="server" Text="" Visible="False"></asp:Label>
</asp:Content>
