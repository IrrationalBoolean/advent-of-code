CREATE TABLE day_01_2021 (
	id SERIAL,
	measurement INT
);

CREATE TABLE text_data (val int);

COPY text_data FROM '/home/k/Documents/SQL/AOC/inputs/day_1_2021.txt';

INSERT INTO day_01_2021 (measurement)
	SELECT val FROM text_data;
DROP TABLE text_data;

-- Part 1
with increases(i) AS (
SELECT
	CASE
	WHEN measurement - LAG(measurement) OVER () > 0 THEN 1
	ELSE 0
	END
FROM day_01_2021
)

SELECT SUM(i) FROM increases;

with averages(id, i) AS (
	SELECT
		id,
		AVG(measurement) OVER (ORDER BY id ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING)
	FROM day_1_2021
),
increases(j) AS (
SELECT
	CASE
	WHEN i - LAG(i) OVER () > 0 AND id < 1999 THEN 1
	ELSE 0
	END
FROM averages
)
SELECT SUM(j) FROM increases;
