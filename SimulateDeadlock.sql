/*
	For this Demo we use two tables: BF_Pablo and a BF_Scarlett
	representing what two people have for breakfast.
	You can use the scripts uploaded at:
	https://github.com/datoptim/BuildData/blob/master/SimulateDeadlock.sql

	We'll simulate a deadlock event.
	You can visit www.datoptim.com
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
