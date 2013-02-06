<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true"
    CodeFile="Upload Pics.aspx.cs" Inherits="Upload_Pics" Title="Egypt Flat Finder - Upload Pictures" Theme="Real Estate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Upload More Pictures</h1>
    <br />
    <h3>Here you can add more pictures of your flats and apartments in Cairo.</h3>
    <br />
    <br />
    <blockquote>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Upload Again" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Back To Edit Flat Info" 
            onclick="Button3_Click" />
    </blockquote>
</asp:Content>
