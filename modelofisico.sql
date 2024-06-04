/* decimo_logico: */
CREATE SCHEMA Banco;
USE Banco;
CREATE TABLE Forum (
    Horario TIME,
    id_chat INT PRIMARY KEY,
    Data DATE,
    Assunto VARCHAR(100),
    Descricao VARCHAR(500),
    fk_Medico_CPF VARCHA(11),
    fk_Cuidador_CPF VARCHAR(11),
    fk_Paciente_CPF VARCHAR(11)
);

CREATE TABLE Paciente (
    DescricaoDeNecessidades VARCHAR(500),
    DataDeNascimento DATE,
    Nome VARCHAR(45),
    Sobrenome VARCHAR(45),
    CPF VARCHAR(11) PRIMARY KEY
);

CREATE TABLE Medico (
    CRM VARCHAR(12),
    Especialidades VARCHAR(500),
    DataDeNascimento DATE,
    Nome VARCHAR(45),
    Sobrenome VARCHAR(45),
    CPF VARCHAR(11) PRIMARY KEY
);

CREATE TABLE Cuidador (
    TipoContrato VARCHAR(45),
    Periodo VARCHAR(45),
    genero VARCHAR(45),
    fk_historico_cuidado_historico_cuidado_PK INT,
    DataDeNascimento DATE,
    Nome VARCHAR(45),
    Sobrenome VARCHAR(45),
    CPF VARCHAR(11) PRIMARY KEY
);

CREATE TABLE Medicacao (
    idMedicacao INT PRIMARY KEY,
    Tipo VARCHAR(45),
    NomeMedicacao VARCHAR(45),
    Laboratorio VARCHAR(45)
);

CREATE TABLE Formacao_Tecnica (
    especialidade VARCHAR(45)
);

CREATE TABLE historico_cuidado (
    historico_cuidado_PK INT NOT NULL PRIMARY KEY,
    Cpf VARCHAR(11),
    Nome VARCHAR(45)
);

CREATE TABLE Tem_participacao (
    fk_Medico_CPF VARCHAR(11),
    fk_Cuidador_CPF VARCHAR(11),
    fk_Paciente_CPF VARCHAR(11),
    fk_Forum_id_chat INT
);

CREATE TABLE envia_mensagem (
    fk_Medico_CPF VARCHAR(11),
    fk_Cuidador_CPF VARCHAR(11),
    fk_Paciente_CPF VARCHAR(11),
    fk_Forum_id_chat INT,
    Data DATE,
    Hora TIME,
    Conteudo VARCHAR
);

CREATE TABLE e_responsavel_por (
    fk_Paciente_CPF VARCHAR(11),
    fk_Medico_CPF VARCHAR(11),
    fk_Cuidador_CPF VARCHAR(11),
    fk_Paciente_CPF_ VARCHAR(11)
);

CREATE TABLE Cuida (
    fk_Paciente_CPF VARCHAR(11),
    fk_Cuidador_CPF VARCHAR(11)
);

CREATE TABLE Trata (
    fk_Paciente_CPF VARCHAR(11),
    fk_Medico_CPF VARCHAR(11)
);

CREATE TABLE Prescreve_Paciente_Medicacao_Medico (
    fk_Paciente_CPF VARCHAR(11),
    fk_Medicacao_idMedicacao INT,
    fk_Medico_CPF VARCHAR(11)
);

CREATE TABLE tem (
    fk_Cuidador_CPF VARCHAR(11),
    descricao_de_especialidade VARCHAR
);
 
ALTER TABLE Forum ADD CONSTRAINT FK_Forum_2
    FOREIGN KEY (fk_Medico_CPF)
    REFERENCES Medico (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Forum ADD CONSTRAINT FK_Forum_3
    FOREIGN KEY (fk_Cuidador_CPF)
    REFERENCES Cuidador (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Forum ADD CONSTRAINT FK_Forum_4
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Cuidador ADD CONSTRAINT FK_Cuidador_2
    FOREIGN KEY (fk_historico_cuidado_historico_cuidado_PK)
    REFERENCES historico_cuidado (historico_cuidado_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Tem_participacao ADD CONSTRAINT FK_Tem_participacao_1
    FOREIGN KEY (fk_Medico_CPF)
    REFERENCES Medico (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem_participacao ADD CONSTRAINT FK_Tem_participacao_2
    FOREIGN KEY (fk_Cuidador_CPF)
    REFERENCES Cuidador (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem_participacao ADD CONSTRAINT FK_Tem_participacao_3
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem_participacao ADD CONSTRAINT FK_Tem_participacao_4
    FOREIGN KEY (fk_Forum_id_chat)
    REFERENCES Forum (id_chat)
    ON DELETE SET NULL;
 
ALTER TABLE envia_mensagem ADD CONSTRAINT FK_envia_mensagem_1
    FOREIGN KEY (fk_Medico_CPF)
    REFERENCES Medico (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE envia_mensagem ADD CONSTRAINT FK_envia_mensagem_2
    FOREIGN KEY (fk_Cuidador_CPF)
    REFERENCES Cuidador (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE envia_mensagem ADD CONSTRAINT FK_envia_mensagem_3
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE envia_mensagem ADD CONSTRAINT FK_envia_mensagem_4
    FOREIGN KEY (fk_Forum_id_chat)
    REFERENCES Forum (id_chat)
    ON DELETE SET NULL;
 
ALTER TABLE e_responsavel_por ADD CONSTRAINT FK_e_responsavel_por_1
    FOREIGN KEY (fk_Paciente_CPF_)
    REFERENCES Paciente (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE e_responsavel_por ADD CONSTRAINT FK_e_responsavel_por_2
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE e_responsavel_por ADD CONSTRAINT FK_e_responsavel_por_3
    FOREIGN KEY (fk_Medico_CPF)
    REFERENCES Medico (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE e_responsavel_por ADD CONSTRAINT FK_e_responsavel_por_4
    FOREIGN KEY (fk_Cuidador_CPF)
    REFERENCES Cuidador (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE Cuida ADD CONSTRAINT FK_Cuida_1
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE Cuida ADD CONSTRAINT FK_Cuida_2
    FOREIGN KEY (fk_Cuidador_CPF)
    REFERENCES Cuidador (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE Trata ADD CONSTRAINT FK_Trata_1
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE Trata ADD CONSTRAINT FK_Trata_2
    FOREIGN KEY (fk_Medico_CPF)
    REFERENCES Medico (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE Prescreve_Paciente_Medicacao_Medico ADD CONSTRAINT FK_Prescreve_Paciente_Medicacao_Medico_1
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE NO ACTION;
 
ALTER TABLE Prescreve_Paciente_Medicacao_Medico ADD CONSTRAINT FK_Prescreve_Paciente_Medicacao_Medico_2
    FOREIGN KEY (fk_Medicacao_idMedicacao)
    REFERENCES Medicacao (idMedicacao)
    ON DELETE NO ACTION;
 
ALTER TABLE Prescreve_Paciente_Medicacao_Medico ADD CONSTRAINT FK_Prescreve_Paciente_Medicacao_Medico_3
    FOREIGN KEY (fk_Medico_CPF)
    REFERENCES Medico (CPF)
    ON DELETE NO ACTION;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Cuidador_CPF)
    REFERENCES Cuidador (CPF)
    ON DELETE RESTRICT;