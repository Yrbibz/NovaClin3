CREATE DATABASE  novaclin

USE novaclin


CREATE TABLE Recepcionsita (
idRecepcionista INT NOT NULL PRIMARY KEY auto_increment,
nomerecepcionista VARCHAR(50)NOT NULL, 
cpf CHAR (11) NOT NULL UNIQUE,
login VARCHAR(20)NOT NULL UNIQUE, 
senha CHAR(6)NOT NULL, 
celular CHAR(11)  
);

SHOW TABLES  
DROP TABLE medico

CREATE TABLE Paciente (
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomepaciente VARCHAR(50)NOT NULL, 
cpf CHAR (11) NOT NULL UNIQUE,
celular CHAR(11) NOT NULL, 
email VARCHAR(30), 
logradouro VARCHAR(30)NOT NULL, 
numero VARCHAR(6) NOT NULL,
complemento VARCHAR (10),
cidade VARCHAR (20) NOT NULL,
cep VARCHAR (8),
OBS VARCHAR (100) 
);

CREATE TABLE Especialidade(
idespecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeespecialidade VARCHAR (30) NOT NULL UNIQUE
);

CREATE TABLE Medico (
idmedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idespecialidade INT NOT NULL,
nomemedico VARCHAR(50)NOT NULL, 
crm CHAR (8) NOT NULL UNIQUE,
login VARCHAR(20) NOT NULL UNIQUE, 
senha CHAR(6) NOT NULL
);

CREATE TABLE Consulta (
idconsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idmedico INT NOT NULL,
idpaciente INT NOT NULL,
idrecepcionista INT NOT NULL,
datahora DATETIME NOT NULL, 
sintomas VARCHAR(200), 
prescricao VARCHAR(200)
);

CREATE TABLE Exame (
idexame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idconsulta INT NOT NULL,
datahora DATETIME NOT NULL,
nomeexame VARCHAR(30) NOT NULL DEFAULT 'Sangue Padrão',
statusexame VARCHAR (10) NOT NULL,
resultado VARCHAR (200),
dataretiradaexame DATETIME,
dataprevisaoentrega DATETIME,
CONSTRAINT chk_statusexame CHECK (statusexame='Em análise' OR statusexame='Disponível' OR statusexame='Entregue')
);

SHOW TABLES