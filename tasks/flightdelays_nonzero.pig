-- Carregando tabela armazenada no Hive
flightdelays = LOAD 'flightdelays' USING org.apache.hive.hcatalog.pig.HCatLoader();
-- Pegar as linhas que possui Dest igual a DEN
flightdelays_filter = FILTER flightdelays BY $6 <= 0;
-- Ordenar decrescentemente
flightdelays_order = ORDER flightdelays_filter BY $6 DESC PARALLEL 3;
-- Salva o resultado
STORE flightdelays_order INTO '/user/maria_dev/flightdelays_nonzero' USING PigStorage(',');