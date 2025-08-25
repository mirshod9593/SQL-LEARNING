1.
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;
2.
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');
3.
SELECT 
    d.DepartmentName,
    MAX(e.Salary) AS MaxSalary
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
4.
SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA'
  AND YEAR(o.OrderDate) = 2023;
5.
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
6.
SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
INNER JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');
7.
SELECT 
    c.CustomerName,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
8.
SELECT 
    c.CustomerName,
    o.OrderTotal
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE o.OrderTotal > 500;
9.
SELECT 
    p.ProductName,
    s.SaleDate,
    s.SaleAmount
FROM Products p
INNER JOIN Sales s 
    ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = 2022
   OR s.SaleAmount > 400;
10.
SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM Products p
INNER JOIN Sales s 
    ON p.ProductID = s.ProductID
GROUP BY p.ProductName;
11.
SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'HR'
  AND e.Salary > 60000;
12.
SELECT 
    p.ProductName,
    s.SaleDate,
    p.StockQuantity
FROM Products p
INNER JOIN Sales s 
    ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = 2023
  AND p.StockQuantity > 100;
13.
SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.HireDate
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales'
   OR e.HireDate > '2020-12-31';
14.
SELECT 
    c.CustomerName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA'
  AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';
15.
SELECT 
    p.ProductName,
    p.Category,
    s.SaleAmount
FROM Products p
INNER JOIN Sales s 
    ON p.ProductID = s.ProductID
WHERE p.Category = 'Electronics'
   OR s.SaleAmount > 350;
16.
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p 
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
17.
SELECT 
    c.CustomerName,
    c.City,
    o.OrderID,
    o.Amount
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles'
  AND o.Amount > 300;
18.
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('HR', 'Finance')
   OR LEN(e.EmployeeName) - LEN(REPLACE(LOWER(e.EmployeeName), 'a',''))
     + LEN(e.EmployeeName) - LEN(REPLACE(LOWER(e.EmployeeName), 'e',''))
     + LEN(e.EmployeeName) - LEN(REPLACE(LOWER(e.EmployeeName), 'i',''))
     + LEN(e.EmployeeName) - LEN(REPLACE(LOWER(e.EmployeeName), 'o',''))
     + LEN(e.EmployeeName) - LEN(REPLACE(LOWER(e.EmployeeName), 'u','')) >= 4;
19.
SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing')
  AND e.Salary > 60000;
