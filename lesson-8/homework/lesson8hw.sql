1.
SELECT 
    CategoryID,       -- or CategoryName if you have it
    COUNT(*) AS TotalProducts
FROM Products
2.
SELECT 
    AVG(Price) AS AvgPrice
FROM Products
WHERE Category = 'Electronics';
3.
select * from Customers
where city like 'L%'
4.
select * from products where productname like '%er'
5.
select * from Customers where country like '%A'
6.
select max(price) as maxprice from products
7.

select *, 
case when stockQuantity<30 then 'low stock'
else 'suffisient'
end 'stock status'
from products;

8.

SELECT 
    Country,
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
9. 
select min(quantity) as minimum_quabtity,max(quantity) as max_quantity from oders;
10.
SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i ON o.CustomerID = i.CustomerID
WHERE o.OrderDate >= '2023-01-01' 
  AND o.OrderDate < '2023-02-01'
  AND i.CustomerID IS NULL;
  11.
  SELECT ProductName
FROM Products
UNION ALL
SELECT ProductName
FROM Products_Discounted;
12.
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;
13. 
SELECT 
    YEAR(OrderDate) AS OrderYear,
    AVG(OrderAmount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
14.
SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price >= 100 AND Price <= 500 THEN 'Mid'
        WHEN Price > 500 THEN 'High'
        ELSE 'Unknown'
    END AS PriceGroup
FROM Products
ORDER BY PriceGroup, Price;
15.
SELECT 
    City,
    [2012],
    [2013]
FROM (
    SELECT City, Year, Population
    FROM City_Population
    WHERE Year IN (2012, 2013)
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;
16. 

SELECT 
    ProductID,
    SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

17.

SELECT 
        ProductName
FROM    Products
WHERE ProductName LIKE '%oo%';

18.
SELECT 
    Year,
    [Bektemir],
    [Chilonzor],
    [Yakkasaroy]
INTO Population_Each_City
FROM (
    SELECT Year, City, Population
    FROM City_Population
    WHERE City IN ('Bektemir', 'Chilonzor', 'Yakkasaray')
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

19.
SELECT TOP 3
    CustomerID,
    SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY SUM(InvoiceAmount) DESC;
20.
SELECT 
    City,
    Year,
    Population
FROM Population_Each_Year
UNPIVOT (
    Population FOR Year IN ([2012], [2013])
) AS UnpivotTable;
21.
SELECT 
    p.ProductName,
    COUNT(s.ProductID) AS TimesSold
FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TimesSold DESC;
22.
SELECT 
    City,
    Year,
    Population
FROM Population_Each_City
UNPIVOT (
    Population FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS UnpivotTable;
