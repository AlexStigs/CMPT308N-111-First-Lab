--Author: Alex Stigliano--
--Date Created: 10/2/17--

--#1: Show cities of agents booking an order through customers whose id is 'c006'. Use joins this time, not subqueries.--
Select city
from Agents JOIN Orders
ON Agents.aid = Orders.aid
WHERE cid = 'c006';

--#2: Show the ids of products ordered through any agent who makes at least one order for a customer in Beijing, sorted by pid from highest to lowest. Use joins, no subqueries--
Select Products.pid
from Products JOIN Orders
ON Products.pid = Orders.pid
WHERE cid = 'c006'
ORDER by Orders.pid DESC;

--#3: Show the names of the customers who have never placed an order. Use a subquery.--
Select name
from Customers
WHERE cid NOT IN (Select cid
		  from Orders);

--#4: Show the names of the customers who have never placed an order. Use an outer join.--
Select name
from Customers LEFT JOIN Orders 
ON Customers.cid = Orders.cid
WHERE Orders.cid is NULL;

--#5: Show the names of the customers who placed at least one order through an agent in their own city, along with the agent[s'] names.--
Select DISTINCT Customers.name, Agents.name
from Customers, Orders, Agents
WHERE Customers.city = Agents.city AND Customers.cid = Orders.cid AND Orders.aid = Agents.aid;

--#6: Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent.--
Select Customers.name, Agents.name, Agents.city
from Customers, Agents
WHERE Customers.city = Agents.city;

--#7: Show the name and city of customers who live in the city that makes the fewest different kinds of products. [Hint: use Count and group by on the Products table.]
Select city, name 
from Customers
WHERE city IN (
		Select City
		from Products
		GROUP BY City
		Order by COUNT(pid) ASC
		LIMIT 1
	     );