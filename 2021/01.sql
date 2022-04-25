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

