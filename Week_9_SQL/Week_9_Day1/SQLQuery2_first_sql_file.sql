-- select * from Customer;  -- it get all data from the cutomer table

-- select FirstName,LastName  from Customer -- it will get only 2 columns (first and last name)

-- Now first and last column will concatenate 
-- select CONCAT(FirstName,' ', LastName) from customer 
-- We changed the tag 
select FirstName as Fname from customer 
-- between used for to compare values 

-- we use where to get cutomer which start form a 
select FirstName as Fname from customer 
where FirstName like 'a%' -- a start 
select  CONCAT(FirstName, ' ', LastName) as Name
from Customer
where FirstName= 'Aria'

-- city name 
-- select FirstName as Fname from customer 
-- where FirstName like 'a%' -- a start 
select  CONCAT(FirstName, ' ', LastName) as Name 
from Customer
where City= 'London' AND Country = 'UK'

-- Join command 

select * from 
customer as c 
-- customer id in table 
-- inner join > wher we want to combine two tables 
inner join [order] o on c.Id = o.CustomerId
--
--


select c.ID,CONCAT(FirstName, ' ', LastName) as Name,
o.OrderDate, o.OrderNumber from 
Customer as c 
inner join [order] o on c.Id = o.CustomerId -- only contions mathched data will come 




-------------------------- Pick customer whose id is 86 

select c.ID,CONCAT(FirstName, ' ', LastName) as Name,
o.OrderDate, o.OrderNumber from 
Customer as c 
inner join [order] o on c.Id = o.CustomerId --  both will come order and not order 
where c.Id = 86


select c.ID,CONCAT(FirstName, ' ', LastName) as Name,
o.OrderDate, o.OrderNumber from 
Customer as c 
left outer join [order] o on c.Id = o.CustomerId -- all data will come from left only (conditions match right data will come )



-- Select cutomer that have no order 
select c.ID,CONCAT(FirstName, ' ', LastName) as Name,
o.OrderDate, o.OrderNumber from 
Customer as c 
left outer join [order] o on c.Id = o.CustomerId -- all data will come from left only (conditions match right data will come )

where o.id is null



-- Right join >>> all right data will come only (condiontions match right data will come ) 


select c.ID,CONCAT(FirstName, ' ', LastName) as Name,
o.OrderDate, o.OrderNumber from 
Customer as c 
right outer join [order] o on c.Id = o.CustomerId -- all data will come from left only (conditions match right data will come )

-- prduct 
-- order item 
select * from Product 

select ProductName  as 'Product Sold'
	from Product as P
	inner join OrderItem O
	on 
	P.Id = O.ProductId

---- 

select * from OrderItem
select * from Product 

select ProductName as 'these products sold'
	from Product 
	inner join OrderItem
	on
	Product.Id = OrderItem.ProductId 

----   Data restore and Backup 
-- sales > task > backup  > remove previous path > add new path > save 
-- Backup to restore the data 

