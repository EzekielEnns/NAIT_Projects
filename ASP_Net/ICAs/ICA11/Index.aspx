<%@ Page Title="" Language="C#" Theme="Theme1" MetaDescription="ICA11 Part 1 - Basic Queries" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="ICAs_ICA11_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../../Style/ICA11.css" runat="server" visible="true" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span>
        <label for="_Suppler">Pick a Supplier: </label>
        <asp:DropDownList ID="_Suppler" runat="server" AutoPostBack="true" OnSelectedIndexChanged="_Suppler_SelectedIndexChanged"></asp:DropDownList>
        <asp:TextBox ID="_Filter" runat="server" ></asp:TextBox>
        <asp:Button runat="server" ID="btnFilter" Text="Filter" OnClick="btnFilter_Click"/>
    </span>

    <asp:Table ID="_TblData" runat="server" EnableTheming="true"> 
    </asp:Table>
    
</asp:Content>

