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
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

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
SELECT SUM(Quantity), product, SUM(Quantity) *price AS revenue
FROM BIT_DB.FebSales
WHERE location = '548 Lincoln St, Seattle, WA 98101';

--How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?--
SELECT COUNT(DISTINCT customers.acctnum), AVG(quantity*price) AS avg_spend
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers 
ON Feb.orderid = customers.order_id
WHERE Feb.Quantity > 2
AND LENGTH(orderid) = 6
AND orderid <> 'Order ID';
