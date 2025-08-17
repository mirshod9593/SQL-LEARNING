1. SELECT MIN(Price) AS MinPrice FROM Products;

2. SELECT MAX(Salary) AS MaxSalary FROM Employees;

3. SELECT COUNT(*) AS TotalCustomers FROM Customers;

4. SELECT COUNT(DISTINCT Category) AS UniqueCategories FROM Products;

5.  SELECT SUM(SalesAmount) AS TotalSales FROM Sales WHERE ProductID = 7;

6. SELECT AVG(Age) AS AverageAge FROM Employees;

7. SELECT Department, COUNT(*) AS EmployeeCount FROM Employees
   GROUP BY Department;

8. SELECT Category,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;

9.  SELECT CustomerID, 
       SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

10. SELECT DeptID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;


11. SELECT Category,
       SUM(SalesAmount) AS TotalSales,
       AVG(SalesAmount) AS AverageSales
FROM Sales
GROUP BY Category;

12.  SELECT COUNT(*) AS HREmployeeCount
FROM Employees
WHERE Department = 'HR';

13. SELECT DeptID,
       MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY DeptID;

14. SELECT DeptID,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID;

15.  SELECT DeptID,
       AVG(Salary) AS AverageSalary,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;


16.  SELECT Category,
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;

17. SELECT YEAR(SaleDate) AS SaleYear,
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;

18.  SELECT CustomerID,
       COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3;

19.  SELECT DeptID,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 60000;

20. SELECT Category,
       AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;

21. SELECT CustomerID,
       SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SalesAmount) > 1500;

22. SELECT DeptID,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 65000;

23. SELECT
  O.custid AS CustomerID,
  SUM(OV.val) AS TotalSales,
  MIN(OV.val) AS MinPurchase
FROM Sales.Orders AS O
JOIN Sales.OrderValues AS OV
  ON OV.orderid = O.orderid
WHERE O.freight > 50
GROUP BY O.custid
HAVING SUM(OV.val) > 0  -- Optional: only include customers with actual total
ORDER BY TotalSales DESC;

24. USE TSQL2012;
GO

SELECT
    O.custid,
    YEAR(O.orderdate) AS OrderYear,
    MONTH(O.orderdate) AS OrderMonth,
    SUM(OD.unitprice * OD.qty * (1 - OD.discount)) AS TotalSales,
    COUNT(DISTINCT OD.productid) AS UniqueProducts
FROM Sales.Orders AS O
JOIN Sales.OrderDetails AS OD
    ON O.orderid = OD.orderid
GROUP BY O.custid, YEAR(O.orderdate), MONTH(O.orderdate)
HAVING COUNT(DISTINCT OD.productid) >= 2
ORDER BY O.custid, OrderYear, OrderMonth;


25.  USE TSQL2012;
GO

SELECT
    YEAR(O.orderdate) AS OrderYear,
    MIN(OD.qty) AS MinQty,
    MAX(OD.qty) AS MaxQty
FROM Sales.Orders AS O
JOIN Sales.OrderDetails AS OD
    ON O.orderid = OD.orderid
GROUP BY YEAR(O.orderdate)
ORDER BY OrderYear;

