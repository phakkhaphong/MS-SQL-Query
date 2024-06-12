CREATE OR ALTER VIEW Production.vwProductAmount AS

SELECT
	P.productid,P.productname
,	SUM(OD.qty*OD.unitprice*(1-OD.discount)) as Amount
FROM Production.Products as P
INNER JOIN Sales.OrderDetails as OD ON P.productid=OD.productid
GROUP BY P.productid,P.productname
