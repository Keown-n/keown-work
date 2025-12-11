

-- dervived table
select Department 
from ( select Department, Count(*) as num
from tblEmployee
group by Department) as newTable

select distinct Department, '' as DepartmentHead
into tblDepartment
from tblEmployee
