WITH X AS
	(
	SELECT TOP 1
		* 
	FROM Production.Products as P
	WHERE categoryid=4
	ORDER BY unitprice DESC
	),
O2008 AS
	(
	SELECT * FROM Sales.Orders WHERE orderdate>='Jan 1,2008'
	),
Y AS
	(
	SELECT
		X.categoryid,X.discontinued,X.productid,X.productname,X.supplierid
	,	OD.unitprice,OD.qty
	,	O2008.*
	FROM X
	INNER JOIN Sales.OrderDetails as OD ON OD.productid=X.productid
	INNER JOIN O2008
	ON OD.orderid=O2008.orderid
	) 
SELECT * FROM Y INNER JOIN HR.Employees as E ON E.empid=Y.empid
