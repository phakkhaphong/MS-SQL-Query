SELECT
	C.custid
,	X.orderid
FROM Sales.Customers as C
OUTER APPLY
	(
	SELECT TOP 2 * FROM Sales.Orders as O WHERE O.custid=C.custid
	)as X
