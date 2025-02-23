-- Script SQL para Gerenciamento Inteligente de Fluxo de Trabalho
CREATE TABLE fluxos_trabalho (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);