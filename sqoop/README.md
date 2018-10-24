# Apache Sqoop
Apache Hadoop é um framework projetado para o processamento massivo de dados de diversos tipos (estruturados, semiestruturados e não estruturados), no qual esses são armazenados no HDFS (Hadoop Distributed File System) e manipulados por tarefas MapReduce.

- [Apache Sqoop](http://sqoop.apache.org/)

## Sqoop
O Sqoop é um aplicativo de interface de linha de comandos para transferir dados entre bancos de dados relacionais e o Hadoop.

### Descrição dos comandos

| Comando      | Descrição     |
| ------------ | ------------- |
| `--check-column` | Define a coluna de origem para verificar a alteração incremental |
| `--column-family` | Permite definir a família da coluna de destino para a importação |
| `--connect jdbc:mysql://192.168.56.103:3306?useSSL=false` | Permite conectar utilizando um JDBC informando o IP e Porta do servidor de destino. A opção useSSL=false permite desativar avisos sobre conexão SSL ao conectar-se ao banco de dados MySQL |
| `--export-dir` | Define o caminho de origem no sistema de arquivo HDFS para exportação |
| `--hbase-row-key` | Especifica qual coluna de entrada devemos usar como a chave de linha |
| `--hbase-table` | Permite definir o nome da tabela HBase de destino onde os dados serão importados |
| `--incremental append` | Define uma importação incremental do tipo append (acrescentar) |
| `--incremental lastmodified` | Define uma importação incremental do tipo lastmodified (última modificação) |
| `--last-value` | Permite definir o último valor importado na coluna de verificação incremental |
| `--query` | Permite importar resultados a partir de instruções SQL. No exemplo apresentado estamos importando todos os registros, que possuem valores maiores que 5000 no campo salario |
| `--table` | Permite definir o nome da tabela que sera lida durante a importação |
| `--target-dir` | Define o destino no sistema de arquivos HDFS onde os dados serão importados |
| `--username` | Definir nome do usuário de autenticação que possuiu permissão no servidor de destino |
| `-P` | Invoca um prompt no console para informar a senha do usuário de autenticação |
| `-m1` | Define um numero de tarefas no MapReduce para importar em paralelo |
| `export` | Permite exportar dados de um diretório HDFS para uma tabela de banco de dados |
| `import` | Permite importar uma tabela de um banco de dados para HDFS |
| `list-databases` | Permite listar os bancos de dados disponíveis em um servidor de destino |
| `list-tables` | Permite listar tabelas disponíveis em um banco de dados em um servidor de destino |

**Exemplo**:
Exemplo de comando para importar dados de um banco PostgreSQL:
```sh
sqoop import --connect jdbc:postgresql://192.168.56.104:5432/roundcubemail --table contacts --username roundcube -P -m1
```