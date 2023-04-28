-- Homework 4

use AdventureWorks2012;

-- Problem 1: List all products and their suppliers.

SELECT TOP 10 *
FROM [Production].[Product]

SELECT TOP 10 *
FROM [Purchasing].[ProductVendor]

SELECT TOP 10 *
FROM [Purchasing].[Vendor]

SELECT
p.ProductID,
p.Name ProductName,
v.Name SupplierName
FROM [Production].[Product] p
JOIN [Purchasing].[ProductVendor] pv
ON p.ProductID = pv.ProductID
JOIN [Purchasing].[Vendor] v
ON pv.BusinessEntityID = v.BusinessEntityID

-- Problem 2: List all orders placed by a specific customer (e.g., CustomerID = 29825) along with the order details.

SELECT TOP 10 *
FROM  [Production].[Product]

SELECT TOP 10 *
FROM  [Sales].[SalesOrderDetail]

SELECT TOP 10 *
FROM  [Sales].[SalesOrderHeader]

SELECT
sod.SalesOrderID,
soh.OrderDate,
p.ProductID,
p.Name ProductName,
sod.OrderQty,
sod.UnitPrice,
sod.LineTotal
FROM
[Sales].[SalesOrderDetail] sod
JOIN [Sales].[SalesOrderHeader] soh
ON sod.SalesOrderID = soh.SalesOrderID
JOIN [Production].[Product] p
ON p.ProductID = sod.ProductID
WHERE soh.CustomerID = 29825

-- Problem 3: List all customers and their respective sales territories.

SELECT TOP 10 *
FROM [Person].[Person]

SELECT TOP 10 *
FROM [Sales].[Customer]

SELECT TOP 10 *
FROM [Sales].[SalesTerritory]

SELECT 
sc.CustomerID,
p.FirstName FirstName,
p.LastName LastName,
sst.Name TerritoryName
FROM [Sales].[Customer] sc
JOIN [Sales].[SalesTerritory] sst
ON sc.TerritoryID = sst.TerritoryID
JOIN [Person].[Person] p
ON sc.PersonID = p.BusinessEntityID

-- Problem 4: List all products with their subcategories and categories.

SELECT TOP 10 *
FROM [Production].[Product]

SELECT TOP 10 *
FROM [Production].[ProductCategory]

SELECT TOP 10 *
FROM [Production].[ProductSubcategory]

SELECT
p.ProductID,
p.Name ProductName,
ps.Name SubcategoryName,
pc.Name CategoryName
FROM [Production].[Product] p
JOIN [Production].[ProductSubcategory] ps
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN [Production].[ProductCategory] pc
ON pc.ProductCategoryID = ps.ProductCategoryID

-- Problem 5: List all vendors and their respective purchase order approvers.

SELECT TOP 10 *
FROM [Person].[Person]

SELECT TOP 10 *
FROM [Person].[EmailAddress]

SELECT TOP 10 *
FROM [Purchasing].[Vendor]

SELECT TOP 10 *
FROM [Purchasing].[PurchaseOrderHeader]

SELECT DISTINCT
pv.BusinessEntityID,
pv.Name VendorName,
p.FirstName,
p.LastName,
pe.EmailAddress
FROM [Purchasing].[PurchaseOrderHeader] poh
JOIN [Purchasing].[Vendor] pv
ON poh.VendorID = pv.BusinessEntityID
JOIN Person.Person p
ON poh.EmployeeID = p.BusinessEntityID
JOIN Person.EmailAddress pe
ON p.BusinessEntityID = pe.BusinessEntityID