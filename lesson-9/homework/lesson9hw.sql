1.
SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;
2.
SELECT d.DepartmentName, e.EmployeeName
FROM Departments d
CROSS JOIN Employees e;
3.
SELECT s.SupplierName, p.ProductName
FROM Products p
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID;
4.
SELECT c.CustomerName, o.OrderID
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
5.
SELECT s.StudentName, c.CourseName
FROM Students s
CROSS JOIN Courses c;
6.
SELECT p.ProductName, o.OrderID
FROM Products p
INNER JOIN Orders o
    ON p.ProductID = o.ProductID;
7.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;
8.
SELECT s.StudentName, e.CourseID
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID;
9.
SELECT o.OrderID, p.PaymentID, p.Amount
FROM Orders o
INNER JOIN Payments p
    ON o.OrderID = p.OrderID;
10.
SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE p.Price > 100;
11.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;
12.
SELECT o.OrderID, p.ProductName, o.Quantity, p.Stock
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE o.Quantity > p.Stock;
13.

SELECT c.CustomerName, s.ProductID, s.Amount
FROM Customers c
INNER JOIN Sales s
    ON c.CustomerID = s.CustomerID
WHERE s.Amount >= 500;
14.
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;

15.
SELECT p.ProductName, s.SupplierName
FROM Products p
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';
16.
SELECT o.OrderID, o.TotalAmount, p.Amount AS PaymentAmount
FROM Orders o
INNER JOIN Payments p
    ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;
17.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;
18.
SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
19.
SELECT s.SaleID, c.CustomerName, s.ProductID, s.Amount
FROM Sales s
INNER JOIN Customers c
    ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';
20.
SELECT o.OrderID, c.CustomerName, c.Country, o.TotalAmount
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany'
  AND o.TotalAmount > 100;
21.
SELECT e1.EmployeeName AS Employee1,
       e2.EmployeeName AS Employee2,
       e1.DepartmentID AS Dept1,
       e2.DepartmentID AS Dept2
FROM Employees e1
INNER JOIN Employees e2
    ON e1.EmployeeID < e2.EmployeeID   -- avoid duplicate/reverse pairs
   AND e1.DepartmentID <> e2.DepartmentID;  -- different departments
22.
SELECT p.PaymentID,
       o.OrderID,
       pr.ProductName,
       o.Quantity,
       pr.Price,
       (o.Quantity * pr.Price) AS ExpectedAmount,
       p.Amount AS PaidAmount
FROM Payments p
INNER JOIN Orders o
    ON p.OrderID = o.OrderID
INNER JOIN Products pr
    ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);
23.
SELECT s.StudentID, s.StudentName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
WHERE e.CourseID IS NULL;
24.
SELECT m.EmployeeID AS ManagerID,
       m.EmployeeName AS ManagerName,
       m.Salary AS ManagerSalary,
       e.EmployeeID AS EmployeeID,
       e.EmployeeName AS EmployeeName,
       e.Salary AS EmployeeSalary
FROM Employees e
INNER JOIN Employees m
    ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;
25.
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p
    ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;





