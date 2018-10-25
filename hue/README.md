# Apache Hue
O Apache Hue (Hadoop User Experience) é uma interface de usuário gráfica aberta, baseada na web. Hue agrupa vários projetos diferentes do ecossistema Hadoop em uma interface configurável para o seu cluster. Os aplicativos do Hue permitem navegar HDFS e trabalhar com consultas Hive e Impala, trabalhos MapReduce e fluxos de trabalho Oozie.

- [HUE](http://gethue.com/)

## Características do Hue

### Editors
O objetivo do Hue's Editor é tornar a consulta de dados fácil e produtiva. Está disponível no modo Editor ou Notebook. O Editor se concentra em Apache Hive e Apache Impala, mas também é compatível com qualquer banco de dados SQL: MySQL, SparkSQL, Oracle, Apache Phoenix, Apache Presto, Apache Drill, Apache Kylin, PostgreSQL, MapReduce, Spark, Pig e Solr SQL.

### Dashboards
Os Dashboards são uma maneira interativa de explorar seus dados de forma rápida e fácil. Não é necessária nenhuma programação e a análise é feita por arrastar e soltar e clicar .Eles dependem do Apache Solr, mas os motores SQL com Apache Impala e Apache Hive estão atualmente sendo integrados.

#### Características
- Atualização da interface dinâmica em tempo real;
- Text, Timeline, Pie, Line, Bar, Map, Filtros, Grid e widgets HTML;
- Assistente de criação de índice Solr de um arquivo ou ETL claro e disparando um trabalho em lote;
- Edite as permissões Solr com o Sentry.

### Scheduler
O Apache Hue permite que você crie fluxos de trabalho e agendamentos para serem executados regularmente automaticamente. Uma interface de monitoramento mostra o progresso, registra e permite ações como pausar ou parar trabalhos.

#### Características do Editor
- Exportar e importa Worfklows;
- Arrasta e solta as consultas do Hue gravadas;
- Enviar lote Spark Jobs;
- Gerencia Fluxo de trabalho.

#### Características do Dashboard
- Navegação entre Jobs;
- Pesquisa de Jobs
- Manipulação em massa;
- Executar Jobs;
- Reenviar Jobs.

### Browsers
Os navegadores da Hue permitem que você navegue facilmente e execute ações em dados ou trabalhos. O navegador é genérico e os conectores já estão disponíveis para:
- Tabelas (Hive, Impala, HBase);
- Arquivos (HDFS, S3);
- Índices (coleções Solr);
- Empregos (YARN, Oozie);
- Políticas do Sentry.

## Componentes do Hue
- **Servidor Hue**: Local que armazena a aplicação web;
- **Banco de dados Hue**: Armazena dados da aplicação web;
- **Hue UI**: Aplicativo de interface de usuário da web;
- **API REST**: Permite a comunicação com componentes Hadoop.

## Navegadores Suportados
- Google Chrome;
- Mozilla Firefox 17+;
- Internet Explorer 9+;
- Safari 5+.