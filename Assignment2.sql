-- Kobe Anderson
-- Assignment 7/14/2021

-- Answer: The resulting tables from a written query 

-- What is the difference between Union and Union All?
-- Union will combine the tables but removes duplicates, Union all keeps the duplicates even if thye do not meet the condition 

-- What are the other Set Operators SQL Server has?
-- Intersect and minus

-- What is the difference between Union and Join?
-- joins combines different columns from diffent tables but Union combines rows 

-- What is the difference between INNER JOIN and FULL JOIN?
-- inner join will join entries that match a condition while full join joins all data regardless if they meet the condition

-- What is difference between left join and outer join
-- left join brings together the data from the left table that meets the condition while outer join will always put the data from the outer table if if the condition is not met

-- What is cross join?
-- cross join retrun all of the combinations of the two tables 

-- What is the difference between WHERE clause and HAVING clause?
-- having claused is used for grouping by groupby while where is used to filter data

-- Can there be multiple group by columns?
-- yes 

-- use Adventureworks
-- How many products can you find in the Production.Product table?
-- 504 products 
--select count(1) from Production.Product 

-- Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
-- select count(p.ProductSubcategoryID) "Product count" from Production.Product p group by p.ProductSubcategoryID having p.ProductSubcategoryID IS NOT NULL

-- How many Products reside in each SubCategory? Write a query to display the results with the following titles.
-- select count(p.ProductSubcategoryID) "CountedProducts",p.ProductSubcategoryID "ProductSubcategoryID"  from Production.Product p group by p.ProductSubcategoryID having p.ProductSubcategoryID IS NOT NULL

-- How many products that do not have a product subcategory.
-- zero
-- select count(p.ProductSubcategoryID) from Production.Product p group by p.ProductSubcategoryID having p.ProductSubcategoryID IS NULL

-- Write a query to list the summary of products quantity in the Production.ProductInventory table.
-- select sum(i.Quantity),i.ProductID from Production.ProductInventory i group by i.ProductID

-- Write a query to list the summary of products quantity in the Production.ProductInventory table.
-- select i.ProductID "ProductID", sum(i.Quantity) "TheSum" from Production.ProductInventory i group by i.ProductID

-- Write a query to list the summary of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
-- select i.Shelf "Shelf",i.ProductID "ProductID",sum(i.Quantity) "TheSum" from Production.ProductInventory i where i.LocationID = 40 group by i.ProductID,i.Shelf having sum(i.Quantity) < 100 

-- Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
-- select i.Shelf "Shelf",i.ProductID "ProductID",avg(i.Quantity) "TheAvg" from Production.ProductInventory i where i.LocationID = 10 group by i.ProductID,i.Shelf 

--Write query to see the average quantity of products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
-- select i.Shelf "Shelf",i.ProductID "ProductID",avg(i.Quantity) "TheAvg" from Production.ProductInventory i where i.LocationID = 10 and i.Shelf != 'N/A' group by i.ProductID,i.Shelf

-- List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.
-- select p.Color "Color", p.Class "Class", count(1) "TheCount",avg(p.ListPrice) "avgPrice" from Production.Product p where Class IS NOT NULL and Color IS NOT NULL group by Color,Class 

-- Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.
-- select c.Name "Country", p.Name "Province" from Person.CountryRegion c inner join Person.StateProvince p on c.CountryRegionCode = p.CountryRegionCode

-- Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.
-- select c.Name "Country", p.Name "Province" from Person.CountryRegion c  inner join Person.StateProvince p on c.CountryRegionCode = p.CountryRegionCode where c.Name in ('Germany','Canada')



Use Northwind
-- List all Products that has been sold at least once in last 25 years.
-- Select p.ProductName from Products p inner join [Order Details] od on od.ProductID = p.ProductID inner join [Orders] o on o.OrderID = od.OrderID where o.OrderDate between '07/14/1996' and '07/14/2021' group by p.ProductName

-- List top 5 locations (Zip Code) where the products sold most.
-- Select top 5 c.PostalCode "Zip", count(o.OrderID) "Orders" from Customers c inner join [Orders] o on o.CustomerID = c.CustomerID where c.PostalCode IS NOT NULL group by c.PostalCode order by count(o.OrderID) desc

--List top 5 locations (Zip Code) where the products sold most in last 20 years.
-- Select top 5 c.PostalCode "Zip", count(o.OrderID) "Orders" from Customers c inner join [Orders] o on o.CustomerID = c.CustomerID  where c.PostalCode IS NOT NULL and o.OrderDate between '07/14/2001' and '07/14/2021' group by c.PostalCode order by count(o.OrderID) desc

-- List city names which have more than 10 customers, and number of customers in that city
-- select c.City, count(c.CustomerID) from Customers c group by c.City having count(c.CustomerID) > 10

--List the names of customers who placed orders after 1/1/98 with order date.
-- Select c.ContactName,max(o.OrderDate) from Customers c inner join [Orders] o on o.CustomerID = c.CustomerID   where o.OrderDate >= '1/1/98' group by c.CustomerID

-- List the names of all customers with most recent order dates
-- Select c.ContactName,max(o.OrderDate) from Customers c inner join [Orders] o on o.CustomerID = c.CustomerID group by c.CustomerID

-- Display the names of all customers along with the count of products they bought
-- Select c.ContactName,count(o.CustomerID) from Customers c inner join [Orders] o on o.CustomerID = c.CustomerID group by c.CustomerID order by count(o.CustomerID) desc

-- Display the customer ids who bought more than 100 Products with count of products.
-- Select c.CustomerID,count(c.CustomerID) from Customers c inner join [Orders] o on o.CustomerID = c.CustomerID group by c.CustomerID having count(c.CustomerID) > 17 order by count(o.CustomerID) desc

-- List all of the possible ways that suppliers can ship their products. Display the results as below
-- select sh.CompanyName "Shipping Company Name", su.CompanyName "Supplier Company Name" from Shippers sh CROSS JOIN Suppliers su

-- Display the products order each day. Show Order date and Product Name.
-- Select p.ProductName,o.OrderDate from Products p inner join [Order Details] od on od.ProductID = p.ProductID inner join [Orders] o on od.OrderID = o.OrderID order by p.ProductName, o.OrderDate desc

-- Displays pairs of employees who have the same job title.
-- select distinct e.FirstName +' '+e.LastName, ed.FirstName +' '+ed.LastName, ed.Title from Employees e inner join Employees ed on ed.Title = e.Title

-- Display all the Managers who have more than 2 employees reporting to them.
-- select e.FirstName +' '+e.LastName "Name" from Employees e inner join  Employees ed on e.EmployeeID = ed.ReportsTo group by e.EmployeeID,e.FirstName,e.LastName having count(e.EmployeeID) > 2

-- Display the customers and suppliers by city. The results should have the following columns
-- select c.City,c.ContactName,c.CompanyName,'Customer' from Customers c Union select s.City,s.CompanyName,s.ContactName,'Supplier' from Suppliers s order by City

-- Question 28
-- select * from f1.t1 inner join f2.t2
-- the result would the the entries 2,3

-- Question 29
-- select * from f1.t1 outer join f2.t2
-- the result would the the entries 1,4
