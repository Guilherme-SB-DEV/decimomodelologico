/* Script de criação */
CREATE SCHEMA Banco;
USE Banco;

CREATE TABLE Forum (
    Horario TIME,
    id_forum INT PRIMARY KEY,
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
    fk_Forum_id_forum INT
);

CREATE TABLE envia_mensagem (
    fk_Medico_CPF VARCHAR(11),
    fk_Cuidador_CPF VARCHAR(11),
    fk_Paciente_CPF VARCHAR(11),
    fk_Forum_id_forum INT,
    Data DATE,
    Hora TIME,
    Conteudo VARCHAR(500)
);
CREATE TABLE Responsavel (
	Nome VARCHAR(45),
    Sobrenome VARCHAR(45),
    DataDeNascimento DATE,
    CPF VARCHAR(11) PRIMARY KEY
);
CREATE TABLE e_responsavel_por (
	fk_Responsavel_CPF VARCHAR(11),
    fk_Paciente_CPF VARCHAR(11)
    
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
    FOREIGN KEY (fk_Forum_id_forum)
    REFERENCES Forum (id_forum)
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
    FOREIGN KEY (fk_Forum_id_forum)
    REFERENCES Forum (id_forum)
    ON DELETE SET NULL;
 


ALTER TABLE e_responsavel_por ADD CONSTRAINT FK_e_responsavel_por_1
    FOREIGN KEY (fk_Responsavel_CPF)
    REFERENCES Responsavel (CPF)
    
    ON DELETE SET NULL; 

ALTER TABLE e_responsavel_por ADD CONSTRAINT FK_e_responsavel_por_2
    FOREIGN KEY (fk_Paciente_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE RESTRICT;

 
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
	
    
    /* Inserção de medicos */    
		INSERT INTO medico (CRM, Especialidades, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('123456', 'Cardiologia', '1970-02-15', 'João', 'Silva', '14445678901');

		INSERT INTO medico (CRM, Especialidades, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('789012', 'Neurologia', '1980-07-22', 'Maria', 'Oliveira', '24456789012');

		INSERT INTO medico (CRM, Especialidades, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('345678', 'Ortopedia', '1975-05-30', 'Carlos', 'Lima', '34467890123');

		INSERT INTO medico (CRM, Especialidades, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('901234', 'Pediatria', '1985-11-12', 'Ana', 'Pereira', '44478901234');

		INSERT INTO medico (CRM, Especialidades, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('567890', 'Dermatologia', '1990-03-18', 'Lucas', 'Almeida', '54489012345');

		INSERT INTO medico (CRM, Especialidades, DataDeNascimento, Nome, Sobrenome, CPF)
		VALUES ('123789', 'Ginecologia', '1982-09-25', 'Fernanda', 'Santos', '64490123456');
	
   
    /* Inserção medicação */
		INSERT INTO medicacao (idMedicacao, Tipo, NomeMedicacao, Laboratorio)
		VALUES (1, 'Analgésico', 'Paracetamol', 'Laboratório A');

		INSERT INTO medicacao (idMedicacao, Tipo, NomeMedicacao, Laboratorio)
		VALUES (2, 'Antibiótico', 'Amoxicilina', 'Laboratório B');

		INSERT INTO medicacao (idMedicacao, Tipo, NomeMedicacao, Laboratorio)
		VALUES (3, 'Anti-inflamatório', 'Ibuprofeno', 'Laboratório C');

		INSERT INTO medicacao (idMedicacao, Tipo, NomeMedicacao, Laboratorio)
		VALUES (4, 'Antipirético', 'Dipirona', 'Laboratório D');

		INSERT INTO medicacao (idMedicacao, Tipo, NomeMedicacao, Laboratorio)
		VALUES (5, 'Antialérgico', 'Loratadina', 'Laboratório E');

		INSERT INTO medicacao (idMedicacao, Tipo, NomeMedicacao, Laboratorio)
		VALUES (6, 'Antifúngico', 'Fluconazol', 'Laboratório F');
	
    /* Inserções Responsaveis */
		INSERT INTO Responsavel (Nome, Sobrenome, CPF, DataDeNascimento) VALUES('Gabriel', 'Azevedo', '45682971634', '1998-05-02');
		INSERT INTO Responsavel (Nome, Sobrenome, CPF, DataDeNascimento) VALUES('Adriana', 'Souza', '65878914763', '1999-06-13');
        
	/* Inserções Cuidados */
		INSERT INTO Cuida(fk_Paciente_CPF, fk_Cuidador_CPF) values  ('23456789012','56789012123');
		INSERT INTO Cuida(fk_Paciente_CPF, fk_Cuidador_CPF) values  ('56789012345', '45678901123');    
		INSERT INTO Cuida(fk_Paciente_CPF, fk_Cuidador_CPF) values ('34567890123', '67890123123');
        
	/* Inserção trata */
		INSERT INTO trata (fk_Paciente_CPF, fk_Medico_CPF) VALUES ('56789012345', '64490123456');
		INSERT INTO trata (fk_Paciente_CPF, fk_Medico_CPF) VALUES('78901234567', '14445678901');
        INSERT INTO trata (fk_Paciente_CPF, fk_Medico_CPF) VALUES('45678901234', '24456789012');
	

/* Script de consultas */

	SELECT * FROM cuidador;
	SELECT * FROM paciente;
	SELECT * FROM medico;
    SELECT * FROM responsavel;
	SELECT * FROM medicacao;
    
  	SELECT * FROM paciente WHERE CPF LIKE "%CPF%";
	SELECT * FROM medico WHERE CPF LIKE "%CPF%";
	SELECT * FROM cuidador WHERE CPF LIKE "%CPF%";
    
    SELECT * FROM medicacao WHERE idMedicacao=?;
    

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

-- Testando
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
    
    /* Function */
    DELIMITER $$
    CREATE FUNCTION FormataCPF(CPF VARCHAR(11)) RETURNS VARCHAR(15) 
    DETERMINISTIC
    BEGIN
    DECLARE CPFformatado VARCHAR(15);
    SET CPFformatado = CONCAT(
    SUBSTRING(CPF, 1, 3), '.',
    SUBSTRING(CPF, 4, 3), '.',
    SUBSTRING(CPF, 7, 3), '-',
    SUBSTRING(CPF, 10, 2)
    );
    RETURN CPFformatado;
    END $$
    DELIMITER ;

    -- Testando 
    select FormataCPF(CPF) from paciente;
    
    
	/*Trigger*/
    
	DELIMITER //
	CREATE TRIGGER AutorizacaoChat BEFORE INSERT
	ON envia_mensagem
	FOR EACH ROW
	 BEGIN
		DECLARE usuario_pertence INT;

		-- Verifica se o usuário existe na tabela valid_users
		
		SELECT COUNT(*) INTO usuario_pertence
		FROM tem_participacao
		WHERE fk_Medico_CPF = NEW.fk_Medico_CPF OR fk_Cuidador_CPF = NEW.fk_Cuidador_CPF OR fk_Paciente_CPF = NEW.fk_Paciente_CPF;
		
		IF usuario_pertence = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuário não autorizado.';
		END IF;
	 END;
	//
	-- testando 
    
    INSERT INTO forum(id_forum, Data, Assunto, Descricao, fk_Medico_CPF) VALUES(2, CURDATE(), 'falta de Medicamentos', 'medicamentos', '64490123456');// -- cria forum
    
	INSERT INTO tem_participacao(fk_Medico_CPF) VALUES('64490123456');// -- insere participante
    INSERT INTO envia_mensagem(fk_Medico_CPF, Data, Hora, Conteudo)VALUES('64490123456', CURDATE(), CURTIME(), 'Bom dia!');// -- envia mensagem
    
    INSERT INTO tem_participacao(fk_Paciente_CPF)VALUES('34567890123');// -- insere participante
    INSERT INTO envia_mensagem(fk_Paciente_CPF, Data, Hora, Conteudo)VALUES('34567890123', CURDATE(), CURTIME(), 'Bom dia!');// -- envia mensagem
    
    select * from envia_mensagem;//

	
    
