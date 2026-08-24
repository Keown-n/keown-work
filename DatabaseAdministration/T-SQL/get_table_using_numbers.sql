select * from tblEmployee
where not EmpolyeeNumber > 200

select * from tblEmployee
where EmpolyeeNumber != 200

select * from tblEmployee
where EmpolyeeNumber >= 200 and EmpolyeeNumber <=209

select * from tblEmployee
where not (EmpolyeeNumber >= 200 and EmpolyeeNumber <=209)

select * from tblEmployee
where EmpolyeeNumber < 200 or EmpolyeeNumber >209

select * from tblEmployee
where EmpolyeeNumber between 200 and 209

select * from tblEmployee
where EmpolyeeNumber not between 200 and 209


select * from tblEmployee
where EmpolyeeNumber in(200,204,208)
