--	--------------------------------------------------------------
--	TEMP TABLES vs TABLE VARIABLE
--	www.DATOPTIM.com
--	FOR ENLARGING ADVENTUREWORKS VISIT:
--	https://www.sqlskills.com/blogs/jonathan/enlarging-the-adventureworks-sample-databases/
--	Jonathan Kehayias
--	--------------------------------------------------------------


--	TEMPORARY TABLE WITH DATA
SELECT *
INTO #SOD
FROM [Sales].[SalesOrderDetailEnlarged]


--	TABLE VARIABLE
DECLARE @SOD AS TABLE (
	[SalesOrderID] [int] NOT NULL,
	[SalesOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecialOfferID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
	) 

--	INSERT DATA INTO TABLE VARIABLE
INSERT INTO @SOD
SELECT * 
FROM [Sales].[SalesOrderDetailEnlarged]


--	EXECUTE SAME QUERY FOR BOTH OF THEM
SELECT *
FROM #SOD
WHERE ProductId = 870

SELECT *
FROM @SOD
WHERE ProductId = 870
