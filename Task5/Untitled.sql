DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создание представления с автомобилями стоимостью до 25 000 долларов:

DROP VIEW IF EXISTS cars_view;
CREATE VIEW cars_view AS
SELECT *
FROM cars
WHERE cost <= 25000;

-- Изменение порога для стоимости в существующем представлении до 30 000 долларов:

ALTER VIEW cars_view AS
SELECT *
FROM cars
WHERE cost <= 30000;

-- Создание представления с автомобилями марки "Шкода" и "Ауди":

DROP VIEW IF EXISTS skoda_audi_cars_view;
CREATE VIEW skoda_audi_cars_view AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');

-- Проверка представлений

SELECT *
FROM cars_view;