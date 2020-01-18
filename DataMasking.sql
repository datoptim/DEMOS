--	-------------------------------------------------------
--	DATA MASKING EN SQL SERVER
--  https://datoptim.com/enmascarar-datos-en-sql-server/
--	@PabloJavier911
--	www.datoptim.com (c)
--	Boletin de noticias [es]: http://eepurl.com/giwb6L
--	Contactos y preguntas: pablof@datoptim.com
--	-------------------------------------------------------


--	Create table appliying masking functions
CREATE TABLE UserInfo
(id int identity(1,1),
FirstName varchar(15),
LastName varchar(15) MASKED WITH (FUNCTION = 'default()'),
CreditCard varchar (25) MASKED WITH (FUNCTION = 'partial(4,"XXXXXXX",0)'),
Email varchar(25) MASKED WITH (FUNCTION = 'email()'),
DocNumber bigint MASKED WITH (FUNCTION = 'random(111111, 999999)')
)

INSERT INTO UserInfo 
(FirstName, LastName, CreditCard, Email, DocNumber) 
VALUES
('Pablo', 'Fernandez', '4940-9898-8989-1234','pablof@datoptim.com',123581321)


SELECT *
FROM UserInfo;


--	Run simulating a different user connection
--	nonAdminUser only have datareader role
EXECUTE AS USER = 'nonAdminUser';  
SELECT * 
FROM UserInfo;  
REVERT;  
