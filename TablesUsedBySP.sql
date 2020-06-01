
--Script to query no of tables used in a perticular 
--Stored Procedure.

DECLARE @procid int = OBJECT_ID(N'dbo.spWGGT_reportProjectDetail'); --SP name

;WITH src AS 
(
  SELECT name = 
      COALESCE(QUOTENAME(d.referenced_server_name)   + N'.', N'')
    + COALESCE(QUOTENAME(d.referenced_database_name) + N'.', N'')
    + QUOTENAME(d.referenced_schema_name) + N'.'
    + QUOTENAME(d.referenced_entity_name)
  FROM sys.sql_expression_dependencies AS d
  WHERE d.referencing_id = @procid
)
SELECT name FROM src GROUP BY name;