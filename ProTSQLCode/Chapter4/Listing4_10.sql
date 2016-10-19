-- Listing 4-10

USE [AdventureWorks2014]
GO

IF EXISTS (SELECT * FROM sys.objects
           WHERE object_id = OBJECT_ID(N'[dbo].[Numbers]')
		     AND type in (N'U'))
DROP TABLE [dbo].[Numbers];

-- Create a numbers table to allow the product pull list to be
-- created using set-based logic
CREATE TABLE dbo.Numbers (Num int NOT NULL PRIMARY KEY);
GO
-- Fill the numbers table with numbers from 0 to 30,000 
WITH NumCTE (Num) 
AS 
( 
SELECT 0

UNION ALL

SELECT Num + 1
FROM NumCTE
WHERE Num < 30000 
)

INSERT INTO dbo.Numbers (Num) SELECT Num FROM NumCTE
OPTION (MAXRECURSION 0); 
GO
