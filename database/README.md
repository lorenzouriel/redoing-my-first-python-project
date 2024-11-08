# Sistema de Monitoramento de Ações - Yahoo Finance

Este sistema permite que os usuários selecionem ações do Yahoo Finance, acompanhem os dados históricos e visualizem informações e gráficos a partir dos dados armazenados em uma base de dados.

## Estrutura do Banco de Dados

### Tabela: `stocks`

Armazena as informações básicas sobre cada ação.

| Coluna     | Tipo           | Descrição                               |
|------------|----------------|-----------------------------------------|
| `stock_id` | `INT`          | Identificador único da ação             |
| `ticker`   | `VARCHAR(10)`   | Símbolo da ação (ex: AAPL, MSFT)        |
| `name`     | `VARCHAR(100)`  | Nome da empresa (ex: Apple Inc.)        |
| `sector`   | `VARCHAR(100)`  | Setor da empresa (ex: Tecnologia)       |
| `industry` | `VARCHAR(100)`  | Indústria da empresa (ex: Hardware)     |
| `currency` | `VARCHAR(10)`   | Moeda utilizada (ex: USD, EUR)          |

### Tabela: `stock_data`

Armazena os dados diários ou periódicos das ações, como preços de abertura, fechamento, volume de negociações, etc.

| Coluna       | Tipo           | Descrição                               |
|--------------|----------------|-----------------------------------------|
| `data_id`    | `INT`          | Identificador único da entrada de dados |
| `stock_id`   | `INT`          | Referência para a tabela `stocks`       |
| `date`       | `DATE`         | Data do registro                        |
| `open_price` | `DECIMAL(10,2)`| Preço de abertura                       |
| `close_price`| `DECIMAL(10,2)`| Preço de fechamento                     |
| `high_price` | `DECIMAL(10,2)`| Preço máximo do dia                     |
| `low_price`  | `DECIMAL(10,2)`| Preço mínimo do dia                     |
| `volume`     | `BIGINT`       | Volume de transações                    |

### Tabela: `user_selections`

Armazena quais ações os usuários escolheram para monitoramento ou consulta.

| Coluna         | Tipo           | Descrição                               |
|----------------|----------------|-----------------------------------------|
| `selection_id` | `INT`          | Identificador único da seleção          |
| `user_id`      | `INT`          | Identificador do usuário                |
| `stock_id`     | `INT`          | Referência para a tabela `stocks`       |
| `selected_at`  | `TIMESTAMP`    | Data e hora da seleção                  |

### Tabela: `users`

Armazena as informações dos usuários do sistema.

| Coluna        | Tipo           | Descrição                                |
|---------------|----------------|------------------------------------------|
| `user_id`     | `INT`          | Identificador único do usuário           |
| `username`    | `VARCHAR(100)` | Nome do usuário                          |
| `email`       | `VARCHAR(100)` | Endereço de e-mail                       |
| `created_at`  | `TIMESTAMP`    | Data de criação do usuário               |

### Tabela: `stock_performance`

Armazena cálculos ou métricas de desempenho, como variação de preço, médias móveis, etc.

| Coluna          | Tipo           | Descrição                                 |
|-----------------|----------------|-------------------------------------------|
| `performance_id`| `INT`          | Identificador único do registro           |
| `stock_id`      | `INT`          | Referência para a tabela `stocks`         |
| `date`          | `DATE`         | Data da performance                       |
| `percent_change`| `DECIMAL(5,2)` | Variação percentual do preço de fechamento|
| `moving_avg`    | `DECIMAL(10,2)`| Média móvel do preço (ex: 50 dias)        |

### Tabela: `watchlists`

Armazena listas de observação criadas pelos usuários com ações de interesse.

| Coluna        | Tipo           | Descrição                                |
|---------------|----------------|------------------------------------------|
| `watchlist_id`| `INT`          | Identificador único da lista             |
| `user_id`     | `INT`          | Referência para a tabela `users`         |
| `name`        | `VARCHAR(100)` | Nome da lista de observação              |
| `created_at`  | `TIMESTAMP`    | Data de criação da lista                 |

### Tabela: `user_activity_logs`

Armazena logs de atividade do usuário, como consultas realizadas, ações selecionadas, etc.

| Coluna        | Tipo           | Descrição                                |
|---------------|----------------|------------------------------------------|
| `log_id`      | `INT`          | Identificador único do log               |
| `user_id`     | `INT`          | Referência para a tabela `users`         |
| `action`      | `VARCHAR(100)` | Descrição da ação realizada (ex: "Visualizou ação", "Selecionou AAPL")|
| `timestamp`   | `TIMESTAMP`    | Data e hora da ação                      |

## Funcionalidades

- **Seleção de Ações**: Permite que o usuário selecione as ações que deseja monitorar. O sistema oferece a opção de escolher por setor, indústria ou ticker diretamente.
- **Exibição de Dados**: Exibe gráficos e tabelas com as informações de preço e volume de transações. O sistema gera gráficos de linha, barras ou de candlestick.
- **Métricas de Desempenho**: Calcula variação de preços, médias móveis e outros indicadores de desempenho para as ações selecionadas.
- **Alertas de Preço**: Os usuários podem definir alertas de preço para serem notificados quando uma ação atingir um determinado valor.
- **Consulta de Histórico**: Permite visualizar dados históricos de preços de ações para qualquer período selecionado.

## Como Usar

1. **Escolher Ações**: O usuário pode selecionar ações da lista de ações disponíveis, podendo buscar por nome ou ticker.
2. **Visualizar Gráficos e Dados**: Após selecionar as ações, o sistema exibirá gráficos de preço e volume, além de outras métricas de desempenho.
3. **Definir Alertas**: Os usuários podem configurar alertas de preço para notificações quando as ações atingirem valores definidos.
4. **Consultar Histórico**: O usuário pode consultar dados históricos de ações para análise de preços e desempenho.
