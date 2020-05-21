SET NOCOUNT ON
CREATE TABLE SystemLog 
(id int identity (1,1) PRIMARY KEY, 
sessionNumber int, 
userId int,
import decimal(10,2), 
ipAddress varchar(15), 
dateAndTime datetime)

DECLARE @Date1 datetime
SET @Date1 = '2020-04-23 08:00:00.000'

WHILE(@Date1 < getdate())
BEGIN
	INSERT INTO SystemLog
	SELECT TOP (ABS(CHECKSUM(NEWID()) % 33334) + 300000)
		CAST(RAND(CHECKSUM(NEWID())) * 99999 AS int) as SessionNumber,
		CAST(RAND(CHECKSUM(NEWID())) * 300 AS int) as UserId,
		CAST(RAND(CHECKSUM(NEWID())) * 50000.0 AS decimal(10,2)) as Import,
		CAST(CAST(RAND(CHECKSUM(NEWID())) * 10 as INT) + 1 AS varchar(3))
		+ '.' + CAST(CAST(RAND(CHECKSUM(NEWID())) * 10 as INT) + 1 AS varchar(3))
		+ '.' + CAST(CAST(RAND(CHECKSUM(NEWID())) * 10 as INT) + 1 AS varchar(3))
		+ '.' + CAST(CAST(RAND(CHECKSUM(NEWID())) * 10 as INT) + 1 AS varchar(3)) as IpAddress,
		DATEADD(MILLISECOND, CAST(RAND(CHECKSUM(NEWID())) * 28000000 as INT), @Date1) as DateAndTime
	FROM sys.all_objects a 
	CROSS JOIN sys.all_objects b

	SET @Date1 = @Date1 + 1
END
