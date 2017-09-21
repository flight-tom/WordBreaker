ECHO.  
ECHO Processing object for 00.DropAllForeignKeys.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\10_tables\00.DropAllForeignKeys.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.Keywords.Table.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\10_tables\dbo.Keywords.Table.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.VisitedUrls.Table.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\10_tables\dbo.VisitedUrls.Table.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.Split.UserDefinedFunction.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\50_functions\dbo.Split.UserDefinedFunction.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.DeleteKeywords.StoredProcedure.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\60_stored_procedures\dbo.DeleteKeywords.StoredProcedure.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.GetTopHotKeywords.StoredProcedure.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\60_stored_procedures\dbo.GetTopHotKeywords.StoredProcedure.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.GetTopNagtiveKeywords.StoredProcedure.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\60_stored_procedures\dbo.GetTopNagtiveKeywords.StoredProcedure.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.GetTopPositiveKeywords.StoredProcedure.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\60_stored_procedures\dbo.GetTopPositiveKeywords.StoredProcedure.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.InsertKeyword.StoredProcedure.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\60_stored_procedures\dbo.InsertKeyword.StoredProcedure.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
ECHO.  
ECHO Processing object for dbo.InsertVisitedUrl.StoredProcedure.sql ......  
OSQL.EXE -S db.comeondata.com -U crawler -P stock  -o .\CPBU_SQLDEPLOY.LOG -i "C:\GitRepo\WordBreaker\database\wordbreaker-db\60_stored_procedures\dbo.InsertVisitedUrl.StoredProcedure.sql" -d WordBreaker  
TYPE .\CPBU_SQLDEPLOY.LOG  
FIND "Line" .\CPBU_SQLDEPLOY.LOG  
IF 1 EQU 0 EXIT 1  
  
EXIT 0 
