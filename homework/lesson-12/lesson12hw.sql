1.
SELECT p.personId,
       p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Persons p
INNER JOIN Address a
    ON p.personId = a.personId;

2.
SELECT e.Name AS EmployeeName,
       e.Salary AS EmployeeSalary,
       m.Name AS ManagerName,
       m.Salary AS ManagerSalary
FROM Employees e
JOIN Employees m
    ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;
3.
SELECT Email, COUNT(*) AS DuplicateCount
FROM Person
GROUP BY Email
HAVING COUNT(*) > 1;
4.
DELETE FROM Person
WHERE Id NOT IN (
    SELECT MIN(Id)
    FROM Person
    GROUP BY Email
);
5.
SELECT p.ParentID, p.ParentName
FROM Parents p
JOIN Children c ON p.ParentID = c.ParentID
GROUP BY p.ParentID, p.ParentName
HAVING SUM(CASE WHEN c.Gender = 'M' THEN 1 ELSE 0 END) = 0;
6.
SELECT CustomerID,
       SUM(SalesAmount) AS TotalSalesOver50,
       MIN(Weight) AS LeastWeight
FROM Sales.Orders
WHERE Weight > 50
GROUP BY CustomerID;
7.
WITH Cart1 AS (
    SELECT Item, ROW_NUMBER() OVER (ORDER BY Item) AS rn
    FROM Carts
    WHERE CartID = 1
),
Cart2 AS (
    SELECT Item, ROW_NUMBER() OVER (ORDER BY Item) AS rn
    FROM Carts
    WHERE CartID = 2
)
SELECT c1.Item AS [Item Cart 1],
       c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
    ON c1.rn = c2.rn;
8.
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
9.
SELECT s.student_id,
       s.student_name,
       sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
       ON s.student_id = e.student_id
      AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

