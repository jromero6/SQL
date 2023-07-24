--For my final project I was provided with a new database and was asked to answer the following questions--

-- Show Customers (their full names, customer ID, and country) who are not in the US.--
SELECT FirstName, LastName, CustomerId, Country 
FROM chinook.customers 
WHERE Country != "USA";

-- Show only the Customers from Brazil.--
SELECT * 
FROM chinook.customers 
WHERE Country = "Brazil";

-- Find the Invoices of customers who are from Brazil.--
SELECT cust.FirstName, cust.LastName, inv.InvoiceId, inv.BillingCountry, inv.InvoiceDate
FROM chinook.invoices AS inv 
LEFT JOIN chinook.customers AS cust 
ON inv.CustomerId = cust.CustomerId 
WHERE inv.BillingCountry = "Brazil";

-- Show the Employees who are Sales Agents.--
SELECT * 
FROM chinook.Employees
WHERE Title = "Sales Support Agent";

-- Find a unique/distinct list of billing countries from the Invoice table.-- 
SELECT DISTINCT BillingCountry 
FROM chinook.Invoices;

-- Provide a query that shows the invoices associated with each sales agent. -- 
SELECT emp.LastName, emp.Firstname, inv.InvoiceId
FROM chinook.Employees AS emp 
JOIN chinook.Customers AS cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId;

-- Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.--
SELECT emp.LastName, emp.Firstname, cust.FirstName, cust.LastName, cust.Country, inv.total
FROM chinook.employees AS emp 
JOIN chinook.Customers AS cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId;

-- How many Invoices were there in 2009?--
SELECT COUNT(*)
FROM chinook.Invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

-- What are the total sales for 2009?--
SELECT SUM(Total)
FROM chinook.Invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

-- Write a query that includes the purchased track name with each invoice line ID.--
SELECT t.Name, i.InvoiceLineId
FROM chinook.Invoice_items AS i
JOIN chinook.Tracks AS t 
ON i.TrackId = t.TrackId;

-- Write a query that includes the purchased track name AND artist name with each invoice line ID.--
SELECT ar.name AS Artist, t.Name AS Track, i.InvoiceLineId
FROM chinook.Invoice_items AS i
LEFT JOIN chinook.tracks AS t 
ON i.TrackID = t.TrackID
INNER JOIN chinook.albums AS a
ON a.AlbumID = t.AlbumID
LEFT JOIN chinook.artists AS ar
ON ar.ArtistID = a.ArtistID;

-- Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.--
SELECT t.Name AS 'Track Name', a.Title AS 'Album Title', m.Name AS 'Media Type', g.Name AS 'Genre'
FROM chinook.tracks AS t
JOIN chinook.Albums AS a 
on a.AlbumId = t.AlbumId
JOIN chinook.Media_Types AS m
on m.MediaTypeId = t.MediaTypeId
JOIN chinook.Genres AS g
on g.GenreId = t.GenreId;

-- Show the total sales made by each sales agent.--
SELECT emp.FirstName, emp.LastName, ROUND(SUM(Inv.Total), 2) AS 'Total Sales' 
FROM chinook.Employees AS emp
JOIN chinook.Customers AS cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices AS Inv 
ON Inv.CustomerId = cust.CustomerId
WHERE emp.Title = 'Sales Support Agent' 
GROUP BY emp.FirstName;

-- Which sales agent made the most dollars in sales in 2009?-- 
SELECT emp.FirstName, emp.LastName, ROUND(SUM(Inv.Total), 2) AS 'Total Sales' 
FROM chinook.Employees AS emp
JOIN chinook.Customers AS cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices AS Inv 
ON Inv.CustomerId = cust.CustomerId
WHERE emp.Title = 'Sales Support Agent' 
AND Inv.InvoiceDate LIKE '2009%' 
GROUP BY emp.FirstName
ORDER BY (round(sum(Inv.Total), 2))  DESC LIMIT 1;
