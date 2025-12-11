select Convert(tinyint, system_type_id*2), column_id, Round(system_type_id*1.000 / column_id,1) as Calculation
from sys.all_columns