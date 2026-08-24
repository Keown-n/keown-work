select left(EmployeeLastName,1) , COUNT (*) 
from tblEmployee
group by left(EmployeeLastName,1)
order by COUNT (*) DESC --left(EmployeeLastName,1)

select TOP(5) left(EmployeeLastName,1) , COUNT (*) 
from tblEmployee
group by left(EmployeeLastName,1)
order by COUNT (*) DESC --left(EmployeeLastName,1)

select left(EmployeeLastName,1) , COUNT (*) 
from tblEmployee
group by left(EmployeeLastName,1)
having Count(*) >= 50
order by COUNT (*) DESC --left(EmployeeLastName,1)

select left(EmployeeLastName,1) , COUNT (*) 
from tblEmployee
group by left(EmployeeLastName,1)
having left(EmployeeLastName,1) >= 'K'
order by COUNT (*) DESC --left(EmployeeLastName,1)