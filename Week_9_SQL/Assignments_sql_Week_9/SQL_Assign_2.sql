-- Assignment Day 2


--Q1 = Write a query to show the customers names with totalAmount spent order by TotalAmount desc.  
SELECT c.firstname, c.lastname, c.country, SUM(o.TotalAmount) AS total_amount_sum
FROM customer c
INNER JOIN [Order] o ON c.id = o.customerid
GROUP BY c.firstname, c.lastname, c.country
ORDER BY total_amount_sum DESC;

-- Q2 = Write a sql query to insert the following data in customer table. 
--      Name Jhon Doe, City: Paris Country: France, Phone: 898 0975 124


insert into Customer( FirstName, LastName, City, Country, Phone)
Values('Jhon' , 'Doe', 'Paris', 'France', 8980975124)

select * from Customer;

-- Q3 =   Write a query to update phone to ‘987 3487 9879’, city to ‘London’ and Country to ‘UK’ in 
--        Customer table where ID is 45.

UPDATE Customer
SET phone = '987 3487 9879',
    city = 'London',
    Country = 'UK'
WHERE ID = 45;

select * from Customer;

-- Write a query to get the customer name where totalAmount spent is greater than 10000, -- The output should be as follows: output should be FirstName, LastName, SUM(Total Amount) SELECT FirstName, LastName, SUM(TotalAmount) AS TotalAmountSum
FROM Customer
INNER JOIN [Order] ON Customer.ID = [Order].CustomerID
GROUP BY FirstName, LastName
HAVING sum(TotalAmount) > 10000;













