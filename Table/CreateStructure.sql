-- Создание таблицы SKU
create table SKU(
	ID int not null identity,
    Code as ('s' + cast(ID as varchar(255))),
    Name varchar(255),
    constraint PK_SKU primary key (ID),
    constraint UK_SKU_Code unique (Code)
)

-- Создание таблицы Family
create table Family(
    ID int not null identity,
    SurName varchar(255) not null,
    BudgetValue int not null,
    constraint PK_Family primary key (ID)
)