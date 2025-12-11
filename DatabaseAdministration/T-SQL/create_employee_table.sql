CREATE TABLE tblEmployee 
(EmpolyeeNumber INT NOT NULL,
EmployeeFirstName NCHAR(50) NOT NULL,
EmployeeMiddleName NCHAR(50) NOT NULL,
EmployeeLastName NCHAR(50) NOT NULL,
EmployeeGovernmentID CHAR(10) NOT NULL,
DateofBirth DATE NOT NULL
)
go

ALter table tblEmployee
ADD Department VARCHAR(15)

go

Alter table tblEmployee
Drop Column Department

go

Alter table tblEmployee
alter Column Department VARCHAR(20)

INSERT INTO tblEmployee
VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations')

INSERT INTO tblEmployee([EmployeeFirstName],[EmployeeMiddleName],
[EmployeeLastName],[EmployeeGovernmentID],[DateOfBirth],[Department],[EmpolyeeNumber])
VALUES ('Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation',131)

INSERT INTO tblEmployee
VALUES (1, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations'),
(2,'Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation')

SELECT * FROM tblEmployee
where EmployeeLastName = 'Word'
SELECT * FROM tblEmployee
where EmployeeLastName > 'Word'
SELECT * FROM tblEmployee
where EmployeeLastName < 'Word'
SELECT * FROM tblEmployee
where EmployeeLastName >= 'Word'
SELECT * FROM tblEmployee
where EmployeeLastName <= 'Word'

SELECT * FROM tblEmployee
where EmployeeLastName like '%W%'

-- % = 0-infinity characters
-- _ = 1 character
-- [A-G] = In the range A-G.
-- [AGQ] = A, G or Q.
-- [^AGQ] = NOT A, G or Q.

select * from tblEmployee
where EmployeeLastName like '[%]%'
