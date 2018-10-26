-- Carregar os dados dos arquivos
flightdelays = LOAD '/user/maria_dev/flightdelays_clean/' USING PigStorage(',');
-- Pegar as linhas que possui Dest igual a DEN e ArrDelay >= 60
flightdelays_filter = FILTER flightdelays BY ($6 >= 60) AND ($8 == 'DEN');
-- Agrupar
flightdelays_group = GROUP flightdelays_filter ALL;
-- Contar
flightdelays_count = FOREACH flightdelays_group GENERATE COUNT(flightdelays_filter);
-- Salva o resultado
STORE flightdelays_count INTO '/user/maria_dev/denver_late' USING PigStorage(',');