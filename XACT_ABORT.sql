/*
	For this Demo basically we use two tables: Countries and a Cities.
	You can use the creation scripts uploaded at:
	https://github.com/datoptim/BuildData/blob/master/CountryAndCity.sql

	We'll see how XACT_ABORT works with two related tables.
	You can visit www.datoptim.com
*/



/* First we list cities by a particular country */
EXEC usp_ListCities 'Bolivia'
GO





/*	After we know which cities there are, we insert a new value.
	Insert value having in mind we have to reference Country table for integrity.
	It works fine in this case. You can verify with usp_ListCities
 */
INSERT INTO City VALUES ('Datoptim', 'Bolivia')
GO





/*	Let's add some fake city names on this table.
	What happens when you try to run all this next block of code?
	Take a look that the fourth INSERT doesn't respect integrity.
*/
INSERT INTO City VALUES ('Z1', 'Bolivia')
INSERT INTO City VALUES ('Z2', 'Bolivia')
INSERT INTO City VALUES ('Z3', 'Bolivia')
INSERT INTO City VALUES ('Z4', 'Boliviazz')
INSERT INTO City VALUES ('Z5', 'Bolivia')
INSERT INTO City VALUES ('Z6', 'Bolivia')





/*	Check again with usp_ListCities.
	Did all the rows get inserted in the City table?
*/
EXEC usp_ListCities 'Bolivia'
GO





/*	Now think about it. Is this the behavior we want?
	Executing a block of code and having errors in some place,
	would it be good to commit only the sentences with no errors?
	Wouldn't be better to rollback all the block to avoid integrity corruptions?
	That's what you have to tell in order to perform as you need.
*/




/*	If you executed previous scrtips, run this one to clean original table
		DELETE FROM City 
		WHERE City in ('Datoptim', 'Z1', 'Z2', 'Z3', 'Z5', 'Z6')
		GO
*/
