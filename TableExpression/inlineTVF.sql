--Inline TVF
CREATE OR ALTER FUNCTION Production.udfGetProductByCatiD(@catid int,@rowno int)RETURNS TABLE
AS
	RETURN
		SELECT TOP (@rowno)
			* 
		FROM Production.Products
		WHERE categoryid=@catid
		ORDER BY unitprice DESC
