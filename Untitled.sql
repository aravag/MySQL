-- Task 1
CREATE DATABASE IF NOT EXISTS electronics;
USE electronics;
DROP TABLE IF EXISTS device;
CREATE TABLE device
(
	Id  INT PRIMARY KEY AUTO_INCREMENT, 
	ProductName VARCHAR(45),
    Manufacturer VARCHAR(20),
    ProductCount INT,
    Price INT
);
INSERT device (ProductName, Manufacturer, ProductCount, Price)
VALUES
	('iPhone 14', 'Apple', 3, 98000),
    ('iPhone 12', 'Apple', 2, 60000),
    ('iPhone X', 'Apple', 3, 40000),
    ('iPhone 8', 'Apple', 4, 30000),
    ('Galaxy S9', 'Samsung', 3, 35000),
    ('Galaxy S20', 'Samsung', 2, 94000),
    ('Galaxy S21', 'Samsung', 1, 96000),
    ('P20 Pro', 'Huawei', 5, 36000);
-- Task 2
SELECT ProductName, Manufacturer, Price
FROM device
WHERE ProductCount > 2;
-- Task 3
SELECT ProductName, Price
FROM device
WHERE Manufacturer = 'Samsung';
-- Task 4
SELECT ProductName, Manufacturer, Price
FROM device
WHERE ProductCount * Price > 100000 && ProductCount * Price < 145000;
-- Task 4.1
SELECT ProductName, ProductCount, Price
FROM device
WHERE ProductName LIKE 'iPhone%';
-- Task 4.2 
SELECT ProductName, ProductCount, Price
FROM device
WHERE ProductName LIKE 'Galaxy%';
-- Task 4.3 
SELECT ProductName, ProductCount, Price
FROM device
WHERE ProductName RLIKE '.*[0-9].*';
-- Task 4.4
SELECT ProductName, ProductCount, Price
FROM device
WHERE ProductName LIKE '%8';