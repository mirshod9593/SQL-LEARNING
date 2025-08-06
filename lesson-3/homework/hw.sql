
-- HOMEWORK LESSON-3

-- 1- SAVOLGA JAVOB

--BULK INSERT in SQL Server
--BULK INSERT is a high-performance T-SQL statement used to import large amounts of data from external 
--files directly into SQL Server tables. It's one of the fastest ways to load data into SQL Server.
-- 2- SAVOLGA JAVOB

 --JSON (JavaScript Object Notation),XML (eXtensible Markup Language),TXT (Tab-Delimited Text Files), CSV (Comma-Separated Values)

 -- 3 - SAVOLGA JAVOB
 CREATE TABLE PRODUCTS (PRODUCT_ID INT PRIMARY KEY, PRODUCT_NAME VARCHAR (50),PRICE DECIMAL(10,2))
 -- 4-SAVOLGA JAVOB
 INSERT INTO PRODUCTS VALUES (1,'PHONE',123.23),(2,'POTATOES',23.34),(3,'TOMATOES',12.01)

 -- 5- SAVOLGA JAVOB 
NULL
Definition: Represents the absence of a value or unknown data,
NOT NULL
Definition: A constraint that requires a column to always contain a value,

--6- SAVOLGA JAVOB
ALTER TABLE Products 
ADD CONSTRAINT UK_Products_Product_Name 
UNIQUE (Product_Name);

-- 7-SAVOLGA JAVOB
 Single-line Comments (--)
sql-- Single-line comment: Query to find low stock products
SELECT ProductName, StockQuantity 
FROM Inventory 
WHERE StockQuantity < 50;    -- Filter for products needing reorder

-- 8-SAVOLGA JAVOB

ALTER TABLE PRODUCTS ADD  CATEGORY_ID INT;
--9- SAVOLGA JAVOB

CREATE TABLE CATEGORIES (CATEGORY_ID INT PRIMARY KEY, CATEGORY_NAME VARCHAR(50) UNIQUE NOT NULL)

-- 10- SAVOLGA JAVOB
IDENTITY is a SQL Server property that automatically generates unique sequential numbers for a column, typically used for primary keys.
-- 11 -SAVOLGA JAVOB;

BULK INSERT Products
FROM 'C:\Data\products_data.txt'
WITH (
    FIELDTERMINATOR = '\t',         -- Tab-delimited fields
    ROWTERMINATOR = '\r\n',         -- Windows line endings
    FIRSTROW = 1,                   -- Start from first row (no header)
    TABLOCK,                        -- Table lock for better performance
    BATCHSIZE = 1000,              -- Process in batches of 1000 rows
    MAXERRORS = 5,                 -- Stop after 5 errors
    ERRORFILE = 'C:\Logs\products_bulk_errors.txt'  -- Log errors to file
);


BEGIN TRY
    PRINT 'Starting BULK INSERT operation...';
    
    BULK INSERT Products
    FROM 'C:\Data\products_data.txt'
    WITH (
        FIELDTERMINATOR = '\t',
        ROWTERMINATOR = '\r\n',
        FIRSTROW = 1,
        TABLOCK,
        MAXERRORS = 10,
        ERRORFILE = 'C:\Logs\bulk_insert_errors.txt'
    );
    
    -- Check how many rows were imported
    DECLARE @RowCount INT = @@ROWCOUNT;
    PRINT 'SUCCESS: ' + CAST(@RowCount AS VARCHAR(10)) + ' rows imported successfully.';
    
END TRY
BEGIN CATCH
    PRINT 'BULK INSERT failed with error:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Please check the error file for details.';
END CATCH;

-- Verify imported data
SELECT 
    COUNT(*) AS TotalProducts,
    MIN(Price) AS MinPrice,
    MAX(Price) AS MaxPrice,
    AVG(Price) AS AvgPrice
FROM Products;

-- Show sample of imported data
SELECT TOP 5 
    Product_ID,
    Product_Name,
    Price,
    Category_ID
FROM Products
ORDER BY Product_ID DESC;  -- Show most recently imported first

-- 12 SAVOLGA JAVOB 
ALTER TABLE Products 
ADD CONSTRAINT FK_Products_Categories 
FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
ON DELETE SET NULL          -- Handle parent deletion
ON UPDATE CASCADE;          -- Handle parent key updates
--13 -SAVOLGA JAVOB

/*PRIMARY KEY
Uniqueness: Ensures that each value in the column(s) is unique.
NOT NULL: A PRIMARY KEY automatically implies NOT NULL — it cannot contain null values.
One per Table: Each table can have only one PRIMARY KEY.
Purpose: Identifies each row uniquely in a table.
Indexing: Automatically creates a clustered index (in many DBMSs like SQL Server).

 UNIQUE KEY
Uniqueness: Also ensures that each value in the column(s) is unique.
NULLs Allowed: Unlike a primary key, a UNIQUE KEY allows NULLs (the number allowed depends on the DBMS, but usually one or more).
Multiple per Table: A table can have multiple UNIQUE constraints.
Purpose: Used to enforce alternate or candidate keys — columns that must be unique but aren't the primary identifier.
Indexing: Automatically creates a non-clustered index (in many DBMSs).
*/
-- 14 SAVOLGA JAVOB
ALTER TABLE Products
ADD CONSTRAINT chk_price_positive
CHECK (Price > 0);

--15-SAVOLGA JAVOB

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

-- 16 SAVOL
SELECT Product_ID, Product_Name, ISNULL(Price, 0) AS Price
FROM Products;
-- 17 - SAVOL

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 18-SAVOLGA JAVOB
DROP TABLE Orders;
DROP TABLE Customers;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    CONSTRAINT chk_age_adult CHECK (Age >= 18)
);
--19-SAVOLGA JAVOB
DROP TABLE PRODUCTS;

CREATE TABLE Products (
    ProductID INT IDENTITY(100, 10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);


--20-SAVOLGA JAVON

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pk_orderdetails PRIMARY KEY (OrderID, ProductID)
);

-- 21 - SAVOLGA JAVOB
/*ISNULL Function
✅ Purpose:
Replaces a NULL value with a specified single replacement value

 COALESCE Function
✅ Purpose:
Returns the first non-NULL value from a list of expressions.
*/
--22 - SAVOLGA JAVOB
DROP TABLE EMPLOYEES;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    CONSTRAINT uq_email UNIQUE (Email)
);



--23 -SAVOLGA JAVOB

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
