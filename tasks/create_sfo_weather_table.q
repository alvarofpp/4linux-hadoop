-- Apaga a tabela caso já exista
DROP TABLE IF EXISTS sfo_weather;

-- Cria tabela temporaria
CREATE EXTERNAL TABLE sfo_weather_temp (
    station_name STRING,
    year INT,
    month INT,
    dayofmonth INT,
    precipitation INT,
    temperature_max INT,
    temperature_min INT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

-- Povoa a tabela temporaria
LOAD DATA LOCAL INPATH '/home/maria_dev/HDPCD-Certification/datasets/flightdelays/sfo_weather.csv' INTO TABLE sfo_weather_temp;

-- Cria tabela
CREATE EXTERNAL TABLE sfo_weather (
    station_name STRING, 
    year INT, 
    month INT, 
    dayofmonth INT,
    precipitation INT,
    temperature_max INT,
    temperature_min INT
) STORED AS ORC;

-- Passa os dados da temporaria para a ORC
INSERT INTO sfo_weather SELECT * FROM sfo_weather_temp;

-- Apaga a tabela temporaria
DROP TABLE IF EXISTS sfo_weather_temp;