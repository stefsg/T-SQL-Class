-- Homework 3

/* 1. You have to create a report based on the tables Production.Product and Production.ProductCategory.
The report should contain the product name and the category name of each product. */

SELECT TOP 10 *
FROM [Production].[Product]

SELECT TOP 10 *
FROM [Production].[ProductCategory]

SELECT TOP 10 *
FROM [Production].[ProductSubcategory]

SELECT 
p.Name 'Product Name', 
pc.Name 'Product Category' 
FROM [Production].[Product] p
JOIN [Production].[ProductSubcategory] psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN [Production].[ProductCategory] pc
ON psc.ProductCategoryID = pc.ProductCategoryID;

/* 2. Write a query that returns all customers who placed at least one order, with detailed information about each one.
The tables are Sales.Customers, Sales.SalesOrderHeader and Sales.OrderDetails. */

SELECT TOP 10 *
FROM [Sales].[Customer]

SELECT TOP 10 *
FROM [Sales].[SalesOrderHeader]

SELECT TOP 10 *
FROM [Sales].[SalesOrderDetail]

SELECT  
s.CustomerID 'Customer ID',
s.StoreID 'Store ID',
soh.OrderDate 'Order Date',
soh.ShipDate 'Ship Date',
soh.PurchaseOrderNumber 'Purchase Order Number',
sod.OrderQty 'Order Quantity',
sod.UnitPrice 'Unit Price',
sod.LineTotal 'Total Price'
FROM [Sales].[Customer] s
JOIN [Sales].[SalesOrderHeader] soh
ON s.CustomerID = soh.CustomerID
JOIN [Sales].[SalesOrderDetail] sod
ON sod.SalesOrderID = soh.SalesOrderID

/* 3. You have to create a report based on the tables Production.ProductSubcategory and Production.ProductCategory.
The report should return every combination between the category name and the subcategory name. */

SELECT TOP 10 *
FROM [Production].[ProductCategory]

SELECT TOP 10 *
FROM [Production].[ProductSubcategory]

SELECT
p.Name 'Category Name',
c.Name 'Subcategory Name'
FROM  [Production].[ProductCategory] p
CROSS JOIN [Production].[ProductSubcategory] c
