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

/*fazendo em casa*/

INSERT INTO paciente
VALUES
(1, 'Donald','95251877803','13999891584','donaldinho@gmail.com', 'Avenida Conselheiro Nébias', '325', 'apto 152', 'Santos', '11045001', 'É paranóico, não desenvolveu bem a fala e lida com graves problemas de raiva'),
(2, 'Margarida','24909330860','13994617584','margarina@gmail.com', 'Rua Alameda Dois', '84', NULL, 'São Vicente', '11348300', NULL),
(3, 'Patinhas','69519213856','13940028922','sugarpatis@gmail.com', 'Rua Alexandre Martins', '110', NULL, 'Santos', '11040311', NULL),
(4, 'Huguinho','44041304814','13400289229','hugoboss@gmail.com', 'Avenida Nossa Senhora da Lapa ', '52', NULL, 'Cubatão', '17809110', 'É o de vermelho'),
(5, 'Luizinho','45974899830','13996792857','luzioca@gmail.com', 'Avenida Adornos', '154', 'apto104', 'Praia Grande', '11725320', 'É o de verde'),
(6, 'Zezinho','50446563641','34996123456','zezindasquebrada@gmail.com', 'Avenida Pão de Queijo', '85', NULL, 'São João del Rei', '39002857', 'É o de azul'),
(7, 'Mickey','93033799779','21996654321', NULL, 'Rua de Fevereiro', '504', 'apto345', 'Rio de Janeiro', '22050001', NULL),
(8, 'Minie','12452597848','11123456789', NULL, 'Rua da Liberdade', '322', 'apto102', 'São Paulo', '01503001', NULL);

SELECT * FROM paciente

/*--------------------*/
INSERT INTO Recepcionsita (nomerecepcionista, cpf, login, senha, celular)
VALUES ('Chico Bento', '73198338832', 'chicobento.senaclin', '1234', '13995051944');

INSERT INTO Recepcionsita (nomerecepcionista, cpf, login, senha, celular)
VALUES ('Franjinha', '06732277820', 'franjinha.senaclin', '1234', '13998756918');

INSERT INTO Recepcionsita (nomerecepcionista, cpf, login, senha, celular)
VALUES ('Cebolinhaa', '13543757857', 'cebol.senaclin', '123456', NOT NULL);

SELECT * FROM recepcionsita


INSERT INTO especialidade (nomeespecialidade)
VALUES 
('Cardiologista'),
('Otorrinolaringologista'),
('Cliníco Geral'),
('Gastroenterologista'),
('Ortopedista');

SELECT * FROM especialidade


 