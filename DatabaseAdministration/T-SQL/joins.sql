select emp.EmpolyeeNumber, EmployeeFirstName,EmployeeLastName, SUM(Amount) as amount
from tblEmployee emp
join tblTransaction trans -- inner join
on emp.EmpolyeeNumber = trans.EmployeeNumber
Group by emp.EmpolyeeNumber, EmployeeFirstName,EmployeeLastName
order by emp.EmpolyeeNumber

select emp.EmpolyeeNumber, EmployeeFirstName,EmployeeLastName, SUM(Amount) as amount
from tblEmployee emp
left join tblTransaction trans --left outer join
on emp.EmpolyeeNumber = trans.EmployeeNumber
Group by emp.EmpolyeeNumber, EmployeeFirstName,EmployeeLastName
order by emp.EmpolyeeNumber

select emp.EmpolyeeNumber, EmployeeFirstName,EmployeeLastName, SUM(Amount) as amount
from tblEmployee emp
right join tblTransaction trans -- right outer join
on emp.EmpolyeeNumber = trans.EmployeeNumber
Group by emp.EmpolyeeNumber, EmployeeFirstName,EmployeeLastName
order by emp.EmpolyeeNumber