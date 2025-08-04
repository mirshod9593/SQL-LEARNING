--1. savolga javob
create table employees(employee_id int, firstname varchar(50), salary decimal(10,2))
 -- 2- savolga javob
INSERT INTO Employees (employee_id,firstname, Salary) 
VALUES (1, 'Mirshod Abdurahmon', 55000.00);

INSERT INTO Employees (employee_id,firstname, Salary) 
VALUES (2, 'Shaxboz Alijonov', 62000.50);

INSERT INTO Employees (employee_id,firstname, Salary) 
VALUES 
    (3, 'Murod Abdurahmon', 48000.75);
--3- savolga javob
UPDATE Employees SET Salary = 7000.00 WHERE employee_id = 1;
-- 4-savolga javob
delete from employees where employee_id=1

-- 5- savolga javob
delete dan biz foydalanamiz qachonki jadvaldan maxsus qatorni o`chrish uchun ishlatamiz. 
truncate dan biz foydalanamiz qachonki jadval ichidagi barcha malumotlarni o`chrish uchun ammo jadval strukturasi saqlanib qoladi.
drop dan foydalanganmizda butun bir jadvalni  o`chrib tashlaydi va uning strukturasi bilan birga ochib ketadi.
-- 6 - savolga javob.
ALTER TABLE Employees alter COLUMN firstname VARCHAR(100);
--7- savolga javob
alter table employees add  department varchar(50);
-- 8- savolga javob
alter table employees alter column salary float;
--9-savolga javob
create table Departments(Department_id int primary key, Departmentname varchar(50))
--10 -savolga javob
truncate table employees;
--11-savolga javob

INSERT INTO Departments (Department_id, DepartmentName)
SELECT * FROM (
    SELECT 1 AS DepartmentID, 'Human Resources' AS DepartmentName
    UNION ALL
    SELECT 2, 'Information Technology'
    UNION ALL
    SELECT 3, 'Finance'
    UNION ALL
    SELECT 4, 'Marketing'
    UNION ALL
    SELECT 5, 'Operations'
) AS DepartmentData;


--12-savolga javob
UPDATE Employees SET Department = 'Management' WHERE Salary > 5000;
--13 -savolga javob
DELETE FROM Employees;

--14 -savolga javob
ALTER TABLE Employees DROP COLUMN Department;
--15 - savolga javob

EXEC sp_rename 'Employees', 'StaffMembers';
--16- savolga javob
DROP TABLE Departments;
-- 17- savolga javob
create table Products (product_id int primary key,product_name varchar(100),category varchar(50),price DECIMAL(10,2),StockQuantity INT);
-- 18-savolga javob
ALTER TABLE Products 
ADD CONSTRAINT chk_price_positive 
CHECK (Price > 0);
select * from Products;
--19-savolga javob
ALTER TABLE Products 
ADD CONSTRAINT df_stock_quantity_default 
DEFAULT 50 FOR StockQuantity;

--20-savolga javob
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';
--21 -savolga javob
INSERT INTO Products (product_id,product_name,productcategory,price,StockQuantity)
VALUES (1, 'Wireless Bluetooth Headphones', 'Electronics', 89.99, 25);

INSERT INTO Products (product_id,product_name,productcategory,price,StockQuantity)
VALUES (2, 'Cotton T-Shirt', 'Clothing', 19.95, 150);

INSERT INTO Products (product_id,product_name,productcategory,price,StockQuantity)
VALUES (3, 'Gaming Mouse', 'Electronics', 45.50, 75);

INSERT INTO Products (product_id,product_name,productcategory,price,StockQuantity)
VALUES (4, 'Coffee Mug', 'Home & Kitchen', 12.99, 200);

-- This insert will use the DEFAULT value of 50 for StockQuantity
INSERT INTO Products (product_id,product_name,productcategory,price,StockQuantity)
VALUES (5, 'Notebook Set', 'Office Supplies', 8.75,200);
-- 22- savolga javob

SELECT * 
INTO Products_Backup 
FROM Products;

--select * from Products_Backup;
--select * from Products;
--23-savolga javob
exec sp_rename 'products','inventory';
--24-savolga javob  
alter table inventory alter column price float;
--25-savolga javob Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
alter table  inventory add  ProductCode int identity(1000,5);
