create view vw_SKUPrice
as 
select 
	dbo.SKU.*
	,dbo.udf_GetSKUPrice(SKU.id) AS Price
from dbo.SKU
