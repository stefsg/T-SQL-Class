-- Homework 2.1

-- 1. Retrieve the top 10 most expensive products in the 'Product' table.

SELECT TOP 10
ProductID,
Name,
ListPrice
FROM [AdventureWorks2012].[Production].[Product]
ORDER BY ListPrice DESC

-- 2. Find the total number of products for each product subcategory.

-- Version 1:

SELECT
ProductSubcategoryID AS Subcategory_ID,
COUNT(*) AS No_of_Prod
FROM [AdventureWorks2012].[Production].[Product] 
GROUP BY ProductSubcategoryID
ORDER BY ProductSubcategoryID

-- Version 2:

CREATE TABLE No_of_Prod_Each_Subcat
	(
    Subcategory_ID varchar(38),
    No_of_Prod tinyint,
	);

INSERT INTO No_of_Prod_Each_Subcat
VALUES (
NULL,
(SELECT COUNT(*)
	FROM [AdventureWorks2012].[Production].[Product] 
	WHERE ProductSubcategoryID IS NULL
))

DECLARE @Counter int; 
SET @Counter = 1;

WHILE (@Counter <= (SELECT MAX(ProductSubcategoryID) FROM [AdventureWorks2012].[Production].[Product]))
BEGIN
	INSERT INTO No_of_Prod_Each_Subcat
	VALUES (
	(CONVERT(VARCHAR, @Counter)),
	(
	SELECT COUNT(ProductSubcategoryID)
	FROM Production.Product
	WHERE ProductSubcategoryID = @Counter
	))
    SET @Counter = @Counter + 1
END

SELECT *
FROM No_of_Prod_Each_Subcat

-- 3. List all products that have a standard cost between $100 and $500.

SELECT
ProductID,
Name,
StandardCost
FROM [AdventureWorks2012].[Production].[Product] 
WHERE StandardCost BETWEEN 100 AND 500
ORDER BY StandardCost

-- 4. Retrieve the top 5 product subcategories with the highest average list price.

-- Version 1:

SELECT TOP 5
ProductSubcategoryID,
AVG(ListPrice) AS Highest_AVG_ListPrice
FROM [AdventureWorks2012].[Production].[Product] 
GROUP BY ProductSubcategoryID
ORDER BY Highest_AVG_ListPrice DESC

-- Version 2:

CREATE TABLE Top5_Cat
	(
    Subcategory_ID varchar(38),
    Highest_AVG_ListPrice decimal(10,2),
	);

INSERT INTO Top5_Cat
VALUES (
NULL,
(SELECT AVG(ListPrice)
	FROM [AdventureWorks2012].[Production].[Product] 
	WHERE ProductSubcategoryID IS NULL
))

DECLARE @Counter2 int; 
SET @Counter2 = 1;

WHILE (@Counter2 <= (SELECT MAX(ProductSubcategoryID) FROM [AdventureWorks2012].[Production].[Product]))
BEGIN

INSERT INTO Top5_Cat
	VALUES (
	(CONVERT(VARCHAR, @Counter2)),
	(
	SELECT AVG(ListPrice)
	FROM [AdventureWorks2012].[Production].[Product] 
	WHERE ProductSubcategoryID = @Counter2
	))
    SET @Counter2  = @Counter2  + 1

END

SELECT TOP 5 *
FROM Top5_Cat

-- 5. Find the total number of discontinued products.

SELECT 
COUNT(*) AS No_Disc_Prod
FROM [AdventureWorks2012].[Production].[Product] 
WHERE DiscontinuedDate IS NOT NULL