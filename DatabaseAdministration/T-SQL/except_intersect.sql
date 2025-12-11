select *, Row_Number() over(order by (select null)) % 3 as ShouldIDelete
--into tblTransactionNew
from tblTransaction

delete from tblTransactionNew
where ShouldIDelete = 1

update tblTransactionNew
set DateOfTransaction = dateadd(day,1,DateOfTransaction)
Where ShouldIDelete = 2

alter table tblTransactionNew
drop column ShouldIDelete

select * from tblTransaction -- 2486 rows
intersect--except--union--union all
select * from tblTransactionNew -- 1657 rows, 829 changed rows (excpet shows all changed), 828 unchanged (intersect
order by EmployeeNumber
