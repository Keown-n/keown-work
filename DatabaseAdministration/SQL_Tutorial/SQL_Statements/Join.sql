SELECT TOP (1000) 

	product_id,
	product_name, 
	brand_name, 
	category_name, 
	model_year, 
	list_price
  FROM [BikeStores].[production].[products] AS p
  INNER JOIN [BikeStores].[production].[brands] b
  ON p.brand_id = b.brand_id
  INNER JOIN production.categories c
  ON p.category_id = c.category_id;