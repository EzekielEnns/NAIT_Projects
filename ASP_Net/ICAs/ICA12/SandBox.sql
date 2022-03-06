/*
GetCustomers. It should takea parameter of type varchar, 
size of 25 to accept the string filter for the query. 
Retrieve the CustomerID and CompanyName from the Customers 
table where the supplied parameter filter exists 
within the CompanyName ( remember % and + ? )
*/

use eenns1_Northwind
go 
ALTER procedure GetCustomers
@filter as varchar(25) = ''
as
begin
IF @filter != ''
	select CustomerID,CompanyName from Customers
	where CompanyName like '%'+@filter+'%';
ELSE
	select CustomerID,CompanyName from Customers;

return
end

/*
Create and test a stored procedure called CustCatSummary. 
It should take a parameter of 
type nchar(5) representing the 
CustomerID to summarize. It shall select the CategoryName and
Sum of the Quantity of each ( through the 
Customers->Orders->OrderDetails->Products->Categorys ) *
Remember to group by the CategoryName.
The result should indicate the aggregate sum of the quantities 
and costs for the Customer in each Category. 
( You do notneed an outer join here to show 
All categories if no orders existed –
the filter prevents this fromworking anyway 
*/

GO
alter procedure CustCatSummary
@custID as varchar(5) = ''
as
begin
	select CategoryName,SUM(od.Quantity) as Total, Costs='$'+CONVERT(VARCHAR,SUM( Quantity * od.UnitPrice ),1)
	from Customers cu
	inner join Orders o on o.CustomerID = cu.CustomerID
	inner join [Order Details] od on od.OrderID = o.OrderID
	inner join Products p on p.ProductID = od.ProductID
	inner join Categories ca on ca.CategoryID = p.CategoryID
	where cu.CustomerID = @custID
	group by ca.CategoryName
	order by Total desc
return
end

/*
go
select CustomerID,CompanyName from Customers;
*/