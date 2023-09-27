select Trim('    Pakistan     ')

select RTRIM('     Pakistan     ') 
select LTRIM('   Pakistan   ') 


--- Concat WS 
-- LEFT 
-- Right 
-- SubString 
-- 

select CONCAT(FirstName,' ', LastName) from Customer;
select CONCAT_WS('=',FirstName, LastName) from Customer;

select Left('Pakistan',3)  -- ( select right 3 characters) 
select right('Pakistan',3)  -- ( select left 3 characters ) 

Select SUBSTRING('pakistan',2,5)  --(string, start position, length) 

select CompanyName, SUBSTRING(CompanyName, 5,3) 
from supplier; -- form keywords used only for tables 

select companyname, Left(companyname, 4) from Supplier;

select companyname, right(companyname, 4) from Supplier;

select * from supplier;
select city from Supplier;

-- DML in SQL 


-- Insert Command > insert single or multiple rows >>> 
-- Delete Command > 
-- UPDATE command > 
-- Select command > 

select * from table_1;
insert into table_1( FirstName, LastName, Salary, isActive)
Values('hamza' , 'Iqbal', '500', '1');

insert into table_1( FirstName, LastName, Salary, isActive)
Values('umer' , 'Iqbal', '3000', '1');


Select * from customer 

insert into table_1(FirstName, LastName, salary, isActive  )
select FirstName,LastName, 500,1 from customer 

select * from table_1



-- add new columns 

alter table Table_1
ADD Country char(50) 

-- Updating rows values 
select * from supplier 
Update supplier Set CompanyName = 'Apple Inc' 
where id=10

update supplier set Country ='Pakistan'
where id =10

update supplier set City ='Islamabad'
where id =10

update supplier Set ContactName='Hamza Iqbal'
where id= 10
select * from supplier

delete from table_1 where id=2
select * from table_1


-- Union 
-- Merges two statements 
-- number of columns of both statements should be same 
-- Also data type should be same 
delete from table_1;

select  123, 'ALi'
Union ALL
select  firstname, LastName from customer
select * from table_1

select id, FirstName, LastName from table_1
Union all
select id, FirstName, lastname from customer 
Union all
select id, companyname, phone from Supplier

-- Views > we just view the data but cannot change the data 
Alter view empp as 
select FirstName, LastName from table_1
Where id >357
select * from empp
select * from table_1

delete from empp

--- Common table expression (CTE) > it only for this session not for 
with tempCTE as (
select * from customer)
select * from tempcte;

select * from tempcte

-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- Task: two table a= customer and b= oreder select customer that have total greater than 1000
-- show their names country and total amount of all they product they order
-------------------------------------------------
select * from [Order];
---------------------------------------------------
select * from customer;
---------------------------------------------------------------
SELECT * FROM [Order] WHERE TotalAmount > 1000;

SELECT FirstName, Country FROM Customer
UNION
SELECT TotalAmount FROM [Order]
WHERE TotalAmount > 1000;
---------------------------------------------------------
SELECT Customer.FirstName, Customer.Country
FROM [Order]
INNER JOIN Customer ON TotalAmount > 1000;

-------------------------------------------------------------
select c.id, c.firstname, c.country, SUM(totalamount)
from customer c
inner join [order] o on c.id = o.CustomerId
group by c.id, c.firstname, c.country
having(SUM(totalamount)) > 1000;
-------------------------------------------------------------
select * from customer
where id not in (select customerID from [order]);
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------