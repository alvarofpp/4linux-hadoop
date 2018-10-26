-- Usar todo o poder do motor de execução do Hive
SET hive.execution.engine = tez;

-- Media de arrdelay
SELECT AVG(arrdelay) FROM flightdelays WHERE dest LIKE 'DEN';

-- Media de arrdelay
SELECT AVG(arrdelay) FROM flightdelays WHERE (origin LIKE 'LAX') AND (dest LIKE 'SFO');

-- Maior media de arrdelay
SELECT AVG(arrdelay),dest FROM flightdelays GROUP BY dest ORDER BY delay DESC LIMIT 1;