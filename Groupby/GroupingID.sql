SELECT 
	Country,OrderYear,Category
--,	GROUPING_ID(Country) as GID1 ,GROUPING_ID(OrderYear) as GID2 ,GROUPING_ID(Category) as GID3
--,	GROUPING_ID(Country,OrderYear,Category) as GID4
,	SUM(Amount) as Amount
FROM Sales.vwTestAmount
