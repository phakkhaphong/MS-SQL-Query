DECLARE @myString varchar(100)='Microsoft SQL Server 2022 Standard Edition'

SELECT 
	SUBSTRING(@myString,11,10) as substringX
,	LEFT(@myString,9) as LeftX, RIGHT(@myString,16) as RightX
,	CHARINDEX(' ',@mystring,18)
,	CHARINDEX(' ',@mystring,CHARINDEX(' ',@mystring,18)+1)
,	SUBSTRING(@myString,CHARINDEX(' ',@mystring,18)+1,CHARINDEX(' ',@mystring,CHARINDEX(' ',@mystring,18)+1)-CHARINDEX(' ',@mystring,18)-1)
,	REPLACE(@mystring,'Standard','Enterprise')