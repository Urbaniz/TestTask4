create trigger tr_Basket_insert_update 
on dbo.Basket
after insert
as
begin
	declare @ID_SKU int, @COUNTSKU int
	
    select @ID_SKU = ID_SKU, @COUNTSKU = count(ID_SKU)
    from inserted
	group by ID_SKU
	
	if @COUNTSKU >= 2
	begin
		update b
		set DiscountValue = Value * 1.05
		from dbo.Basket as b
		where ID_SKU = @ID_SKU
	end
	else
	begin
		update b
		set DiscountValue = 0
		from dbo.Basket as b
	end
end