# Cria a base de dados
CREATE DATABASE flightinfo;

# Usar a base de dados criada
USE flightinfo;

# Cria a tabela
CREATE TABLE weather (
    station VARCHAR(100),
    year INT(11),
    month INT(11),
    dayofmonth INT(11),
    precipitation INT(11),
    maxtemp INT(11),
    mintemp INT(11)
);