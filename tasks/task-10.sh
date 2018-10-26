# Cria o diretório
hdfs dfs -mkdir /user/maria_dev/weather
# Coloca o CSV no diretório criado
hdfs dfs -moveFromLocal /home/maria_dev/datasets/flightdelays/sfo_weather.csv /user/maria_dev/weather/
# Executa o SQL
mysql -u root -p < flightinfo.sql
# Executa o Sqoop
sqoop export --connect jdbc:mysql://localhost/flightinfo --username root --password hadoop --table weather --export-dir /user/maria_dev/weather --input-fields-terminated-by ','