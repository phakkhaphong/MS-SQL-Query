CREATE OR ALTER VIEW [Sales].[vwTestAmount] AS
SELECT 
	O.shipcountry as Country
,	YEAR(O.orderdate) as OrderYear
,	C.categoryname as Category
,	SUM(OD.qty*OD.unitprice) as Amount
FROM Sales.Orders as O
INNER JOIN Sales.OrderDetails as OD ON O.orderid=OD.orderid
INNER JOIN Production.Products as P ON P.productid=OD.productid
INNER JOIN Production.Categories as C ON C.categoryid=P.categoryid
WHERE C.categoryid IN (6,7) AND O.orderdate>='Jan 1,2007' AND O.shipcountry IN ('UK','USA')
GROUP BY O.shipcountry,YEAR(O.orderdate),C.categoryname
GO
