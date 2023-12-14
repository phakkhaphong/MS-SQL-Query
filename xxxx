SELECT 
	empid,firstname,lastname,city,region,country
,	city+','+region+','+country as Area1
,	city+','+ISNULL(region,'')+IIF(region IS NULL,'',',')+country as Area2
,	city+','+COALESCE(region,'')+IIF(region IS NULL,'',',')+country as Area3
,	CONCAT(city,',',region,IIF(region IS NULL,'',','),country) as Area4
FROM HR.Employees
