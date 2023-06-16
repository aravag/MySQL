CREATE DATABASE IF NOT EXISTS workers;
USE workers;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id  INT PRIMARY KEY AUTO_INCREMENT, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(45),
    seniority INT,
    salary INT,
    age INT
);
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
	("Вася", "Петров", "Начальник", 40, 100000, 60),
    ("Петр", "Власов", "Начальник", 8, 70000, 30),
    ("Катя", "Катина", "Инженер", 2, 70000, 25),
    ("Саша", "Сасин", "Инженер", 12, 50000, 35),
    ("Иван", "Иванов", "Рабочий", 40, 30000, 59),
    ("Петр", "Петров", "Рабочий", 20, 25000, 40),
    ("Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "Рабочий", 8, 19000, 28),
    ("Юрий", "Юрков", "Рабочий", 5, 15000, 25),
    ("Максим", "Максимов", "Рабочий", 2, 11000, 22),
    ("Юрий", "Галкин", "Рабочий", 3, 12000, 24),
    ("Людмила", "Маркина", "Уборщик", 10, 10000, 49);
    
-- Task 1
SELECT * FROM staff
ORDER BY salary;
SELECT * FROM staff
ORDER BY salary DESC;

-- Task 2
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Task 3
SELECT post, SUM(salary) AS sum
FROM staff
GROUP BY post;


-- Task 4
SELECT post, age
FROM staff
WHERE post = "Рабочий" AND age >= 24 AND age <= 49;

-- Task 5
SELECT COUNT(DISTINCT post) AS post_count
FROM staff;

-- Task 6
SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;

-- Additional task 1
SELECT post, firstname, lastname, salary
FROM (
    SELECT post, firstname, lastname, salary,
           ROW_NUMBER() OVER (PARTITION BY post ORDER BY salary DESC) AS rank_num
    FROM staff
) AS ranked_staff
WHERE rank_num <= 2;