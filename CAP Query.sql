--Author: Alex Stigliano--
--Created 9/14/17--

--#1: Order number and total dollars of all orders--
Select month, totalUSD
from Orders;

--#2: Name and cities where agents named Smith are located--
Select name, city
from Agents
WHERE name = 'Smith';

--#3: ID, Name, and price of products with quantity more than 200,010--
Select pid, name, priceUSD
from Products
WHERE qty > 200010;

--#4: Names and cities of customers in Duluth--
Select name, city
from Customers
WHERE city = 'Duluth';

--#5: Names of agents that are not located in New York and Duluth--
Select name, city
from Agents
where city != 'New York' AND city != 'Duluth';

--#6: All data of products that cost one dollar and more, and not in Dallas nor Duluth--
Select *
from Products
where city != 'Dallas' AND city != 'Duluth' AND priceUSD >= 1.00;

--#7: All orders in March or May--
Select *
from Orders
where month = 'Mar' OR month = 'May';

--#8: All orders in Februrary that are 500 dollars and more--
Select *
from Orders
where month = 'Feb' AND totalUSD >= 500;

--#9: All orders from the customer with the cid of C005--
Select *
from Orders
where cid = 'c005';
