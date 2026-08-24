
/*WHERE clause*/

SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [BikeStores].[sales].[customers]
  WHERE (customer_id <>1 AND city = 'san diego') OR phone IS NOT NULL;

  /**WHERE phone LIKE '%381-6003%';/
