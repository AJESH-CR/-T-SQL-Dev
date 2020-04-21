CREATE DATABASE [CallUpCabs]
GO

USE [CallUpCabs]
GO

CREATE TABLE [dbo].[cab](
	  cabid INT
	, cabnumber VARCHAR(20)
	, ownername VARCHAR(30)
	, fare DECIMAL 
);

INSERT	INTO [dbo].[cab](cabid, cabnumber, ownername, fare) VALUES(
	  121
	 ,'KL-01-SD12'
	 ,'Raman'
	 ,6
);
INSERT	INTO [dbo].[cab](cabid, cabnumber, ownername, fare) VALUES(
	  122
	 ,'KL-01-YUH7'
	 ,'Laxman'
	 ,5
);
INSERT	INTO [dbo].[cab](cabid, cabnumber, ownername, fare) VALUES(
	  126
	 ,'KL-08-SD12'
	 ,'Rajn'
	 ,6
);
INSERT	INTO [dbo].[cab](cabid, cabnumber, ownername, fare) VALUES(
	  121
	 ,'KL-09-UHJ67'
	 ,'kannan'
	 ,10
);

CREATE TABLE [dbo].[customer](
	 c_id VARCHAR(10) NOT NULL PRIMARY KEY
	,c_name VARCHAR(30) NOT NULL
	,c_email VARCHAR(30) NOT NULL
	,c_address NTEXT NOT NULL
	,
);

INSERT INTO [dbo].[customer](c_id, c_name, c_email, c_address) VALUES(
	 8289886789
	,'Ajesh CR'
	,'ajesh@123.com'
	,'ajesh villa he 123 @ home .com'
);
INSERT INTO [dbo].[customer](c_id, c_name, c_email, c_address) VALUES(
	 8289886789
	,'Pradeep'
	,'pradeep@123.com'
	,'pradeep villa he 123 @ home .com'
);
INSERT INTO [dbo].[customer](c_id, c_name, c_email, c_address) VALUES(
	 8289886789
	,'kamalesh'
	,'kamalku@123.com'
	,'kmyuhety he 123 @ home .com'
);
GO

CREATE PROCEDURE dbo.GetAllCabNumber
AS
BEGIN;

	SELECT [dbo].[cab].[cabnumber] FROM [dbo].[cab];

END;

EXEC dbo.GetAllCabNumber