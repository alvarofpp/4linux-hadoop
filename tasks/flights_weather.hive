-- Usar todo o poder do motor de execução do Hive
SET hive.execution.engine = tez;

-- Apaga a tabela caso já exista
DROP TABLE IF EXISTS flights_weather;

-- Cria tabela
CREATE TABLE flights_weather
STORED AS TEXTFILE AS
SELECT fd.*, sw.temperature_max, sw.temperature_min FROM flightdelays fd
JOIN sfo_weather sw ON fd.year = sw.year AND fd.month = sw.month AND fd.dayofmonth = sw.dayofmonth
WHERE fd.origin = 'SFO' OR fd.dest = 'SFO';