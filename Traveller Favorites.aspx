<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true"
    CodeFile="Traveller Favorites.aspx.cs" Inherits="Traveller_Favorites" Title="Egypt Flat Finder - Favorites"
    Theme="Real Estate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Favourites</h1>
    <br />
    <h3>Manager your favourite flats and apartments in Cairo.</h3>
    <br />
    <br />
    <br />
    <table>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="View More Details" OnClick="Button1_Click" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Remove From Favourites" 
                    onclick="Button2_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="Label1Error" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="FlatID">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:ImageField DataImageUrlField="Picture" DataImageUrlFormatString="~/Images/Flats/thumb_{0}">
            </asp:ImageField>
        </Columns>
        <EmptyDataTemplate>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Catalog.aspx">Favorites 
            List is Empty. Navigate to Catalog and click Add to Favorites Button</asp:HyperLink>
        </EmptyDataTemplate>
    </asp:GridView>
    <br />
</asp:Content>
