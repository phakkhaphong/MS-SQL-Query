CREATE VIEW [Sales].[AmountX] as
SELECT 
	YEAR(O.orderdate) as OrderYear
,	C.categoryname
,	O.shipcountry as Country
,	SUM(OD.unitprice*OD.qty) as Amount
FROM Sales.Orders as O INNER JOIN Sales.OrderDetails as OD ON O.orderid=OD.orderid
INNER JOIN Production.Products as P ON P.productid=OD.productid
INNER JOIN Production.Categories as C ON C.categoryid=P.categoryid
WHERE O.shipcountry IN ('Brazil','Italy') AND C.categoryid IN (2,5)
GROUP BY 	YEAR(O.orderdate) ,	C.categoryname,	O.shipcountry 
GO

SELECT * FROM Sales.AmountX
UNION ALL
SELECT 
	NULL , NULL , NULL,SUM(Amount) 
FROM Sales.AmountX
UNION ALL
SELECT 
	OrderYear , NULL , NULL,SUM(Amount) 
FROM Sales.AmountX 
GROUP BY OrderYear
UNION ALL
SELECT 
	OrderYear , categoryname , NULL,SUM(Amount) 
FROM Sales.AmountX 
GROUP BY OrderYear,categoryname
ORDER BY 1,2,3

GO

SELECT
	X.OrderYear,X.Country,X.categoryname
,	SUM(Amount) as Amount
FROM Sales.AmountX as X
GROUP BY 
	GROUPING SETS
		(
			()
		,	(X.OrderYear)
		,	(X.OrderYear,X.Country)
		,	(X.OrderYear,X.Country,X.categoryname)
		)
ORDER BY 1,2,3

GO

SELECT
	X.OrderYear,X.Country,X.categoryname
,	SUM(Amount) as Amount
FROM Sales.AmountX as X
GROUP BY CUBE (X.OrderYear,X.Country)
ORDER BY 1,2
GO

SELECT
	X.OrderYear,X.Country,X.categoryname
,	SUM(Amount) as Amount
FROM Sales.AmountX as X
GROUP BY ROLLUP (X.OrderYear,X.Country,X.categoryname)
ORDER BY 1,2,3
GO
