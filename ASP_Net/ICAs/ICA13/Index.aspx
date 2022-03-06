<%@ Page Title="" MetaDescription="ICA13 - Modify Order Details" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="ICAs_ICA13_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Part 1 - Delete Order Details</h3>
    <div>
        <span>
            <asp:Label ID="Label1" runat="server" Text="Enter OrderID: "></asp:Label>
            <asp:TextBox runat="server" ID="_OdId" Text=""></asp:TextBox>
            <asp:Button ID="_getOD" runat="server" Text="Get Order Details" OnClick="_getOD_Click"  />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eenns1_NorthwindConnectionString %>" SelectCommand="select od.OrderID, p.ProductName, od.ProductID, od.UnitPrice , od.Quantity, 
od.Discount from [Order Details] as od 
inner join products as p 
on od.ProductID = p.ProductID        
where od.OrderID = @Orderid
order by od.ProductID">
            <SelectParameters>
                <asp:ControlParameter ControlID="_OdId" Name="Orderid" PropertyName="Text" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="_GVP1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderID,ProductID" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" Visible="False" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
            </Columns>
        </asp:GridView>
        </span>
        <asp:Button ID="_Del" runat="server" OnClick="_Del_Click" Text="Delete Selected" />
        <br />
        <asp:Label ID="_P1Stats" runat="server" Text="Status:"></asp:Label>
    </div>
    <h3>Part 2 - Insert Order Details</h3>
    <span>
        <asp:Label ID="Label2" runat="server" Text="Enter OrderID"></asp:Label>
        <asp:TextBox ID="_P2OD" runat="server" OnTextChanged="_P2OD_TextChanged"></asp:TextBox>
        
    </span>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Select Prod: "></asp:Label>
    <asp:DropDownList ID="_Prod" runat="server" DataSourceID="SqlDataSource2" DataTextField="ProductName" DataValueField="ProductID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eenns1_NorthwindConnectionString %>" SelectCommand=
        "select ProductID, ProductName from Products order by ProductName">
    </asp:SqlDataSource>
    <br /> 
    <span>
        <asp:Label ID="Label6" runat="server" Text="Enter Quantity: "></asp:Label><asp:TextBox ID="_Qant" runat="server"></asp:TextBox>
    </span>
    <br />  
    <asp:Button ID="_Insert" runat="server" Text="Insert Record" OnClick="_Insert_Click" />
    <br />
    <asp:Label ID="_P2Stats" runat="server" Text="Status"></asp:Label>
</asp:Content>

