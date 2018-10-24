# Apache HBase
O Apache HBase fornece acesso aleatório e em tempo real aos seus dados no Hadoop. Foi criado para hospedar tabelas muito grandes, tornando-se uma ótima opção para armazenar dados multi-estruturados ou esparsos.

- [Apache HBase](https://hbase.apache.org/book.html)

## HBase
HBase é um banco de dados distribuído open-source orientado a coluna, modelado a partir do Google BigTable e escrito em Java.

O HBase não impõe qualquer digitação para os campos de chave ou valor. O mapeamento de coluna designa um esquema e tipos para os dados, que une os dados para um modelo relacional. Os dados do HBase são armazenados pela chave de linha em pares
chave/valor e todas as linhas na tabela são sempre classificadas lexicograficamente por sua chave de linha.

Comando para entrar no **Shell do HBase**:
```sh
hbase shell
```

**Executar script** pelo terminal:
```sh
cat script.sh | hbase shell

echo "scan 'clientes'" | hbase shell
```

**Script HBase**: Para automatizar o processo de cadastro de varias linhas no HBase, crie um script contendo os comandos necessários para adicionar registros em uma tabela. O script não precisa possuir permissão de execução. Através do comando cat é possível enviar a saída do script para o comando hbase shell através de um pipe "|".

### Modelo Lógico
Os dados são acessados pela chave da linha (*Row Key*), família de coluna (*Column Family*), qualificador de coluna (*Column Qualifier*) e registro de data e hora (*Timestamp*) que juntos formam a parte da chave do par de chave/valor. Todos os valores chave/valor para uma família de coluna fornecida são armazenados juntos no mesmo conjunto de arquivos. As chaves são comparadas em um nível binário, byte por byte, da esquerda para a direita. As chaves de linha são sempre exclusivas. As chaves de linha podem ser qualquer matriz arbitrária de bytes.

### Descrição dos comandos

| Comando      | Descrição     |
| ------------ | ------------- |
| `count` | O comando recuperará a contagem de várias linhas em uma tabela. O valor retornado por este é o número de linhas. A contagem atual é exibida por cada 1000 linhas por padrão. O intervalo de contagem pode ser opcionalmente especificado. O tamanho padrão do cache é de 10 linhas |
| `create` | Cria uma tabela no HBase com o nome especificado, de acordo com o dicionário ou especificações, conforme a família de colunas |
| `delete` | Este comando irá excluir o valor da célula na tabela definida de linha ou coluna. A exclusão deve e deve corresponder exatamente às coordenadas das células excluídas |
| `describe` | Exibe informações sobre o nome da tabela com famílias de colunas, filtros associados, versões entre outros detalhes |
| `disable` | Desativa a tabela |
| `drop` | Apaga a tabela |
| `get` | Ao usar este comando, você receberá uma linha ou conteúdo de celular presente na tabela. Além disso, você também pode adicionar parâmetros adicionais a ele como TIMESTAMP, TIMERANGE, VERSIONS, FILTERS, etc. para obter uma determinada linha ou conteúdo de celular |
| `help` | Exibe um resumo dos comandos do Shell do HBase execute o comando help |
| `list` | Permite listar todas as tabelas que estão presentes ou criadas no HBase |
| `put` | Permite inserir um valor de célula em uma tabela ou linha ou coluna definida ou especificada |
| `scan` | Permite exibir o conteúdo completo da tabela |
| `status` | Este comando fornecerá detalhes sobre o status do sistema como uma série de servidores presentes no cluster, contagem de servidores ativos e valor de carga médio. Você também pode passar por parâmetros específicos dependendo do estado detalhado que deseja saber sobre o sistema. Os parâmetros podem ser "summary", "simple" ou "detailed", o parâmetro padrão fornecido é "summary" |

### Filtros

| Comando      | Descrição     |
| ------------ | ------------- |
| `ColumnCountGetFilter` | Retorna o número limite de colunas na tabela |
| `ColumnPrefixFilter` | Exibe as linhas de uma ou mais colunas a partir de uma string |
| `FirstKeyOnlyFilter` | Exibe somente o primeiro valor de todas as colunas de uma tabela |
| `InclusiveStopFilter` | Retorna todos os valores presentes até a linha especificada |
| `KeyOnlyFilter` | Exibe todos os registros da tabela |
| `MultipleColumnPrefixFilter` | Exibe as linhas de uma ou mais colunas a partir de varias strings |
| `PageFilter` | Retorna a quantidade de colunas na tabela |
| `PrefixFilter` | Exibe as linhas somente de uma determinada coluna |
| `ValueFilter` | Retorna todos os valores comparando um string especifico |

**Exemplos**:
```sh
scan 'clientes', {FILTER => "KeyOnlyFilter()"}

scan 'clientes', {FILTER => "(PrefixFilter ('2')) AND ColumnPrefixFilter('Estado')"}

scan 'clientes', {FILTER => "MultipleColumnPrefixFilter('Nome','Estado')"}

scan 'clientes', {FILTER => "ColumnCountGetFilter(1)"}

scan 'clientes', {COLUMNS => 'contato:Estado', FILTER => "ValueFilter(=,'binaryprefix:SP')"}
```