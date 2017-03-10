


/* 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US. */
/* SELECT CustomerId, FirstName, LastName, Country FROM Customer
WHERE Country != 'USA' */

/* 2. Provide a query only showing the Customers from Brazil. */
/* SELECT * FROM Customer WHERE Country = 'Brazil' */

/* 3. Provide a query showing the Invoices of customers who are from Brazil.
The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country. */
/* SELECT FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry
FROM Customer c, Invoice i
WHERE c.Country = 'Brazil' */

/* 4. Provide a query showing only the Employees who are Sales Agents. */
/* SELECT FirstName, LastName, Title FROM Employee
WHERE Title = 'Sales Support Agent' */

/* 5. Provide a query showing a unique list of billing countries from the Invoice table. */
/* SELECT DISTINCT BillingCountry FROM Invoice */

/* 6. Provide a query showing the invoices of customers who are from Brazil. */
/* SELECT c.FirstName, c.LastName, i.*
FROM Invoice i
JOIN Customer c
ON i.CustomerId = c.CustomerId
WHERE c.Country = 'Brazil'
ORDER BY c.CustomerId */

/* 7. Provide a query that shows the invoices associated with each sales agent.
The resultant table should include the Sales Agent's full name. */
/* SELECT Employee.FirstName, Employee.LastName, Invoice.*
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
ORDER BY Employee.FirstName */

/* 8. Provide a query that shows the Invoice Total, Customer name,
Country and Sale Agent name for all invoices and customers. */
/* SELECT Invoice.Total AS 'Invoice Total',  Customer.FirstName, Customer.LastName, Customer.Country, Employee.FirstName, Employee.LastName
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
ORDER BY Customer.FirstName */

/* 9. How many Invoices were there in 2009 and 2011? */
/* SELECT COUNT(*) AS 'Invoices in 2009 and 2011'
FROM Invoice
WHERE InvoiceDate LIKE '%2009%' OR InvoiceDate LIKE '%2011%' */

/* What are the respective total sales for each of those years? */
/* SELECT COUNT(*) AS 'Invoices in 2011', SUM(Invoice.Total) AS 'Total Sales'
FROM Invoice
WHERE InvoiceDate LIKE '%2011%'; */

/* 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37. */
/* SELECT COUNT(InvoiceLineId) AS '# of items for Inv 37' FROM InvoiceLine
WHERE InvoiceLine.InvoiceId = 37 */

/* 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
HINT: GROUP BY */
/* SELECT COUNT(InvoiceLine.InvoiceLineId) AS 'Lines', Invoice.InvoiceId
FROM InvoiceLine
JOIN Invoice
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
GROUP BY Invoice.InvoiceId */

/* 12. Provide a query that includes the track name with each invoice line item. */
/* SELECT InvoiceLine.*, Track.Name
FROM InvoiceLine
JOIN Track
ON Track.TrackId = InvoiceLine.TrackId */

/* 13. Provide a query that includes the purchased track name AND artist name with each invoice line item. */
/* SELECT InvoiceLine.*, Track.Name AS 'Track', Artist.Name AS 'Artist'
FROM InvoiceLine
JOIN Track
ON Track.TrackId = InvoiceLine.TrackId
JOIN Album
ON Track.AlbumId = Album.AlbumId
JOIN Artist
ON Album.ArtistId = Artist.ArtistId */

/* 14. Provide a query that shows the # of invoices per country. HINT: GROUP BY */
/* SELECT Invoice.BillingCountry, COUNT(Invoice.InvoiceId) AS '# of invoices' FROM Invoice
GROUP BY Invoice.BillingCountry */

/* 15. Provide a query that shows the total number of tracks in each playlist.
The Playlist name should be include on the resultant table. */
/* SELECT Playlist.Name AS 'Playlist', COUNT(Track.Name) AS '# of Tracks'
FROM Playlist
JOIN PlaylistTrack
ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track
ON PlaylistTrack.TrackId = Track.TrackId
GROUP BY Playlist.Name */

/* 16. Provide a query that shows all the Tracks, but displays no IDs.
The resultant table should include the Album name, Media type and Genre. */
/* SELECT Track.Name AS 'Track', Album.Title AS 'Album', MediaType.Name AS 'Media type', Genre.Name AS 'Genre'
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId
JOIN Genre ON Track.GenreId = Genre.GenreId */

/* 17. Provide a query that shows all Invoices but includes the # of invoice line items. */
/* SELECT Invoice.*,  COUNT(InvoiceLine.InvoiceId) AS '# of Invoice Items'
FROM Invoice
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY Invoice.InvoiceId */

/* 18. Provide a query that shows total sales made by each sales agent. */
/* SELECT Employee.FirstName, Employee.LastName, SUM(Invoice.Total) AS 'Total Sales'
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName */

/* 19. Which sales agent made the most in sales in 2009? */
/* SELECT SUM(Invoice.Total) AS 'Total Sales in 2009', Employee.FirstName, Employee.LastName
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate LIKE '%2009%'
GROUP BY Employee.FirstName */
/* Steve Johnson */

/* 20. Which sales agent made the most in sales in 2010? */
/* SELECT SUM(Invoice.Total) AS 'Total Sales in 2010', Employee.FirstName, Employee.LastName
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate LIKE '%2010%'
GROUP BY Employee.FirstName */
/* Jane Peacock */

/* 21. Which sales agent made the most in sales over all? */
/* SELECT SUM(Invoice.Total) AS 'Total Sales', Employee.FirstName, Employee.LastName
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName */
/* Jane Peacock */

/* 22. Provide a query that shows the # of customers assigned to each sales agent. */
/* SELECT COUNT(Customer.CustomerId), Employee.FirstName, Employee.LastName
FROM Customer
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.EmployeeId */

/* 23. Provide a query that shows the total sales per country. Which country's customers spent the most? */
/* SELECT SUM(Invoice.Total) AS 'Total Sales', Invoice.BillingCountry AS 'Country' FROM Invoice
GROUP BY Invoice.BillingCountry
ORDER BY SUM(Invoice.Total) */

/* 24. Provide a query that shows the most purchased track of 2013. */
/* SELECT COUNT(InvoiceLine.TrackId) AS '# of times purchased', Track.TrackId, Track.Name AS 'Track Name', Invoice.InvoiceDate FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
WHERE Invoice.InvoiceDate LIKE '%2013%'
GROUP BY Track.Name
ORDER BY COUNT(InvoiceLine.TrackId) DESC */

/* 25. Provide a query that shows the top 5 most purchased tracks over all. */
/* SELECT COUNT(InvoiceLine.TrackId) AS '# of times purchased', Track.TrackId, Track.Name AS 'Track Name' FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Track.Name
ORDER BY COUNT(InvoiceLine.TrackId) DESC */

/* 26. Provide a query that shows the top 3 best selling artists. */
/* SELECT InvoiceLine.*, COUNT(Artist.ArtistId) AS '# of tracks sold', Artist.Name AS 'Artist' FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.ArtistId) DESC */

/* 27. Provide a query that shows the most purchased Media Type. */
/* SELECT InvoiceLine.*, COUNT(MediaType.MediaTypeId) AS '# of each type', MediaType.Name AS 'Media type' FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId
GROUP BY MediaType.Name
ORDER BY MediaType.MediaTypeId */
