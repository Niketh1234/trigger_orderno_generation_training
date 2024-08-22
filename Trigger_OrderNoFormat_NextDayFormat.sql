create table items(itemID int primary key identity(1,1), name varchar(20),price float, qty int)
select * from items

create table orders(ordno char(10) primary key,customername varchar(40),orderdate date,gross_amt float)

insert into orders values('value5','some name',getdate(),1001)
select * from orders
--truncate table orders

alter trigger insorder
on orders
instead of insert
as
begin
    declare @ordno char(10)
    declare @name varchar(20)
    declare @gross float
    declare @currentDate char(8)
    declare @maxOrdNo int
	declare @dateToUse date = getdate()

    select @name = customername, @gross = gross_amt from inserted
    set @currentDate = format(@dateToUse, 'yyMMdd')

    select @maxOrdNo = isnull(max(cast(substring(ordno, 9, 3) as int)), 0)
    from orders
    where format(orderdate, 'yyMMdd') = @currentDate

    select @ordno = concat('O',
                           format(@dateToUse, 'yy'),
                           format(@dateToUse, 'MM'),
                           format(@dateToUse, 'dd'),
                           format(@maxOrdNo + 1, '000'))

    insert into orders (ordno, customername, orderdate, gross_amt)
    values (@ordno, @name, @dateToUse, @gross)
end

