declare @myOption as varchar(10) = 'Option A'

select case when @myOption = 'Option A' then 'First option'
            when @myOption = 'Option B' then 'Second option'
			else 'No Option'END as MyOptions
go

declare @myOption as varchar(10) = 'Option C'

select case when @myOption = 'Option A' then 'First option'
            when @myOption = 'Option B' then 'Second option'
			--else 'No Option' 
			END as MyOptions -- MyOption is the column name
go
declare @myOption as varchar(10) = 'Option A'

select case @myOption when 'Option A' then 'First option'
                   when 'Option B' then 'Second option' 
				   else 'No Option' END as MyOptions
go

