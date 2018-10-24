# Apache Hive
Hive é um padrão para consultas SQL sobre petabytes de dados no Hadoop. Fornece acesso semelhante a SQL para dados no HDFS, fazendo Hadoop ser usado como uma estrutura de Data Warehouse.

- [Apache Hive TM](https://hive.apache.org/)

Comando para entrar no **Shell do Hive**:
```sh
hive
```

## Hive Query Language (HQL)
O Hive Query Language (HQL) tem semântica e funções semelhantes como SQL padrão no banco de dados relacional. A linguagem de consulta do Hive pode ser executado em diferentes frameworks de computação, como, por exemplo, MapReduce, Tez e Spark para alto desempenho.

- [Language Manual](https://cwiki.apache.org/confluence/display/Hive/LanguageManual).

**Executar script** pelo terminal:
```sh
hive ­-f /home/maria_dev/scripts/script_hive.q
```
**Script Hive**: Como é o caso de scripts em outras linguagens, como SQL, Unix Shell etc., os scripts do Hive são usados para executar um conjunto de comandos Hive coletivamente. Isso ajuda na redução do tempo e esforço investido na escrita e execução de cada comando manualmente.

### Descrição dos comandos

| Comando      | Descrição     |
| ------------ | ------------- |
| `AVG` | Permite exibir o valor da média contidos em uma coleção específica |
| `COUNT` | Permite contar registros contidos em uma coleção específica |
| `CREATE EXTERNAL TABLE` | Cria uma tabela utilizando dados externos |
| `CREATE TABLE` | Permite criar uma tabela no Hive |
| `CREATE VIEW` | Permite criar uma tabela virtual no Hive |
| `DESCRIBE` | Exibe a lista de campos e tipos de uma tabela |
| `DROP TABLE` | Remove uma tabela no Hive |
| `FULL OUTER JOIN` | Combina os registros das tabelas externas esquerda e direita que cumprem a condição JOIN. A tabela juntada contém todos os registros das tabelas ou preenche os valores NULL para as correspondências que faltam em ambos os lados |
| `GROUP BY` | Cláusula usada para agrupar todos os registros em um conjunto de resultados usando uma coluna de coleção específica |
| `INSERT OVERWRITE TABLE` | Cada novo conjunto de linhas inseridas substitui quaisquer dados existentes na tabela. É assim que você carrega dados para consulta em um cenário de Data Warehousing onde você analisa apenas determinados dados através de filtros |
| `INTO TABLE` | Define o nome da tabela onde os dados inseridos |
| `JOIN` | Cláusula que é usada para combinar campos específicos de duas tabelas usando valores comuns a cada um. Ele é usado para combinar registros de duas ou mais tabelas no banco de dados |
| `LEFT OUTER JOIN` | Retorna todas as linhas da tabela à esquerda, mesmo que não haja correspondências na tabela certa. Isso significa que, se a cláusula ON corresponder aos registros 0 (zero) na tabela direita, o JOIN ainda retorna uma linha no resultado, mas com NULL em cada coluna da tabela direita |
| `LIKE` | Usada para comparar um valor com valores semelhantes |
| `LIMIT` | Em uma consulta SELECT define um número máximo de linhas para o conjunto de resultados |
| `LOAD DATA LOCAL INPATH` | Carrega dados de um arquivo em uma tabela |
| `LOCATTION` | Define onde o Hive ira encontrar os dados para popular a tabela externa |
| `MAX` | Permite exibir o valor máximo contidos em uma coleção específica |
| `MIN` | Permite exibir o valor mínimo contidos em uma coleção específica |
| `ORDER BY` | Cláusula usada para recuperar os detalhes com base em uma coluna e classificar o resultado definido por ordem ascendente ou descendente |
| `PARTITION` | Cria partições estáticas |
| `RIGHT OUTER JOIN` | Retorna todas as linhas da tabela direita, mesmo que não haja correspondências na tabela à esquerda. Se a cláusula ON corresponder aos registros 0 (zero) na tabela à esquerda, o JOIN ainda retorna uma linha no resultado, mas com NULL em cada coluna da tabela à esquerda |
| `RLIKE` | É uma função especial do Hive onde, se qualquer sub cadeia de A coincide com B, ela é avaliada como verdadeira |
| `ROW FORMAT DELIMITED FIELDS TERMINATED BY ','` | Define o caractere utilizado para separar um campo de outro, no arquivo que sera carregado na tabela |
| `SELECT * FROM` | Lista registros de um tabela |
| `SHOW DATABASES` | Permite listar banco de dados no Hive |
| `SHOW TABLES` | Permite listar tabelas no Hive |
| `STORED AS TEXTFILE` | Permite armazenar como arquivos de texto simples. TEXTFILE é o formato de arquivo padrão, a menos que o parâmetro de configuração hive.default.fileformat tenha uma configuração diferente |
| `STORED BY` | Permite armazenar por um formato de tabela não nativo. Para criar ou vincular a uma tabela não nativa, por exemplo, uma tabela apoiada por HBase ou Druid ou Accumulo |
| `SUM` | Permite exibir o valor da soma contidos em uma coleção específica |
| `TBLPROPERTIES` | Define o nome da tabela de destino durante a exportação de dados |
| `WHERE` | Cláusula usada para especificar uma condição ao buscar os dados de uma única tabela ou juntando-se a várias tabelas |
| `WITH SERDEPROPERTIES` | Define os campos utilizando durante a exportação de dados |

| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |
| `TABLES` | Permite |

Modos de **carregar dados**:
```q
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

### Partições dinâmicas

Antes de testar partições dinâmicas, dinâmicas é preciso definir as seguintes configurações:
```sh
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions=1000;
set hive.exec.max.dynamic.partitions.pernode=1000;
```

| Comando      | Descrição     |
| ------------ | ------------- |
| `hive.exec.dynamic.partition` | Permitir ou não partições dinâmicas em DML/DDL |
| `hive.exec.dynamic.partition.mode` | Em modo estrito, o usuário deve especificar pelo menos uma partição estática no caso de o usuário substituir acidentalmente todas as partições. No modo não estrito todas as partições estão autorizados a ser dinâmico |
| `hive.exec.max.dynamic.partitions` | Número máximo de partições dinâmicas permitidas para serem criadas |
| `hive.exec.max.dynamic.partitions.pernode` | Número máximo de partições dinâmicas permitidas para serem criadas em cada Nó MapReduce |