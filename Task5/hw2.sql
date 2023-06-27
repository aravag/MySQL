DROP TABLE train_schedule;
CREATE TABLE train_schedule (
  train_id INT,
  station VARCHAR(20),
  station_time TIME
);

INSERT INTO train_schedule (train_id, station, station_time)
VALUES
  (110, 'San Francisco', '10:00:00'),
  (110, 'Redwood City', '10:54:00'),
  (110, 'Palo Alto', '11:02:00'),
  (110, 'San Jose', '12:35:00'),
  (120, 'San Francisco', '11:00:00'),
  (120, 'Palo Alto', '12:49:00'),
  (120, 'San Jose', '13:30:00');
  
ALTER TABLE train_schedule
ADD COLUMN time_to_next_station TIME;

UPDATE train_schedule AS t1
JOIN (
    SELECT t1.train_id, t1.station_time, MIN(t2.station_time) AS next_station_time
    FROM train_schedule AS t1
    JOIN train_schedule AS t2 ON t1.train_id = t2.train_id AND t1.station_time < t2.station_time
    GROUP BY t1.train_id, t1.station_time
) AS t2 ON t1.train_id = t2.train_id AND t1.station_time = t2.station_time
SET t1.time_to_next_station = TIMEDIFF(t2.next_station_time, t1.station_time);

SELECT *
FROM train_schedule;