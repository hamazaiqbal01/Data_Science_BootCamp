
--                        Stored Procedures   --
-- Write once run it many times 
-- check record all ready exist or not
-- precedure syntax
-- create procedure Name

Alter procedure GetCustomers
as 
begin
	select FirstName as FName, LastName as LName, 
	City + ' '+ Country as [Location],
	Phone as Mobile 
	from customer 
end

Exec GetCustomers

-- Practice tastk for stored procedures 
-- insert contact > return details > return id > No duplicate 

-- @ >>> custome user variables
-- @@ >>> systems variables 

Alter Procedure InsertCustomer
@FirstName varchar(50),
@LastName varchar(50), 
@Country varchar(50),
@Phone varchar(50),
@City varchar(50)
as 
Begin 
	insert into Customer (FirstName, LastName,city, country, Phone)
	Values
	(@FirstName, @LastName, @City, @Country, @Phone) 
	declare @id as int 
	set @id = @@IDENTITY  -- As a developer to get id we define the funciton identity 
	select * from customer where id = @id 
end


EXEC InsertCustomer @FirstName='Hamza', @LastName='Iqbal', @City='Islamabad ', @Country='Pakistan', @Phone='1122';
EXEC InsertCustomer 'umer', @LastName='Iqbal', @City='dub ', @Country='irl', @Phone='991';

EXEC InsertCustomer 'abc', 'xyz', 'x ', 'y', '00'

select * from Customer



----------------------------------------------------------------
alter procedure [dbo].[GetCustomers]
@ID as int = NULL
as
BEGIN
	IF(@ID is not null)
		SELECT FirstName as FName, LastName As LName, 
		City + ' ' + Country as [Location], 
		Phone as Mobile from 
		Customer where ID = @id 
	ELSE
		SELECT FirstName as FName, LastName As LName, 
		City + ' ' + Country as [Location], 
		Phone as Mobile from 
		Customer
END
EXEC GetCustomers 94
EXEC GetCustomers 
------------------------------------------------------------------

------------------------------------------------------------------

------------------------------------------------------------------



-- Insert customers
--- MODIFIED-------


alter  procedure InsertCustomer
@Firstname varchar(50), 
@LastName varchar(50) = NULL, 
@City varchar(50), 
@Country varchar(50), 
@Phone varchar(50) = NULL
as
BEGIN
	Declare @Count int 
	select @count = count(*) from customer where firstName = @FirstName
	and LastName = @LastName

	if(@Count > 0)
		 RAISERROR ( 'This Customer already exits in DB',1,1)
	else
	begin

		insert into customer (Firstname, LastName, 
		city, country, Phone)
		VALUES 
		(@Firstname, @LastName, @City, @Country, @Phone)
		declare @id as int 
		set @id = @@IDENTITY

		Exec GetCustomers @id
	end
END
------------------------------------------------------------------

------------------------------------------------------------------

------------------------------------------------------------------

-- Getting single variable ouptut 

---stored procedure with Output parameters

alter procedure GetSingleVariableOutput
@Firstname varchar(50), 
@LastName varchar(50) = NULL, 
@City varchar(50), 
@Country varchar(50), 
@Phone varchar(50) = NULL, 
@output as int output
as
BEGIN
	Declare @Count int 
	select @count = count(*) from customer where firstName = @FirstName
	and LastName = @LastName

	if(@Count > 0)
	begin
		 RAISERROR ( 'This Customer already exits in DB',1,1)
		 return
	end
	
	insert into customer (Firstname, LastName, 
	city, country, Phone)
	VALUES 
	(@Firstname, @LastName, @City, @Country, @Phone)
	declare @id as int 

	
	set @output = @@IDENTITY

	 print 'Identity value is ' + cast(@@IDENTITY as varchar)
	  print '@output value is ' + cast(@output as varchar)

		
END

------------------------------------------------------------------

------------------------------------------------------------------

------------------------------------------------------------------

---Stored Procedure with Dynamic SQL


ALTER procedure [dbo].[GetCustomers]
@ID as int = NULL
as
BEGIN

	declare @sql  varchar(500) 	= 'SELECT FirstName as FName, LastName As LName, 
		City + '' '' + Country as [Location], 
		Phone as Mobile from 
		Customer';

	IF(@ID is not null)
		set @sql = @sql + ' where ID = ' + Cast(@id as varchar)

		print @sql

		EXEC sp_executesql @sql;
END


------------------------------------------------------------------

------------------------------------------------------------------

------------------------------------------------------------------


--- Trigger > turn on specific conditions when somethig happen or when following statements happend trigger this thing 
-- databases > tables > views > programmability > proecedure // triggers 



select * into customer_History from Customer where 1=2

alter table customer_history add operation varchar(50)
alter table customer_history alter column id identity

alter table customer

create trigger tbl_Customer_Insert 
on customer After Insert 
as 
	insert into customer_History(CustomerID, FirstName, LastName, City , Country, Phone, Operation)
	select ID, FirstName, LastName, City, Country, Phone, 'Insert' from inserted

insert into customer(FirstName, LastName, City , Country, Phone)
values 
('hamza', 'khan', 'isb','pka','1234')
select * from customer_History
-----------------------------------------------------