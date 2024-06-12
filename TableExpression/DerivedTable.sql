SELECT * FROM
	(
	SELECT
		X.categoryid,X.discontinued,X.productid,X.productname,X.supplierid
	,	OD.unitprice,OD.qty
	,	O2008.*
	FROM
		(
		SELECT TOP 1
			* 
		FROM Production.Products as P
		WHERE categoryid=4
		ORDER BY unitprice DESC
		) as X
	INNER JOIN Sales.OrderDetails as OD ON OD.productid=X.productid
	INNER JOIN
		(
		SELECT * FROM Sales.Orders WHERE orderdate>='Jan 1,2008'
		)as O2008
	ON OD.orderid=O2008.orderid
	) as Y
INNER JOIN HR.Employees as E ON E.empid=Y.empid
