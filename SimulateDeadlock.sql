/*
	For this Demo we use two tables: BF_Pablo and a BF_Scarlett
	representing what two people have for breakfast.
	You can use the scripts uploaded at:
	https://github.com/datoptim/BuildData/blob/master/SimulateDeadlock.sql

	We'll simulate a deadlock event.
	You can visit www.datoptim.com
	(ES) www.datoptim.com/simular-deadlock
*/


CREATE TABLE BF_Pablo (
    Id INT IDENTITY,
    Product VARCHAR(16),
    Quantity SMALLINT
)
GO

INSERT INTO BF_Pablo (Product, Quantity) VALUES 
	('Bread', 0), 
	('Bacon', 5),
	('Juice', 2),
	('Marmalade', 0),
	('Cheese', 0)
GO



CREATE TABLE BF_Scarlett(
    Id INT IDENTITY,
    Product VARCHAR(16),
    Quantity SMALLINT
)
GO

INSERT INTO BF_Scarlett(Product, Quantity) VALUES 
	('Bread', 0), 
	('Eggs', 3),
	('butter', 6),
	('Marmalade', 0),
	('Fruit', 8)
GO





--	Let's open two new window session
--	to simulate different connections
--	copy the following but don't execute yet.
--	You will execute the steps as detailed

--------------------
--	<Session A>
--------------------

--	Step 1: Start here
BEGIN TRAN

UPDATE BF_Pablo
SET Quantity = Quantity +1
WHERE Product = 'Bread'

--	Go to Session B


--	Step 3: After Step 2
UPDATE BF_Scarlett
SET Quantity = Quantity +1
WHERE Product = 'Bread'


--	Go to Session B again

--	ROLLBACK

--------------------
--	</Session A>
--------------------



--------------------
--	<Session B>
--------------------

--	Step 2: Start here
BEGIN TRAN

UPDATE BF_Scarlett
SET Quantity = Quantity +1
WHERE Product = 'Marmalade'

--	Go back to Session A


--	Step 4: After Step 3
UPDATE BF_Pablo
SET Quantity = Quantity +1
WHERE Product = 'Marmalade'



--	ROLLBACK

--------------------
--	</Session B>
--------------------
