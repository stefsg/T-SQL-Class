-- A. String Functions

-- 1. REVERSE

SELECT TOP 3
LastName,
Reverse(LastName) 'Reverse'
FROM [Person].[Person]

-- Result:
-- 1 Abbas	sabbA
-- 2 Abel	lebA
-- 3 Abercrombie	eibmorcrebA

-- 2. CONCAT

SELECT TOP 3
FirstName,
LastName,
Concat(FirstName, LastName) 'Concat'
FROM [Person].[Person]

-- Result:
-- 1 Syed	Abbas	SyedAbbas
-- 2 Catherine	Abel	CatherineAbel
-- 3 Kim	Abercrombie	KimAbercrombie

-- 3. LOWER

SELECT TOP 3
FirstName,
Lower(FirstName) 'Lower'
FROM [Person].[Person]

-- Result:
-- 1 Syed	syed
-- 2 Catherine	catherine
-- 3 Kim	kim

-- 4. REPLACE

SELECT TOP 1
FirstName,
Replace(FirstName, 'Syed', 'Abcd') 'Replace'
FROM [Person].[Person]

-- Result:
-- 1 Syed	Abcd

-- 5. TRIM 

SELECT TOP 3
LastName,
TRIM ('a' FROM LastName) 'Trim'
FROM [Person].[Person]

-- Result:
-- 1 Abbas	bbas
-- 2 Abel	bel
-- 3 Abercrombie	bercrombie

-- 6. SUBSTRING

SELECT TOP 3
FirstName,
SUBSTRING(FirstName, 1, 1) 'Initial'
FROM [Person].[Person]

-- Result:
-- 1 Syed	S
-- 2 Catherine	C
-- 3 Kim	K

-- 7. TRANSLATE

SELECT TOP 2
LastName,
Translate(LastName, 'a', '*') 'Translation'
FROM [Person].[Person]

-- Resul:
-- 1 Abbas	*bb*s
-- 2 Abel	*bel

-- 8. CHAR

SELECT TOP 3
FirstName,
LastName,
FirstName + CHAR(42) + LastName 'Result'
FROM [Person].[Person]

-- Result:
-- 1 Syed	Abbas	Syed*Abbas
-- 2 Catherine	Abel	Catherine*Abel
-- 3 Kim	Abercrombie	Kim*Abercrombie

-- 9. UPPER

SELECT TOP 3
FirstName,
Upper(FirstName) 'Upper'
FROM [Person].[Person]

-- Result:
-- 1 Syed	SYED
-- 2 Catherine	CATHERINE
-- 3 Kim	KIM

-- 10. LEN

SELECT TOP 3
FirstName,
Len(FirstName) 'Lenght'
FROM [Person].[Person]

-- Result:
-- 1 Syed	4
-- 2 Catherine	9
-- 3 Kim	3

-- B. Date and time functions 

-- 1. DATEADD

SELECT TOP 1
DueDate,
DATEADD(year, 1, DueDate) '1Y Later'
FROM [Purchasing].[PurchaseOrderDetail]

-- Result:
-- 1 2011-04-30 00:00:00.000	2012-04-30 00:00:00.000

-- 2. DATENAME

SELECT TOP 1
DueDate,
DATENAME(month, DueDate) 'Name of Month'
FROM [Purchasing].[PurchaseOrderDetail]

-- Result:
-- 1 2011-04-30 00:00:00.000	April

-- 3. YEAR

SELECT TOP 1
DueDate,
YEAR(DueDate) 'Year'
FROM [Purchasing].[PurchaseOrderDetail]

-- 4. ISDATE

SELECT TOP 1
DueDate,
'Yes' AS 'Is Date?'
FROM [Purchasing].[PurchaseOrderDetail]
WHERE ISDATE(DueDate) = 1

-- Result:
-- 1 2011-04-30 00:00:00.000	Yes

-- 5. GETDATE

SELECT GETDATE()

-- 1 2023-05-06 00:08:26.407

-- 6. DATEDIFF

SELECT TOP 1 
DueDate,
GETDATE() 'Today',
DATEDIFF(year, DueDate, GETDATE()) 'Time Difference (Y)'
FROM [Purchasing].[PurchaseOrderDetail]

-- 7. EOMONTH

SELECT EOMONTH(GETDATE()) 'Last Date of this Month'

-- Result:
-- 1 2023-05-31

-- 8. DATETRUNC

SELECT DATETRUNC (year, GETDATE())

-- Result:
-- 1 2023-01-01 00:00:00.000

-- 9. DATEFROMPARTS

SELECT DATEFROMPARTS (2100, 12, 31) 'Apocalypse Date'

-- Result:
-- 1 2100-12-31

-- 10. GETUTCDATE()

SELECT GETUTCDATE() 'UTC Date'

-- Result:
-- 1 2023-05-05 21:20:13.983












