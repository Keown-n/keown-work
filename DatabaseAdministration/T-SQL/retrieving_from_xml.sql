declare @x xml  
set @x='<Shopping ShopperName="Phillip Burton" >  
<ShoppingTrip ShoppingTripID="L1" >  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>  
</ShoppingTrip>  
<ShoppingTrip ShoppingTripID="L2" >  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip>  
</Shopping>'

select @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return $ValueRetrieved')
select @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return string($ValueRetrieved)')
select @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
                 return concat(string($ValueRetrieved),";")')


select @x.query('for $i in /Shopping/ShoppingTrip[1]/Item
                 let $c := $ValueRetrieved/@Cost
                 where $c >= 4
                 order by $c
                 return concat(string($i),";")')


