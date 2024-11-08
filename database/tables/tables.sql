-- Tabela de Ações (stocks)
CREATE TABLE stocks (
    stock_id INT IDENTITY(1,1) PRIMARY KEY,
    ticker VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    sector VARCHAR(100),
    industry VARCHAR(100),
    currency VARCHAR(10),
    CONSTRAINT UC_stocks_ticker UNIQUE (ticker)
);

-- Tabela de Dados de Ações (stock_data)
CREATE TABLE stock_data (
    data_id INT IDENTITY(1,1) PRIMARY KEY,
    stock_id INT,
    date DATE NOT NULL,
    open_price DECIMAL(10,2),
    close_price DECIMAL(10,2),
    high_price DECIMAL(10,2),
    low_price DECIMAL(10,2),
    volume BIGINT,
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Tabela de Seleções de Usuários (user_selections)
CREATE TABLE user_selections (
    selection_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    stock_id INT,
    selected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Tabela de Usuários (users)
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Performance de Ações (stock_performance)
CREATE TABLE stock_performance (
    performance_id INT IDENTITY(1,1) PRIMARY KEY,
    stock_id INT,
    date DATE NOT NULL,
    percent_change DECIMAL(5,2),
    moving_avg DECIMAL(10,2),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Tabela de Watchlists (watchlists)
CREATE TABLE watchlists (
    watchlist_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Tabela de Logs de Atividade do Usuário (user_activity_logs)
CREATE TABLE user_activity_logs (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    action VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
