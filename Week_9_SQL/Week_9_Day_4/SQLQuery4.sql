-- Windows Functions 
-- row number 
-- Dense 
Select * from customer;
select *,
ROW_NUMBER() Over(Order by FirstName) ROW_NUM  -- over keywrod used with windows fucntions 
from Customer;
-------------
------------
----------
------------------------------
select *,
ROW_NUMBER() Over  -- over keywrod used with windows fucntions 
(partition by country order by firstname) row_num
from Customer;
-------------
------------
----------

-- taks= get all the 1st rows of the table 
-- 
with ranking as (
select *,
ROW_NUMBER() over 
(partition by country order by firstname) row_num
from Customer)
select * from ranking where row_num=1
-- Task 
--- join the table customer and order table 
SELECT * from customer 
inner join [order] on Customer.id = [order].id
-------  

--joining customers and order table
SELECT firstname, lastname, country, SUM(TotalAmount) AS total_amount_sum
FROM customer
INNER JOIN [Order] ON customer.id = [Order].id
GROUP BY firstname, lastname, country;
-----
-----
-----

SELECT c.FirstName, c.LastName, c.Country, SUM(TotalAmount)
FROM customer as c
INNER JOIN [order] ON c.id = [order].id
group by FirstName, LastName, Country;

----------

---

with ranking as (
 
select customer.id, customer.firstname, Customer.City, customer.country, sum([order].TotalAmount) as Total_Order_Amount, 
Row_number() over ( PARTITION BY country order by sum([order].TotalAmount) desc) ROW_NUM
from customer left join [order] on [order].customerId=customer.id 
group by customer.id,customer.firstname,customer.city, customer.country )

select * from ranking where row_num<6

------
-----

select firstname, lastname, country,
sum(TotalAmount) TotalAmount,
ROW_NUMBER() over(partition by country order by 
sum(TotalAmount) desc) Row_Num
from customer c
inner join [order] O on c.id = o.CustomerId
group by FirstName, LastName, Country


---
----
----windows functions example
Create TABLE rank_demo_3 (
	v VARCHAR(10)
);

INSERT INTO rank_demo_3(v)
VALUES('A'),('B'),('B'),('C'),('C'),('D'),('E');



SELECT
	v,
	RANK () OVER ( ORDER BY v ) rank_no, 
	ROW_NUMBER () OVER ( ORDER BY v ) row_no,
	dense_Rank () over (order by v) dense_no
FROM
	rank_demo;


----windows functions example
Create TABLE rank_demo_3 (
	v VARCHAR(10)
);

INSERT INTO rank_demo_3(v)
VALUES('A'),('B'),('B'),('C'),('C'),('D'),('E');



SELECT
	v,
	RANK () OVER ( ORDER BY v ) rank_no, 
	ROW_NUMBER () OVER ( ORDER BY v ) row_no,
	dense_Rank () over (order by v) dense_no,
	NTILE(6) over(order by v) ntile_no
FROM
	rank_demo_3;


-- Indexes 
-- Clustered indexes 
-- nono clustered indexes 
create index inx_customer_firstname
on customer 
(firstname)

create index idx_customer_country
on country
where country ('UK')