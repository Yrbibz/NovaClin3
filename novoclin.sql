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

INSERT INTO paciente /*inserindo paciente de forma implicita*/
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


INSERT INTO medico /*inserindo paciente de forma implicita*/
VALUES
(1, 1, 'Pardal','765544SP','pardal_med.senaclin','123654'),
(2, 5, 'Mônica','768880SP','monica_med.senaclin','666355'),
(3, 3, 'Zé Carioca','165544RJ','zeca_med.senaclin','123456'),
(4, 4, 'Magali','265544SP','magali_med.senaclin','785441'),
(5, 2, 'Horácio','365544MG','horacio_med.senaclin','985632');

SELECT * FROM medico

INSERT INTO consulta (idmedico, idpaciente, idrecepcionista, datahora, sintomas, prescricao)
VALUES 
(1, 1, 1, '2024-06-20 14:30', 'Febre e hemorragia interna', '3 ave maria'),
(2, 2, 1, '2024-06-20 15:40', NULL, NULL),
(3, 3, 1, '2024-07-02 14:00', NULL, NULL),
(4, 7, 2, '2024-07-03 15:30', NULL, NULL),
(5, 8, 2, '2024-07-03 16:30', NULL, NULL);

SELECT * FROM consulta

INSERT INTO consulta (idmedico, idpaciente, idrecepcionista, datahora, sintomas, prescricao)
VALUES 
(1, 3, 1, '2024-06-21 14:30', 'Dores agudas na lombar', NULL),
(2, 3, 1, '2024-06-22 15:40', NULL, NULL);


INSERT INTO Exame  
VALUES
(1, 6, '2024-06-21 14:45', 'Eletrocardiograma', 'Em análise', NULL, NULL, NULL),
(2, 7, '2024-06-22 16:00', 'Raio-X Coluna', 'Em análise', NULL, NULL, NULL);
 
 SELECT * FROM exame

UPDATE consulta
SET datahora='2024-06-20 16:30'
WHERE idconsulta=1

/*9*/ 
UPDATE paciente
SET  logradouro= 'Rua da Prisão',
numero= '103',
complemento= 'apto201'
WHERE idpaciente=8
 
SELECT * FROM consulta
 
/*10*/
UPDATE paciente
SET celular= '21967452123'
WHERE idpaciente = 7
 
/*11*/
DROP consulta
WHERE idconsulta = 3 
/*não deu n sei pq*/

/*12*/
DROP medico 
WHERE idmedico = 2 
/* Não deu pq tem consultas com o id dela */

/**/

/*13*/
SELECT * FROM consulta
SELECT idconsulta, datahora FROM consulta
ORDER BY datahora ASC

/*14*/
SELECT * FROM medico
 
/*15*/
SELECT cidade FROM paciente
ORDER BY cidade ASC
 
/*16*/
SELECT nomepaciente, celular, email FROM paciente
ORDER BY nomepaciente ASC
 
/*17*/
UPDATE medico
SET crm = '765454SP'
WHERE idmedico = 1
 
/*18*/
UPDATE medico
SET senha = 'DOCTOR'
 
/*19*/
SELECT nomemedico, crm FROM medico
WHERE crm LIKE '%SP'
ORDER BY nomemedico ASC
 
/*20*/
SELECT nomepaciente, celular FROM paciente
WHERE nomepaciente LIKE 'P%'
 
/*desafio*/
SELECT nomepaciente, logradouro, numero, cidade FROM paciente
WHERE complemento <> '%'
ORDER BY nomepaciente ASC