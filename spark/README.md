# Apache Spark
É uma estrutura de processamento de dados de fonte aberta para realizar grandes análises de dados no cluster de computação distribuída.

- [Apache Spark](https://spark.apache.org/)

Spark tem várias vantagens quando comparado a outras tecnologias de Big Data e MapReduce, como Hadoop e Storm. Spark é mais rápido do que o MaReduce e oferece pouca latência devido à redução na operação de entrada e saída do disco. Spark tem a capacidade de computação e operações de memória, o que torna o processamento de dados muito rápido do que outros MapReduce.

Ao contrário do Hadoop, o Spark mantém os resultados intermédios na memória ao invés de escrever cada saída intermediária para o disco. Isso diminui enormemente o tempo de execução da operação, resultando em uma execução mais rápida da tarefa, sendo 100x mais rápido que um trabalho MapReduce padrão.

O Apache Spark também pode armazenar dados no disco. Quando os dados cruzam o limite do armazenamento de memória, ele é derramado no disco. Desta forma, o Spark atua como uma extensão do MapReduce. Spark não executa as tarefas imediatamente, mas mantém uma cadeia de operações como metadados do trabalho chamado DAG.

Comando para entrar no **console do Spark**:
```sh
spark­-shell
```

## Resilient Distributed Datasets (RDD)
O RDD é uma coleção distribuída imutável de objetos. Cada conjunto de dados no RDD é dividido em partições lógicas, que podem ser computadas em diferentes nós do cluster. Os RDDs podem conter qualquer tipo de objetos Python, Java ou Scala, incluindo classes definidas pelo usuário. Formalmente, um RDD é uma coleção de registros de leitura e partição. O RDD é uma coleção de elementos tolerantes a falhas que podem ser operados em paralelo.

Existem duas maneiras de criar RDDs - paralelizar uma coleção existente em seu programa de driver ou fazer referência a um conjunto de dados em um sistema de armazenamento externo, como um sistema de arquivos compartilhado, HDFS, HBase ou qualquer fonte de dados que ofereça um formato de entrada Hadoop.

Spark faz uso do conceito de RDD para conseguir operações MapReduce mais rápidas e eficientes. Vamos primeiro discutir como as operações MapReduce ocorrem e porque elas não são tão eficientes.

## Dataframes
Um DataFrame é um conjunto de dados organizado em colunas nomeadas. É conceitualmente equivalente a uma tabela em um banco de dados relacional ou um quadro de dados em R/Python, mas com otimizações mais ricas sob o capô.

Os DataFrames podem ser construídos a partir de uma grande variedade de fontes, tais como: arquivos de dados estruturados, tabelas em Hive, bancos de dados externos ou RDDs existentes. A API DataFrame está disponível em Scala, Java, Python e R. Em Scala e Java, um DataFrame é representado por um Conjunto de Dados de Linhas.

Na API Scala, o DataFrame é simplesmente um tipo de alias do Dataset [Row]. Enquanto, na API Java, os usuários precisam usar o Dataset <Row> para representar um DataFrame.

## Scala
Scala é uma linguagem de programação de propósito geral, diga-se multiparadigma, projetada para expressar padrões de programação comuns de uma forma concisa, elegante e type-safe. Ela incorpora recursos de linguagens orientadas a objetos e funcionais. Também é plenamente interoperável com Java.

- [Scala - Basic Syntax](https://www.tutorialspoint.com/scala/scala_basic_syntax.htm)

**Executar script** pelo terminal:
```sh
spark­-shell -­i script.scala
```

### Descrição dos comandos

| Comando      | Descrição     |
| ------------ | ------------- |
| `:quit` | Sair do console do Spark |
| `collect()` | Permite exibir o conteúdo de um RDD |
| `count()` | Retorna o número de elementos no RDD |
| `createOrReplaceTempView` | Permite criar uma visão SQL temporária usando DataFrame |
| `first()` | Retorna o primeiro elemento no RDD |
| `org.apache.spark.sql.hive.HiveContext(sc)` | Mecanismo de execução Spark SQL que se integra com os dados armazenados na Hive |
| `printSchema()` | Permite visualizar a estrutura (esquema) do DataFrame |
| `rdd.saveAsTextFile` | Permite salvar no formato TXT, o conteúdo armazenado em um Dataframe |
| `sc.textFile` | Permite criar um RDD com cada linha como elemento, a partir de um arquivo do tipo TXT armazenado no sistema de arquivo Local e HDFS |
| `show()` | Permite visualizar os dados de uma Dataframe |
| `spark.read.json` | Permite criar um Dataframe com cada linha como elemento, a partir de um arquivo do tipo JSON armazenado no sistema de arquivo Local e HDFS |
| `take(n)` | Retorna uma matriz dos primeiros n elementos do RDD |
| `write.csv` | Permite salvar no formato CSV, o conteúdo armazenado em um Dataframe |
| `write.mode("overwrite").saveAsTable` | Permite salvar em um tabela do Hive, o conteúdo armazenado em um Dataframe |

### Descrição das diretivas do arquivo agent-conf.properties

| Diretivas do arquivo | Descrição     |
| ------------ | ------------- |
| `agent.channels` | Define que o agente ira usar um Channel de memoria |
| `agent.channels.memoryChannel.capacity` | Define o número máximo de eventos armazenados no canal |
| `agent.channels.memoryChannel.transactionCapacity` | Define o número máximo de eventos que o canal irá tirar de uma fonte ou dar a um Sink por transação |
| `agent.channels.memoryChannel.type` | Define que o coletor de dados é um canal de memoria |
| `agent.sinks` | Define que o agente ira usar um Sink HDFS |
| `agent.sinks.hbaseSink.columnFamily` | Define o nome da família de colunas no Hbase onde os dados serão armazenados |
| `agent.sinks.hbaseSink.serializer` | Define as propriedades a serem passadas para o serializador |
| `agent.sinks.hbaseSink.table` | Define o nome da tabela HBase onde os dados serão armazenados |
| `agent.sinks.hbaseSink.type` | Define um Sink que lê eventos de um canal e os grava no HBase |
| `agent.sinks.hdfsSink.hdfs.batchSize` | Define o número de eventos escritos no arquivo antes de ser descarregado para HDFS |
| `agent.sinks.hdfsSink.hdfs.filePrefix` | Define um nome para arquivos criados pelo Flume no HDFS |
| `agent.sinks.hdfsSink.hdfs.path` | Define onde o Sink ira gravar os dados no HDFS |
| `agent.sinks.hdfsSink.hdfs.rollCount` | Define o número de eventos escritos no arquivo |
| `agent.sinks.hdfsSink.type` | Define que o Sink ira gravar em um sistema de arquivos HDFS |
| `agent.sources` | Define que o agente ira usar um Source NetCat |
| `agent.sources.netcatSrc.bind` | Define o IP do servidor NetCat |
| `agent.sources.netcatSrc.channels` | Define que a fonte de dados ira usar um canal de memoria |
| `agent.sources.netcatSrc.port` | Define a porta do servidor NetCat |
| `agent.sources.netcatSrc.type` | Define que a fonte de dados é uma conexão NetCat |