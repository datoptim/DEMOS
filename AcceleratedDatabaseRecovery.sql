--	-------------------------------------------------------
--	ACCELERATED DATABASE RECOVERY
--  https://datoptim.com/que-es-accelerated-database-recovery-en-sql-server-2019/
--	@PabloJavier911
--	www.datoptim.com (c)
--	Boletin de noticias [es]: http://eepurl.com/giwb6L
--	Contactos y preguntas: pablof@datoptim.com
--	-------------------------------------------------------

-------------
--  PART 1
-------------

--	Let's create two different databases

CREATE DATABASE WithNoADR
GO

CREATE DATABASE WithADR
ALTER DATABASE WithADR SET ACCELERATED_DATABASE_RECOVERY = ON
GO




--	Now we fill same tables in each of them

USE WithNoADR
GO

WAITFOR TIME '00:01:00'

SELECT b.*
INTO TableOld
FROM sys.all_columns AS a 
CROSS JOIN sys.all_objects AS b;


--	Open a different Window

USE WithADR
GO

WAITFOR TIME '00:00:00'

SELECT b.*
INTO TableNew
FROM sys.all_columns AS a 
CROSS JOIN sys.all_objects AS b;



-------------
--  PART 2
-------------

--  Execute ROLLBACK taking notes about time of each database
 
 DROP TABLE WithNoADR..TableOld
 DROP TABLE WithADR..TableNew
 
 USE WithNoADR
 GO
 
BEGIN TRAN
SELECT b.*
INTO TableOld
FROM sys.all_columns AS a 
CROSS JOIN sys.all_objects AS b;
 
--ROLLBACK
 
--	Open a different Window
 
USE WithADR
GO
 
BEGIN TRAN
SELECT b.*
INTO TableNew
FROM sys.all_columns AS a 
CROSS JOIN sys.all_objects AS b;
 
--ROLLBACK
