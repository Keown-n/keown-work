begin transaction

select count(*) from tblTransaction

delete tblTransaction
from tblEmployee as E
right join tblTransaction as T
on E.EmpolyeeNumber = T.EmployeeNumber
where E.EmpolyeeNumber is null

select count(*) from tblTransaction



rollback transaction -- goes back before table was deleted

begin transaction
delete tblTransaction
from tblEmployee
where EmployeeNumber in(
Select *
from(select e.EmpolyeeNumber as ENumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber as TNumber, 
       sum(t.Amount) as TotalAmount
from tblEmployee  e
right join tblTransaction t
on e.EmpolyeeNumber = T.EmployeeNumber
group by e.EmpolyeeNumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber 
 ) as newTable
 where ENumber is null)

 select count(*) from tblTransaction


rollback transaction -- goes back before table was deleted
select count(*) from tblTransaction