<%@ Page Title="" MetaDescription="ICA9 - Data aware Controls" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="ICAs_ICA9_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Button ID="BtnShowProd" runat="server" Text="Show Products" OnClick="BtnShowProd_Click" />
        <asp:Button ID="BtnEditE" runat="server" Text="Edit Emloyees" OnClick="BtnEditE_Click"/>
    </div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
          <div class="content2">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindTradersConnectionString2 %>" SelectCommand="SELECT [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [CategoryName], [ProductID] FROM [Alphabetical list of products] ORDER BY [ProductName]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="QuantityPerUnit" HeaderText="Quantity Per Unit" SortExpression="QuantityPerUnit">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitPrice" DataFormatString="{0:C}" HeaderText="Unit Price" SortExpression="UnitPrice">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitsInStock" DataFormatString="{0:d}" HeaderText="Units In Stock" SortExpression="UnitsInStock">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitsOnOrder" HeaderText="Units On Order" SortExpression="UnitsOnOrder">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level" SortExpression="ReorderLevel">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName">
                    <HeaderStyle BackColor="#969696" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" Visible="False" />
                </Columns>
                <PagerStyle HorizontalAlign="Right" />
            </asp:GridView></div> 
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="content2">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HireDate">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                    <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:eenns1_NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @original_EmployeeID AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL))" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country]) VALUES (@LastName, @FirstName, @Title, @HireDate, @Address, @City, @Country)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country] FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Country] = @Country WHERE [EmployeeID] = @original_EmployeeID AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_HireDate" Type="DateTime" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_Country" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="HireDate" Type="DateTime" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="HireDate" Type="DateTime" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_HireDate" Type="DateTime" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_Country" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
        </asp:View>

    </asp:MultiView>
</asp:Content>

