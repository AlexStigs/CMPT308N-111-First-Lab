select month, totalUSD
from Orders;


Select name, city
from Agents
WHERE name = 'Smith';


select pid, name, priceUSD
from Products
WHERE qty > 200010;


Select name, city
from Customers
WHERE city = 'Duluth';

Select name, city
from Agents
where city != 'New York' AND city != 'Duluth';

Select *
from Products
where city != 'Dallas' AND city != 'Duluth' AND priceUSD >= 1.00;

Select *
from Orders
where month = 'Mar' OR month = 'May';

Select *
from Orders
where month = 'Feb' AND totalUSD >= 500;

Select *
from Orders
where cid = 'c005';
