-- Script SQL para Gestão Inteligente de Fluxo de Trabalho
CREATE TABLE fluxos_trabalho (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tarefas (
    id SERIAL PRIMARY KEY,
    fluxo_trabalho_id INT REFERENCES fluxos_trabalho(id) ON DELETE CASCADE,
    nome VARCHAR(255) NOT NULL,
    atribuido_para VARCHAR(255),
    status VARCHAR(50) CHECK (status IN ('Pendente', 'Em Progresso', 'Concluído', 'Em Espera')),
    prioridade VARCHAR(50) CHECK (prioridade IN ('Baixa', 'Média', 'Alta', 'Crítica')),
    data_vencimento DATE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE logs_fluxo_trabalho (
    id SERIAL PRIMARY KEY,
    fluxo_trabalho_id INT REFERENCES fluxos_trabalho(id) ON DELETE CASCADE,
    acao VARCHAR(255) NOT NULL,
    realizado_por VARCHAR(255) NOT NULL,
    realizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE regras_automacao (
    id SERIAL PRIMARY KEY,
    fluxo_trabalho_id INT REFERENCES fluxos_trabalho(id) ON DELETE CASCADE,
    evento_disparador VARCHAR(255) NOT NULL,
    acao VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
