SELECT NULL as Country, NULL as Year, NULL as Categoty,SUM(Amount) as Amount FROM Sales.vwTestAmount
UNION ALL
SELECT NULL as Country,OrderYear,NULL as Categoty,SUM(Amount) FROM Sales.vwTestAmount
GROUP BY OrderYear
UNION ALL
SELECT Country, NULL as Year, NULL as Categoty,SUM(Amount) FROM Sales.vwTestAmount
GROUP BY Country
UNION ALL
SELECT NULL as Country, NULL as Year,Category,SUM(Amount) FROM Sales.vwTestAmount
GROUP BY Category
UNION ALL
SELECT NULL as Country,OrderYear,Category,SUM(Amount) FROM Sales.vwTestAmount
GROUP BY OrderYear,Category
UNION ALL
SELECT * FROM Sales.vwTestAmount
ORDER BY 1,2,3
