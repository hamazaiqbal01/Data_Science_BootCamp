--  Q1 = Select all the customers whose last name starts with "S" and ending with "R"
SELECT *
FROM Customer
WHERE LastName LIKE 'S%R';

-- Q2 = Select all the customers whose phone contains ‘778’.

select * 
from Customer 
where Phone like '%778%'

-- Q3 = Select all the records from Product table where UnitPrice is greater than 15 and less than 30.select * from Product where [UnitPrice]>15 and [UnitPrice]<30-- Q4 = Select all the suppliers from Supplier table who contains Fax number.select * from Supplier where Fax is not NULL