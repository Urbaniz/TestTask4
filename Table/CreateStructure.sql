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

-- Создание таблицы Basket
create table Basket(
    ID int not null identity,
    ID_SKU int not null,
    ID_Family int not null,
    Quantity int,
    Value int,
    PurchaseDate date not null,
    DiscountValue int,
    constraint PK_Basket primary key (ID),
	constraint FK_Basket_ID_SKU_SKU foreign key (ID_SKU) references SKU(ID),
	constraint FK_Basket_ID_Family_Family foreign key (ID_Family) references Family(ID),
	constraint CK_Basket_Quantity check(Quantity >= 0),
	constraint CK_Basket_Value check(Value >= 0)
)
alter table Basket add constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate
