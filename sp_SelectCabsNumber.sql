
--Use the database Cab
USE [CallUpCabs]
GO

--Drop the procedure SelectCabsNumber
DROP PROCEDURE IF EXISTS [dbo].[SelectCabsNumber]
GO

--Create the Stored Procedure SelectCabsNumber
CREATE PROCEDURE [dbo].[SelectCabsNumber]
AS
BEGIN;

SELECT [cabnumber]		--Select the all cabs number.
  FROM [dbo].[cab]		--From cabs table.

END;

--Execute the Procedure SelectCabsNumber
EXEC [dbo].[SelectCabsNumber]

--Drop If exist
DROP PROCEDURE IF EXISTS [dbo].[SelectCabNumber]
GO

--Parameterised stored procedure to select a specific cab number
--based on the cab id.
CREATE PROCEDURE [dbo].[SelectCabNumber]
(@cabid INT)		--Parameter name cabid
AS
BEGIN;

SELECT [cabnumber]
  FROM [dbo].[cab]
  WHERE [cabid] = @cabid;

END;

--Execute the stored procedure.
EXEC [dbo].[SelectCabNumber] 121

	




