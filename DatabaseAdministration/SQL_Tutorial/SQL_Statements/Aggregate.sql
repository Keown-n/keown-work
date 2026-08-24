SELECT 
	SUM( list_price) as [Total cost]
	,AVG( list_price) as Average
	,MAX (list_price) as [Max Value]
	,MIN(list_price) as [Min Value]
	, COUNT(*) as [Number of Rows]
  FROM [BikeStores].[sales].[order_items]
