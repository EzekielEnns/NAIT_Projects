<%@ Page Title="" Language="C#" MetaDescription="ICA12 - SP's for Customers Summary" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="ICAs_ICA12_Index" Theme="Theme1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span>
        <label for="_Customer">Pick a Supplier: </label>
        <asp:DropDownList ID="_Customer" OnSelectedIndexChanged="_Customer_SelectedIndexChanged" runat="server" AutoPostBack="true" ></asp:DropDownList>
        <asp:TextBox ID="_Filter" runat="server" ></asp:TextBox>
        <asp:Button runat="server" ID="btnFilter" Text="Filter" OnClick="btnFilter_Click"/>
    </span>
    <br />
    <asp:GridView ID="_summary" runat="server"></asp:GridView>
    </asp:Content>

