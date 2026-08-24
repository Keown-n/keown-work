select * from tblEmployee
where DateOfBirth between '19760101' and '19861231' -- year 1971/01/01 and 1986/01/01

select * from tblEmployee
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

Select year(DateofBirth) as YearofDOB, COUNT(*) 
from tblEmployee
group by year(DateofBirth)

Select year(DateofBirth) as YearofDOB, COUNT(*) 
from tblEmployee
group by year(DateofBirth)
Order by year(DateofBirth) ASC -- DSC