create view vw_SKUPrice
as 
select 
	dbo.SKU.*
	,dbo.udf_GetSKUPrice(SKU.id) as SKUPrice
from dbo.SKU
