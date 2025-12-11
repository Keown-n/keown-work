DECLARE @chr as char(10)

set @chr = 'hello'

SELECT @chr as myString, len(@chr) as MyLength, DATALENGTH(@chr) as MyDataLength
