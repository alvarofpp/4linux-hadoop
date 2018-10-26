-- Carregar os dados dos arquivos
flightdelays = LOAD '/user/maria_dev/flightdelays_clean/' USING PigStorage(',');
-- Pegar as linhas que possui Dest igual a DEN
flightdelays_filter = FILTER flightdelays BY $8 == 'DEN';
-- Agrupar
flightdelays_group = GROUP flightdelays_filter ALL;
-- Contar
flightdelays_count = FOREACH flightdelays_group GENERATE COUNT(flightdelays_filter);
-- Salva o resultado
STORE flightdelays_filter INTO '/user/maria_dev/denver_total' USING PigStorage(',');