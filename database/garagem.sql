-- MySQL 8.0.16 ou superior
CREATE DATABASE IF NOT EXISTS garagem DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE garagem;

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150),
    email VARCHAR(150) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    cidade VARCHAR(100),
    PRIMARY KEY (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS preferencias (
    id_preferencia INT NOT NULL AUTO_INCREMENT,
    idioma VARCHAR(30),
    tamanho_letra VARCHAR(20),
    cor VARCHAR(30),
    fonte VARCHAR(50),
    fk_usuario INT NOT NULL,
    PRIMARY KEY (id_preferencia),
    FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
    UNIQUE (fk_usuario)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS entusiasta (
    id_entusiasta INT NOT NULL,
    PRIMARY KEY (id_entusiasta),
    FOREIGN KEY (id_entusiasta) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS dono_oficina (
    id_dono_oficina INT NOT NULL,
    nome_responsavel VARCHAR(150),
    telefone VARCHAR(20),
    PRIMARY KEY (id_dono_oficina),
    FOREIGN KEY (id_dono_oficina) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS oficina (
    id_oficina INT NOT NULL AUTO_INCREMENT,
    nome_fantasia VARCHAR(150),
    razao_social VARCHAR(150),
    cnpj VARCHAR(20),
    descricao TEXT,
    logo VARCHAR(255),
    horarios VARCHAR(255),
    cep VARCHAR(10),
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    fk_dono_oficina INT NOT NULL,
    PRIMARY KEY (id_oficina),
    FOREIGN KEY (fk_dono_oficina) REFERENCES dono_oficina (id_dono_oficina)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS avaliacao (
    id_avaliacao INT NOT NULL AUTO_INCREMENT,
    `data` DATE,
    estrelas TINYINT NOT NULL,
    descricao TEXT,
    fk_entusiasta INT NOT NULL,
    fk_oficina INT NOT NULL,
    PRIMARY KEY (id_avaliacao),
    FOREIGN KEY (fk_entusiasta) REFERENCES entusiasta (id_entusiasta),
    FOREIGN KEY (fk_oficina) REFERENCES oficina (id_oficina),
    CHECK (estrelas BETWEEN 1 AND 5)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS servicos (
    id_servico INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    categoria VARCHAR(50),
    PRIMARY KEY (id_servico)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS registra (
    fk_oficina INT NOT NULL,
    fk_servico INT NOT NULL,
    PRIMARY KEY (fk_oficina, fk_servico),
    FOREIGN KEY (fk_oficina) REFERENCES oficina (id_oficina),
    FOREIGN KEY (fk_servico) REFERENCES servicos (id_servico)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS fotos (
    id_foto INT NOT NULL AUTO_INCREMENT,
    imagem VARCHAR(255),
    fk_oficina INT NOT NULL,
    PRIMARY KEY (id_foto),
    FOREIGN KEY (fk_oficina) REFERENCES oficina (id_oficina)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS guia (
    id_guia INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(150),
    descricao TEXT,
    categoria VARCHAR(50),
    custo_estimado VARCHAR(50),
    exige_regularizacao TINYINT(1) NOT NULL,
    PRIMARY KEY (id_guia),
    CHECK (exige_regularizacao IN (0, 1))
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS acessa (
    fk_usuario INT NOT NULL,
    fk_guia INT NOT NULL,
    data_acesso DATETIME NOT NULL,
    PRIMARY KEY (fk_usuario, fk_guia, data_acesso),
    FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_guia) REFERENCES guia (id_guia)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS legalizacao (
    id_legalizacao INT NOT NULL AUTO_INCREMENT,
    data_atualizacao DATE,
    fk_guia INT NOT NULL,
    PRIMARY KEY (id_legalizacao),
    FOREIGN KEY (fk_guia) REFERENCES guia (id_guia)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS etapas (
    id_etapa INT NOT NULL AUTO_INCREMENT,
    numero INT,
    titulo VARCHAR(150),
    descricao TEXT,
    documentos_necessarios TEXT,
    valor VARCHAR(50),
    fk_legalizacao INT NOT NULL,
    PRIMARY KEY (id_etapa),
    FOREIGN KEY (fk_legalizacao) REFERENCES legalizacao (id_legalizacao)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS fonte (
    id_fonte INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150),
    orgao VARCHAR(150),
    referencia VARCHAR(255),
    data_consulta DATE,
    PRIMARY KEY (id_fonte)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS possui (
    fk_etapa INT NOT NULL,
    fk_fonte INT NOT NULL,
    PRIMARY KEY (fk_etapa, fk_fonte),
    FOREIGN KEY (fk_etapa) REFERENCES etapas (id_etapa),
    FOREIGN KEY (fk_fonte) REFERENCES fonte (id_fonte)
) ENGINE=InnoDB;
