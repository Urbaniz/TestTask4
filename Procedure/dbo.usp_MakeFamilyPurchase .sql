create procedure usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
	declare @SumValue int = (
		select sum(Value) 
		from dbo.Family as f
			inner join dbo.Basket as b on b.ID_Family = f.ID 
		where SurName = @FamilySurName
	)
	,@IDSurName int = (
		select ID
		from dbo.Family
		where SurName = @FamilySurName
	)

	if @IDSurName is null
		print('There is no such surname')
	else
	begin
		update f
		set BudgetValue = @SumValue
		from dbo.Family as f
			inner join dbo.Basket as b on b.ID_Family = f.ID
		where SurName = @FamilySurName
	end
end