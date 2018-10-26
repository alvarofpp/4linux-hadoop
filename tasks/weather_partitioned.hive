-- Apaga a tabela caso já exista
DROP TABLE IF EXISTS weather_partitioned;

-- Cria tabela
CREATE TABLE weather_partitioned (
    station_name STRING,
    dayofmonth INT,
    precipitation INT,
    temperature_max INT,
    temperature_min INT
) PARTITIONED BY (year INT, month INT)
STORED AS ORC;

-- Inserir os valores
INSERT INTO TABLE weather_partitioned
PARTITION(year=2008, month=1)
SELECT station_name, dayofmonth, precipitation, temperature_max, temperature_min FROM sfo_weather
WHERE year = 2008 AND month = 1;