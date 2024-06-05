/* decimo_logico: */
/* Script de criação */
CREATE SCHEMA Banco2;
USE Banco2;
CREATE TABLE Forum (
    Horario TIME,
    id_chat INT PRIMARY KEY,
    Data DATE,
    Assunto VARCHAR(100),
    Descricao VARCHAR(500),
    fk_Medico_CPF VARCHAR(11),
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
    idFormacao INT PRIMARY KEY,
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
    Conteudo VARCHAR(500)
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
    descricao_de_especialidade VARCHAR(500)
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
/* Inserção de Usuarios */
	/* Inserção de Pacientes*/
		INSERT INTO paciente (DescricaoDeNecessidades, DataDeNascimento, Nome, CPF)
		VALUES ('Necessita de fisioterapia', '1935-08-23', 'Maria Oliveira', '23456789012');

		INSERT INTO paciente (DescricaoDeNecessidades, DataDeNascimento, Nome, CPF)
		VALUES ('Necessita de medicação contínua', '1942-03-19', 'Pedro Souza', '34567890123');

		INSERT INTO paciente (DescricaoDeNecessidades, DataDeNascimento, Nome, CPF)
		VALUES ('Necessita de dieta especial', '1938-11-07', 'Ana Pereira', '45678901234');

		INSERT INTO paciente (DescricaoDeNecessidades, DataDeNascimento, Nome, CPF)
		VALUES ('Necessita de acompanhamento nutricional', '1945-09-15', 'Carlos Lima', '56789012345');

		INSERT INTO paciente (DescricaoDeNecessidades, DataDeNascimento, Nome, CPF)
		VALUES ('Necessita de terapia ocupacional', '1937-02-28', 'Lúcia Mendes', '67890123456');

		INSERT INTO paciente (DescricaoDeNecessidades, DataDeNascimento, Nome, CPF)
		VALUES ('Necessita de monitoramento cardíaco', '1941-12-05', 'José Alves', '78901234567');
	/*Incerção de Cuidadores*/
		INSERT INTO cuidador (TipoContrato, Periodo, genero, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('CLT', 'Manhã', 'Feminino', '1985-03-22', 'Carla', 'Souza', '12345678123');

		INSERT INTO cuidador (TipoContrato, Periodo, genero, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('Autônomo', 'Tarde', 'Masculino', '1990-07-11', 'Roberto', 'Lima', '23456789123');

		INSERT INTO cuidador (TipoContrato, Periodo, genero, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('CLT', 'Noite', 'Feminino', '1982-01-19', 'Mariana', 'Ferreira', '34567890456');

		INSERT INTO cuidador (TipoContrato, Periodo, genero, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('Autônomo', 'Manhã', 'Masculino', '1995-05-30', 'Lucas', 'Almeida', '45678901123');

		INSERT INTO cuidador (TipoContrato, Periodo, genero, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('CLT', 'Tarde', 'Feminino', '1988-09-17', 'Fernanda', 'Santos', '56789012123');

		INSERT INTO cuidador (TipoContrato, Periodo, genero, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('Autônomo', 'Noite', 'Masculino', '1992-12-05', 'Gabriel', 'Pereira', '67890123123');
	/* Incerção de cuidados */
		INSERT INTO Cuida(fk_Paciente_CPF, fk_Cuidador_CPF) values  ('23456789012','56789012123');
		INSERT INTO Cuida(fk_Paciente_CPF, fk_Cuidador_CPF) values  ('56789012345', '45678901123');    
		INSERT INTO Cuida(fk_Paciente_CPF, fk_Cuidador_CPF) values ('34567890123', '67890123123');

/* Script de consultas */
	SELECT * FROM cuidador;
	SELECT * FROM paciente;
	SELECT * FROM medico;


/* views */
	CREATE VIEW CuidadosAgendados AS
		SELECT cuidador.CPF AS 'cpf cuidador',
			cuidador.Nome AS 'cuidador',
			cuidador.Periodo, cuidador.genero,
			paciente.CPF AS 'cpf paciente',
			paciente.Nome AS 'paciente',
			paciente.DescricaoDeNecessidades AS 'necessidades',
			paciente.DataDeNascimento 
		FROM cuidador
		JOIN cuida 
		on Cuida.fk_Cuidador_CPF = cuidador.CPF
		JOIN paciente
		on Cuida.fk_Paciente_CPF = paciente.CPF;

	SELECT * FROM CuidadosAgendados;

/* Stored Procedure */
	DELIMITER $$
    CREATE PROCEDURE CalcularIdade(IN DataDeNascimento DATE, OUT Idade INT)
	
    BEGIN
    DECLARE Hoje DATE;
    DECLARE Anos INT;
    
    SET Hoje = CURDATE();
    SET Anos = YEAR(Hoje) - YEAR(DataDeNascimento);
    
    -- se o aniversário ainda não ocorreu este ano
    IF (MONTH(Hoje) < MONTH(DataDeNascimento)) OR (MONTH(Hoje) = MONTH(DataDeNascimento) AND DAY(Hoje) < DAY(DataDeNascimento)) THEN
        SET Anos = Anos - 1;
    END IF;
    
    SET Idade = Anos;
    
    
    END $$
    DELIMITER ;
 -- testando 
    set @idade =0;
    select DataDeNascimento into @DataParametro from paciente where CPF = '78901234567';
    call CalcularIdade(@DataParametro, @idade); 
    select @idade as 'calculo';