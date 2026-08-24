select e.EmpolyeeNumber as ENumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber as TNumber, 
       sum(t.Amount) as TotalAmount
from tblEmployee  e
left join tblTransaction t
on e.EmpolyeeNumber = T.EmployeeNumber
where t.EmployeeNumber is null
group by e.EmpolyeeNumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber 
order by e.EmpolyeeNumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber 
go

Select *
from(select e.EmpolyeeNumber as ENumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber as TNumber, 
       sum(t.Amount) as TotalAmount
from tblEmployee  e
left join tblTransaction t
on e.EmpolyeeNumber = T.EmployeeNumber
group by e.EmpolyeeNumber, e.EmployeeFirstName,
       e.EmployeeLastName, t.EmployeeNumber 
 ) as newTable
 where TNumber is null
 order by ENumber, TNumber,
       EmployeeLastName

go

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
 where ENumber is null
 order by ENumber, TNumber,
       EmployeeLastName
