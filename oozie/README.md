# Apache Oozie
O Apache Oozie é um sistema agendador que executa e gerencia trabalhos Hadoop em um ambiente distribuído.

- [Apache Oozie Workflow Scheduler for Hadoop](http://oozie.apache.org/)

## Características do Oozie
Oozie é uma aplicação Web Java de código aberto disponível sob a licença Apache 2.0. É responsável por desencadear as ações do fluxo de trabalho, que por sua vez usa o mecanismo de execução Hadoop para executar a tarefa. Assim, a Oozie é capaz de alavancar as máquinas Hadoop existentes para balanceamento de carga, failover, etc.

Oozie detecta a conclusão das tarefas através do retorno de chamada e de votação. Quando a Oozie inicia uma tarefa, ela fornece uma URL de retorno de chamada exclusiva para a tarefa e notifica essa URL quando ela estiver completa. Se a tarefa não invocar o URL de retorno de chamada, a Oozie pode pesquisar a tarefa para conclusão.

## Tipos de Jobs do Oozie
- **Oozie Workflow Jobs**: Estes são representados como Diálogos Acíclicos Direcionados (DAGs) para especificar uma sequência de ações a serem executadas;
- **Oozie Coordinator Jobs**: Consistem em trabalhos de fluxo de trabalho desencadeados pela disponibilidade de tempo e dados;
- **Oozie Bundle**: Estes podem ser referidos como um pacote de múltiplos trabalhos de coordenador e fluxo de trabalho.

## Servidor Oozie
O servidor Oozie é um aplicativo da Web Java que é executado em um recipiente de servlet Java. Por padrão, o Oozie usa o Apache Tomcat, que é uma implementação de fonte aberta da tecnologia servlet Java. Os clientes, usuários e outros aplicativos da Oozie interagem com o servidor Oozie usando a ferramenta de linha de comando oozie, a API do cliente Oozie Java ou a API REST HTTP Oozie. A ferramenta de linha de comando Oozie e a API Oozie Java, em última análise, usam a API REST HTTP Oozie para se comunicar com o servidor Oozie.

O servidor Oozie é um aplicativo web sem estado. Não guarda informações de usuário ou trabalho na memória entre solicitações de usuários. Todas as informações sobre tarefas executadas e concluídas são armazenadas em um banco de dados SQL. Ao processar uma solicitação do usuário para um trabalho, a Oozie recupera o estado do trabalho correspondente do banco de dados SQL, executa a operação solicitada e atualiza o banco de dados SQL com o novo estado do trabalho.

Este é um padrão de design muito comum para aplicações web e ajuda o Oozie a suportar dezenas de milhares de empregos com hardware relativamente modesto. Todos os estados do trabalho são armazenados no banco de dados SQL e a natureza transacional do banco de dados SQL garante um comportamento confiável dos trabalhos do Oozie, mesmo que o servidor Oozie falhe ou seja encerrado. Quando o servidor Oozie volta, ele pode continuar a gerenciar todos os trabalhos com base em seu último estado conhecido.

## Modelo de implantação de aplicativos

### job.properties
O arquivo job.properties está no sistema de arquivos local e não no HDFS. O nome do arquivo job.properties está em conformidade com as convenções Oozie, mas um nome diferente pode ser usado se desejar (porque este arquivo é explicitamente passado para a linha de comando Oozie). Pense no job.properties como o conjunto de argumentos para o workflow.xml, que é o aplicativo. Este arquivo pode ser usado para passar todas as variáveis necessárias para parametrizar workflow.xml.

| Diretivas do arquivo | Descrição     |
| -------------------- | ------------- |
| `nameNode`           | Variável que define o caminho do nome do qual o HDFS pode ser acessado. Formato: `hdfs://<servidor_namenode>:port` |
| `jobTracker`         | Variável que define o endereço do gerenciador de recursos no caso da implementação do YARN: `<resourcemanager_hostname>:<port>` |
| `queueName`          | Define nome da fila conforme definido por Capacity Scheduler, Fail Scheduler etc. Por padrão, é "default" |
| `examplesRoot`       | Define a variável de ambiente para o fluxo de trabalho |
| `oozie.use.system.libpath` | Permite que um fluxo de trabalho use o ShareLib. O Oozie saberá incluir os arquivos .jar no ShareLib com as ações necessárias em seu trabalho |
| `oozie.wf.application.path` | Variável de ambiente que define o caminho no HDFS que contém o arquivo workflow.xml |
| `oozie.coord.application.path` | Variável de ambiente que define o caminho no HDFS que contém o arquivo coordinator.xml |
| `delete_path` | Define a variável que especifica o caminho para deletar antes de iniciar o fluxo de trabalho |
| `create_path` | Define a variável que especifica o caminho para criar antes de iniciar o fluxo de trabalho |
| `command ou script` | Define a variável que especifica um comando (Sqoop) ou script (Hive,Pig,Spark) durante o fluxo de trabalho |

### workflow.xml
Um aplicativo Oozie é composto por um arquivo que define a lógica do aplicativo mais outros arquivos, como configuração e arquivos JAR e scripts. Um aplicativo de fluxo de trabalho consiste em um arquivo workflow.xml e pode ter arquivos de configuração, Pig scripts, Hive scripts, arquivos JAR e muito mais. Precisamos empacotar e implantar o aplicativo no HDFS antes que possamos executar um trabalho. O pacote de aplicativos Oozie é armazenado em um diretório contendo todos os arquivos para o aplicativo. O arquivo workflow.xml deve estar localizado no diretório raiz do aplicativo.

| Diretivas do arquivo | Descrição     |
| -------------------- | ------------- |
| `job-tracker`        | Define o endereço do gerenciador de recursos |
| `name-node`          | Define o caminho do nome do qual o HDFS pode ser acessado |
| `prepare`            | Sessão utilizada para remover e criar diretórios no HDFS antes de iniciar o fluxo de trabalho |
| `delete path`        | Especifica o caminho para deletar antes de iniciar o fluxo de trabalho |
| `mkdir path`         | Especifica o caminho para criar antes de iniciar o fluxo de trabalho |
| `comand ou script`   | Especifica um comando (Sqoop) ou script (Hive,Pig,Spark) durante o fluxo de trabalho |
| `param`              | Define o valor das variáveis utilizadas no comando ou script |
| `file`               | Especifica o nome do arquivo de configuração necessário para a aplicação |

### coordinator.xml
O Oozie suporta outra abstração chamada coordenadora que agenda e executa o fluxo de trabalho com base em disparadores; Um fluxo de trabalho Oozie pode ser invocado manualmente e sob demanda usando a interface de linha de comando Oozie (CLI) e isso é suficiente para alguns casos básicos de uso. No entanto, para a maioria dos casos de uso prático, isso é inadequado e muito difícil de gerenciar. Por exemplo, poderíamos ter um requisito para executar o fluxo de trabalho todos os dias às 2 da manhã, sendo muito difícil alcançar esse comportamento usando apenas a CLI e básica. As aplicações do coordenador consistem em um arquivo coordinator.xml.

**coordinator-app**
| Diretivas do arquivo | Descrição     |
| -------------------- | ------------- |
| `name`               | Define o nome do fluxo de trabalho |
| `frequency`          | Define a frequência, em minutos, para materializar ações |
| `start`              | Define o início da hora do trabalho. A partir desse momento, as ações serão materializadas |
| `end`                | Define o fim da hora do trabalho. Quando as ações deixarão de ser materializadas |
| `timezone`           | Define o fuso horário da aplicação do coordenador |

**controls**
| Diretivas do arquivo | Descrição     |
| -------------------- | ------------- |
| `timeout`            | Define o tempo máximo, em minutos, de que uma ação materializada aguardará que as condições adicionais sejam satisfeitas antes de serem descartadas |
| `concurrency`        | Um trabalho de coordenador pode especificar a concorrência para suas ações de coordenador, isto é, quantas ações de coordenador podem ser executadas simultaneamente (estado de FUNCIONAMENTO) antes que o mecanismo do coordenador comece a acelerá-las |
| `execution`          | Especifica a ordem de execução se várias instâncias do trabalho do coordenador tiverem cumprido seus critérios de execução. Valores válidos são FIFO (mais antigo primeiro) padrão, LIFO (o mais novo primeiro) e LAST_ONLY (descarta todas as materializações mais antigas) |
| `throttle`           | Define o trabalho de coordenador pode especificar o valor de aceleração de materialização ou criação para suas ações de coordenador, isto é, quantas ações de coordenadoras máximas podem estar em estado WAITING simultaneamente |

**action**
| Diretivas do arquivo | Descrição     |
| -------------------- | ------------- |
| `app-path`               | Define o caminho no HDFS que contém o arquivo workflow.xml |

## Tipos de Workflow
- **Fork e Join**: Nos cenários em que queremos executar vários trabalhos paralelos entre nós, podemos usar o Fork. Quando Fork é usado, temos que usar Join como um nó final para o fork. Para cada Fork deve haver um Join. O Join assume que todo o nó é filho de um único Fork.
- **Decision**: Podemos adicionar tags de decisão para verificar se queremos executar uma ação com base na saída de decisão. Um exemplo é se já tivermos uma tabela do Hive, não precisaremos criá-la novamente. Podemos adicionar um tag de decisão para não executar etapas "Criar Tabela" se a tabela já existir.