# Apache Hive
Hive é um padrão para consultas SQL sobre petabytes de dados no Hadoop. Fornece acesso semelhante a SQL para dados no HDFS, fazendo Hadoop ser usado como uma estrutura de Data Warehouse.

- [Apache Hive TM](https://hive.apache.org/)

Comando para entrar no **Shell do Hive**:
```
hive
```

## Hive Query Language (HQL)
O Hive Query Language (HQL) tem semântica e funções semelhantes como SQL padrão no banco de dados relacional. A linguagem de consulta do Hive pode ser executado em diferentes frameworks de computação, como, por exemplo, MapReduce, Tez e Spark para alto desempenho.

- [Language Manual](https://cwiki.apache.org/confluence/display/Hive/LanguageManual).

**Executar script** pelo terminal:
```bash
hive ­-f /home/maria_dev/scripts/script_hive.q
```
**Script Hive**: Como é o caso de scripts em outras linguagens, como SQL, Unix Shell etc., os scripts do Hive são usados para executar um conjunto de comandos Hive coletivamente. Isso ajuda na redução do tempo e esforço investido na escrita e execução de cada comando manualmente.

### Descrição dos comandos

| Comando      | Descrição     |
| ------------ | ------------- |
| `CREATE TABLE` | Permite criar uma tabela no Hive |
| `DESCRIBE` | Exibe a lista de campos e tipos de uma tabela |
| `DROP TABLE` | Remove uma tabela no Hive |
| `INTO TABLE` | Define o nome da tabela onde os dados inseridos |
| `LIKE` | Usada para comparar um valor com valores semelhantes |
| `LOAD DATA LOCAL INPATH` | Carrega dados de um arquivo em uma tabela |
| `RLIKE` | É uma função especial do Hive onde, se qualquer sub cadeia de A coincide com B, ela é avaliada como verdadeira |
| `ROW FORMAT DELIMITED FIELDS TERMINATED BY ','` | Define o caractere utilizado para separar um campo de outro, no arquivo que sera carregado na tabela |
| `SELECT * FROM` | Lista registros de um tabela |
| `SHOW DATABASES` | Permite listar banco de dados no Hive |
| `SHOW TABLES` | Permite listar tabelas no Hive |
| `WHERE` | Cláusula usada para especificar uma condição ao buscar os dados de uma única tabela ou juntando-se a várias tabelas |

Modos de **carregar dados**:
```hive
-- Normal
CREATE TABLE funcionarios (id_func int, nome string, cargo string, salario int, departamento string) ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INPATH '/home/maria_dev/dados/funcionarios.txt' INTO TABLE funcionarios;

-- Com separador ;
CREATE TABLE funcionarios (id_func int, nome string, cargo string, salario int, departamento string) ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;';
LOAD DATA LOCAL INPATH '/home/maria_dev/dados/funcionarios.csv' INTO TABLE funcionarios;

-- JSON
CREATE TABLE funcionarios (id_func int, nome string, cargo string, salario int, departamento string) ROW FORMAT SERDE "org.apache.hive.hcatalog.data.JsonSerDe" STORED AS TEXTFILE;
LOAD '/user/maria_dev/funcionarios.json' USING JsonLoader('id_func:int, nome:chararray, cargo:chararray, salario:chararray, departamento:chararray');
```

**Arquivo CSV**: Os arquivos Comma-separated values também conhecido como CSV, são arquivos texto de formato regulamentado pelo RFC 4180 que faz uma ordenação de bytes ou um formato de terminador de linha.

**Arquivo JSON**: JSON é um acrônimo para "JavaScript Object Notation", é um formato de padrão aberto que utiliza texto legível a humanos para transmitir objetos de dados consistindo de pares atributo-valor. É o formato de dados mais comumente utilizado para comunicação assíncrona navegador/servidor, substituindo amplamente o XML, sendo usado pelo AJAX.