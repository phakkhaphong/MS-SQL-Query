--SELECT * FROM sys.syslanguages

DECLARE @mydate date,@mydate2 date

SET LANGUAGE 'us_english'
SET @mydate='11/03/2023'
SET @mydate2='Mar 11,2023'
SELECT @mydate,@mydate2;

SET LANGUAGE 'British'
SET @mydate='11/03/2023'
SET @mydate2='Mar 11,2023'

SELECT @mydate,@mydate2;