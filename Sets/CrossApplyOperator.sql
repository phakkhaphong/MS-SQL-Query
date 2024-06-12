SELECT
	C.categoryname
,	X.productname
,	X.unitprice
FROM Production.Categories as C
CROSS APPLY
	(
	SELECT TOP 1 *
	FROM Production.Products as P	WHERE P.categoryid=C.categoryid
	ORDER BY P.unitprice DESC
	) as X
GO

SELECT
	C.categoryname
,	X.productname
,	X.unitprice
FROM Production.Categories as C
CROSS APPLY Production.udfGetProductByCatiD(C.categoryid,2) as X
