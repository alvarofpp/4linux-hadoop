-- Carregar os dados dos arquivos
flightdelays = LOAD '/user/maria_dev/flightdelays/' USING PigStorage(',');
-- Remover as linhas que possui DepTime igual a NA
flightdelays_filter = FILTER flightdelays BY $4 != 'NA';
-- Campos para output
flightdelays_output = FOREACH flightdelays_filter GENERATE $0,$1,$2,$4,$8,$9,$14,$16,$17;
-- Salva os campos
STORE flightdelays_output INTO '/user/maria_dev/flightdelays_clean' USING PigStorage(',');