-- Kobe Anderson
--Assignment 7/13/2021

Use AdventureWorks
-- Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter. 
select p.ProductID,p.Name,p.Color,p.ListPrice from Production.Product p

-- Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are 0 for the column ListPrice
select p.ProductID,p.Name,p.Color,p.ListPrice from Production.Product p where ListPrice = 0

-- Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are rows that are NULL for the Color column.
select p.ProductID,p.Name,p.Color,p.ListPrice from Production.Product p where Color IS NULL

-- Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.
select p.ProductID,p.Name,p.Color,p.ListPrice from Production.Product p where Color IS NOT NULL

-- Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
select p.ProductID,p.Name,p.Color,p.ListPrice from Production.Product p where Color IS NOT NULL and ListPrice > 0

-- Generate a report that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color.
select p.Name,p.Color from Production.Product p where Color IS NOT NULL 

-- Write a query that generates the following result set  from Production.Product:
select CONCAT('NAME:'+p.Name ,' -- COLOR:' + p.Color) from Production.Product p where Color IS NOT NULL 

-- Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500
select p.ProductID,p.Name from Production.Product p where ProductID between 400 and 500

-- Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table restricted to the colors black and blue
select p.ProductID,p.Name,p.Color from Production.Product p where Color in ('black','blue')

-- Write a query to generate a report on products that begins with the letter S. 
select * from Production.Product p where Name like 'b%'

--Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Order the result set by the Name column. 
select p.Name, p.ListPrice from Production.Product p order by name

-- Write a query that retrieves the columns Name and ListPrice from the Production.Product table.Order the result set by the Name column. The products name should start with either 'A' or 'S'
select p.Name, p.ListPrice from Production.Product p where name like '[as]%' order by name

-- Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column.
select * from Production.Product p where name like '[spo]%' and name not like '%k%' order by name

--Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner
select distinct Color from Production.Product p order by color desc

-- Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product table. Format and sort so the result set accordingly to the following. We do not want any rows that are NULL.in any of the two columns in the result.
select distinct p.Color,p.ProductSubcategoryID from Production.Product p where Color IS NOT NULL and ProductSubcategoryID is not null order by ProductSubcategoryID desc

-- Something is “wrong” with the WHERE clause in the following query. We do not want any Red or Black products from any SubCategory than those with the value of 1 in column ProductSubCategoryID, unless they cost between 1000 and 2000.
SELECT ProductSubCategoryID, LEFT([Name],35) AS [Name], Color, ListPrice FROM Production.Product WHERE  ListPrice BETWEEN 1000 AND 2000 AND Color IN ('Black','Red') AND ProductSubcategoryID = 1 ORDER BY ProductID

-- Final Question 
select distinct p.ProductSubcategoryID,p.Name,p.Color,p.ListPrice from Production.Product p
where Color in ('black','red','yellow','silver') and 
name like '[hrm]%' and
p.ProductSubcategoryID <= 14 and
p.ProductSubcategoryID IS NOT NULL and 
ListPrice between 538 and 170099
order by p.ProductSubcategoryID desc