--  Q1 = Select all the customers whose last name starts with "S" and ending with "R"
SELECT *
FROM Customer
WHERE LastName LIKE 'S%R';

-- Q2 = Select all the customers whose phone contains �778�.

select * 
from Customer 
where Phone like '%778%'

-- Q3 = Select all the records from Product table where UnitPrice is greater than 15 and less than 30.