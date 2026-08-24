if exists(select * from sys.views where name = 'ViewByDepartment')
   drop view dbo.ViewByDepartment
go

CREATE view [dbo].[ViewByDepartment] as 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
--order by D.Department, T.EmployeeNumber

GO
