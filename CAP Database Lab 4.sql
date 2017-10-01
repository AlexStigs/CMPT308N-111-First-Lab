--Author: Alex Stigliano--
--Date Created: 9/25/17--

--#1: Get the cities of agents booking an order for a customer whose cid is 'c006'--
select city
from Agents
WHERE aid IN ( Select aid
		from Orders 
		WHERE cid = 'c006');
--#2: Get the distinct ids of products ordered through any agent who takes at least one order from a customer in Beijing, sorted by pid from highest to lowest.--
select cid, pid
from Orders
WHERE cid = 'c006'
ORDER BY pid DESC;

--#3: Get the ids and names of customers who did not place an order through agent a03--
select name, cid
from Customers
WHERE cid IN ( Select cid
		from Orders 
		WHERE aid != 'a03');
--#4: Get the ids of customers who ordered both product p01 and p07--
select cid, pid
from Orders
WHERE pid = 'p01' OR pid = 'p07';

--#5: Get the ids of products not ordered by any customers who placed any order through agents a02 or a03, in pid order from highest to lowest.--
select pid, cid, month
from Orders
WHERE aid != 'a02' AND aid != 'a03'
ORDER BY pid DESC;

--#6: Get the name, discount, and city for all customers who place orders through agents in Tokyo or New York--
select name, discountPct, city
from Customers
WHERE cid IN ( select cid
		from Orders 
		WHERE aid = 'a01' OR aid = 'a04');

--#7: Get all the customers who have the same discount as that of any cusomter in Duluth or London--
select *
from Customers
where discountPct IN ( select discountPct
			from Customers
			where discountPct = '10.00' OR discountPct = '8.50');
