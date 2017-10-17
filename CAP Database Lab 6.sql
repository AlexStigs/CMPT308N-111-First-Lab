--Author: Alex Stigliano--
--Date Created: 10/13/17--

--#1: Display the name and city of customers who live in any city that makes the most different kinds of products. [There are two cities that make the most different products. Return the name and city of customers from either one of those.]--
Select city, name 
from Customers
WHERE city IN (
		Select City
		from Products
		GROUP BY City
		Order by COUNT(pid) DESC
		LIMIT 1
	     );

--#2: Display the names of products whose priceUSD is at or above the average priceUSD, in reverse-alphabetical order.--
Select name
from Products
WHERE priceUSD >= (
	Select AVG(priceUSD)
	from Products
		  );

--#3: Display the customer name, pid ordered, and the total for all orders, sorted by total from low to high.--
Select Orders.cid, Orders.pid, Orders.totalUSD, Customers.name
from Orders
INNER JOIN Customers ON Orders.cid = Customers.cid
ORDER BY totalUSD ASC;

--#4: Display all customers names (in reverse alphabetical order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.--
Select Customers.name, COALESCE(SUM(Orders.quantity), 0) AS "Total Items Ordered"
from Orders
RIGHT OUTER JOIN Customers ON Orders.cid= Customers.cid
GROUP BY Customers.name
ORDER BY Customers.name DESC;

--#5: Display the names of all customers who bought products from agents based in Newark along with the names of the products they ordered, and the names of the agents who sold them.--
Select Customers.name, Products.name, Agents.name
from Orders
INNER JOIN Agents ON Orders.aid = Agents.aid
INNER JOIN Customers ON Orders.cid = Customers.cid
INNER JOIN Products ON Orders.pid = Products.pid
WHERE Customers.cid IN (
			Select cid
			from Orders
			INNER JOIN Agents ON Orders.aid = Agents.aid
			WHERE Agents.city = 'Newark'
			);

--#6: Write a query to check the accuracy of the totalUSD column in the Orders table. This means calculating Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD. Display all rows in Orders where Orders.totalUSD is incorrect, if any.--
Select *
from (
	Select Orders.*, Orders.quantity * Products.priceUSD * ( 1 - (discountPct/100)) AS Final_Price
	from Orders
	INNER JOIN Products ON Orders.pid = Products.pid
	INNER JOIN Customers ON Orders.cid = Customers.cid
	) as Finalprice_checker
WHERE totalUSD != Final_Price;

--#7: What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate. [Feel free to use the CAP database to make your points here.]--

--The difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN is that 