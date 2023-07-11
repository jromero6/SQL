-- The following queries where made to answer questions about a sales DB --

--How many orders were placed in January?--
SELECT COUNT(orderID)
FROM BIT_DB.JanSales
WHERE length(orderID) = 6
AND orderID <> 'Order ID';

--How many of those orders were for an iPhone?--
SELECT COUNT(orderID)
FROM BIT_DB.JanSales
WHERE length(orderID) = 6
AND orderID <> 'Order ID'
AND product = 'iPhone';

--Select the customer account numbers for all the orders that were placed in February.--
SELECT DISTINCT customers.acctnum
FROM BIT_DB.FebSales
JOIN BIT_DB.customers
ON Febsales.orderID = customers.order_id
WHERE length(orderID) = 6 
AND orderID <> 'Order ID';

--Which product was the cheapest one sold in January, and what was the price?--
SELECT DISTINCT product, MIN(price) AS price
FROM BIT_DB.JanSales
GROUP BY product, price
ORDER BY price ASC LIMIT 1;

--What is the total revenue for each product sold in January?--
SELECT product, SUM(quantity)*price as revenue
FROM BIT_DB.JanSales
GROUP BY product;

--Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?--
SELECT SUM(Quantity), product, SUM(Quantity)*price AS revenue
FROM BIT_DB.FebSales
WHERE location = '548 Lincoln St, Seattle, WA 98101';

--How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?--
SELECT COUNT(DISTINCT customers.acctnum), AVG(quantity*price) AS avg_spend
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers 
ON Feb.orderID = customers.order_id
WHERE Feb.Quantity > 2
AND LENGTH(orderID) = 6
AND orderID <> 'Order ID';

--List all the products sold in Los Angeles in February, and include how many of each were sold.--
SELECT DISTINCT Product, SUM(quantity)
FROM BIT_DB.FebSales 
WHERE location LIKE '%Los Angeles%'
GROUP BY product;

--Which locations in New York received at least 3 orders in January, and how many orders did they each receive?--
SELECT DISTINCT location, COUNT(orderID)
FROM BIT_DB.JanSales
WHERE location LIKE '%NY%'
AND length(orderid) = 6 
AND orderid <> 'Order ID'
GROUP BY location
HAVING COUNT(orderID) > 2;

-- How many of each type of headphone were sold in February? --
SELECT Product, SUM(Quantity) AS Quantity
FROM BIT_DB.FebSales
WHERE Product LIKE '%headphones%'
GROUP BY Product;

-- What was the average amount spent per account in February? --
SELECT SUM(Quantity*price)/COUNT(customers.acctnum) AS avg_spent
FROM BIT_DB.FebSales AS feb
LEFT JOIN BIT_DB.customers AS customers 
ON feb.orderID = customers.order_id
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

-- What was the average quantity of products purchased per account in February? --
SELECT SUM(Quantity)/COUNT(customers.acctnum) AS avg_purchase
FROM BIT_DB.FebSales AS feb
LEFT JOIN BIT_DB.customers AS customers 
ON feb.orderID = customers.order_id
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

-- Which product brought in the most revenue in January and how much revenue did it bring in total?--
SELECT product, SUM(Quantity*price) AS revenue
FROM BIT_DB.JanSales 
GROUP BY product
ORDER BY SUM(Quantity*price) DESC
LIMIT 1;
