-- Pega os arquivos
flightdelays_clean = LOAD '/user/maria_dev/flightdelays_clean/' USING PigStorage(',');
-- Agrupa
flightdelays_group = GROUP flightdelays_clean ALL;
-- Conta
flightdelays_count = FOREACH flightdelays_group GENERATE COUNT(flightdelays_clean);
-- Salva o resultado
STORE flightdelays_count INTO '/user/maria_dev/cleaned_total' USING PigStorage(',');