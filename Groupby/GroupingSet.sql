SELECT 
	Country,OrderYear
,	SUM(Amount) as Amount
FROM Sales.vwTestAmount
GROUP BY
	GROUPING SETS
		(
			(),(Country),(Country,OrderYear)
		)
ORDER BY 1,2
