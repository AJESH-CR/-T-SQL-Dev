
--Drop the Database CallUpCabs if exist.
DROP DATABASE IF EXISTS [CallUpCabs]
GO

--Create the database CallUpCabs.
CREATE DATABASE [CallUpCabs]
GO

--Use the this database for the process.
USE [CallUpCabs]
GO

--Drop the cabs table if exist
DROP TABLE IF EXISTS [dbo].[cab]
GO

--Creating cabs table
CREATE TABLE [dbo].[cab](
	  cabid INT
	, cabnumber VARCHAR(20)
	, ownername VARCHAR(30)
	, fare DECIMAL 
);

--Creating customer table
CREATE TABLE [dbo].[customer](
	 c_id VARCHAR(10) NOT NULL PRIMARY KEY
	,c_name VARCHAR(30) NOT NULL
	,c_email VARCHAR(30) NOT NULL
	,c_address NTEXT NOT NULL
);

--Adding values to the cab table
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

--Adding values to the customer table
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

