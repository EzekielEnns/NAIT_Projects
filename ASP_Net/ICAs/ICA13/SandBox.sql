
use eenns1_Northwind
GO
CREATE OR ALTER procedure DeleteOrderDetails
@OrderID as int,
@ProdID as int,
@out as varchar(80) OUTPUT
as
begin

DELETE FROM [Order Details]
	WHERE OrderID = @OrderID And ProductID=@ProdID;

IF @@ROWCOUNT > 0
	SET @out = 'Record Deleted';
ELSE
	SET @out = 'No Records Deleted, Possible error';

return
end

GO
CREATE OR ALTER PROCEDURE InsertOrderDetails
@OrderID as int,
@ProdID as int,
@Quantity as int
AS 
BEGIN

DECLARE @Price int;

IF NOT EXISTS
(
	SELECT OrderID FROM Orders WHERE OrderID = @OrderID
	UNION ALL
	SELECT ProductID FROM Products WHERE ProductID = @ProdID
)
	RETURN 0

SELECT TOP 1 @Price = UnitPrice FROM Products WHERE ProductID = @ProdID;

INSERT INTO [Order Details]
VALUES (@OrderID,@ProdID,@Price,@Quantity, 0);

RETURN @@ROWCOUNT
END