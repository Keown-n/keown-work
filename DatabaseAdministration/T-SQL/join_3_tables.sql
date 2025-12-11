select *
from tblDepartment d
join tblEmployee e
on d.Department = e.Department
join tblTransaction t 
on e.EmpolyeeNumber=t.EmployeeNumber

select *
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t 
on e.EmpolyeeNumber=t.EmployeeNumber

select d.Department,DepartmentHead, sum(Amount) as amount
from tblDepartment d
left join tblEmployee e
on d.Department = e.Department
left join tblTransaction t 
on e.EmpolyeeNumber=t.EmployeeNumber
group by d.Department, DepartmentHead

