-- INNER JOIN: Customers with Orders
SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

-- LEFT JOIN: Customers without Orders
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- Revenue per Product
SELECT 
    t.Name AS Product,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY Revenue DESC;

-- Revenue per Category
SELECT 
    g.Name AS Category,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;

-- Sales Between Dates Example
SELECT 
    i.InvoiceDate,
    SUM(i.Total) AS Sales
FROM Invoice i
WHERE i.InvoiceDate BETWEEN '2012-01-01' AND '2013-12-31'
GROUP BY i.InvoiceDate;
