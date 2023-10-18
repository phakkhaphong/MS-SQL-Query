SELECT
	OrderYear,Category
,	SUM(Amount) as Amount
--,	GROUPING_ID(OrderYear) as GID1,GROUPING_ID(Category) as GID2,GROUPING_ID(OrderYear,Category) as GID3
FROM Sales.vwAmountX
GROUP BY ROLLUP (OrderYear,Category)
ORDER BY OrderYear,Category