# Apache Flume
O Apache Flume é um software distribuído, confiável e disponível para coletar, agregar e mover com eficiência grandes quantidades de dados de log. Tem uma arquitetura simples e flexível baseada em fluxos de dados de fluxo contínuo.

- [Apache Flume](https://flume.apache.org/)

## Flume
O Flume não se restringe apenas à coleta de logs, e pode ser usado para transportar grandes quantidades de dados, como os gerados em social media, e-mails e qualquer fonte de dados possível.

### Descrição dos comandos

| Comando      | Descrição     |
| ------------ | ------------- |
| `-Dflume.root.logger=DEBUG,console` | Define o nível do Log |
| `-c conf` | Define que o agente ira utilizar um arquivo de configuração |
| `-f` | Especifica um arquivo de configuração da coleta |
| `-n` | Define o nome do agente Flume |
| `agent` | Permite execute um agente Flume |

### Descrição das diretivas do arquivo agent-conf.properties

| Comando      | Descrição     |
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