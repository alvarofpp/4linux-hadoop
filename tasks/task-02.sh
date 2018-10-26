# Executa o scrip
pig -x tez flightdelays_clean.pig
# Pega o arquivo do HDFS e salva no local
hdfs dfs -get /user/maria_dev/flightdelays_clean /home/maria_dev/