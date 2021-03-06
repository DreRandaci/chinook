# chinook
In this repo, I got to learn some basic SQL by interacting with the Chinook database (https://chinookdatabase.codeplex.com/)

### ERD
I started off by mapping out all of the complex relationships in an ERD

![chinook-erd](https://cloud.githubusercontent.com/assets/23462252/23724709/59d83bb0-0413-11e7-935c-b20bee8b31cc.jpg)

### Queries
I then used the SQL language to make 27 different queries to return various data points.
These can be found in the chinook-queries.sql file.
I used DB browser to interact with the database.
#### Query Example
Which sales agent made the most in sales over all?
```
SELECT SUM(Invoice.Total) AS 'Total Sales', Employee.FirstName, Employee.LastName
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName
```

### Tech I utilized
![sql_sqlite](https://cloud.githubusercontent.com/assets/23462252/25537966/5ab4c434-2c06-11e7-9210-f91717a75a8c.png)

![images](https://cloud.githubusercontent.com/assets/23462252/25538038/a9bbb4fc-2c06-11e7-92ed-ffd4d8bb88d8.png)
