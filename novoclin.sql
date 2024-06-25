novaclinCREATE DATABASE  novaclin

USE novaclin


CREATE TABLE Recepcionsita (
idRecepcionista INT NOT NULL PRIMARY KEY auto_increment,
nomerecepcionista VARCHAR(50)NOT NULL, 
cpf CHAR (11) NOT NULL UNIQUE,
login VARCHAR(20)NOT NULL UNIQUE, 
senha CHAR(6)NOT NULL, 
celular CHAR(11)  
);

SELECT *  FROM recepcionsita
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
/*1.Inserir de forma implícita 8 pacientes*/
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
/*2.Inserir de forma explícita 3 recepcionistas*/
INSERT INTO Recepcionsita (nomerecepcionista, cpf, login, senha, celular)
VALUES ('Chico Bento', '73198338832', 'chicobento.senaclin', '1234', '13995051944');

INSERT INTO Recepcionsita (nomerecepcionista, cpf, login, senha, celular)
VALUES ('Franjinha', '06732277820', 'franjinha.senaclin', '1234', '13998756918');

INSERT INTO Recepcionsita (nomerecepcionista, cpf, login, senha, celular)
VALUES ('Cebolinhaa', '13543757857', 'cebol.senaclin', '123456', NOT NULL);

SELECT * FROM recepcionsita

/*3.Inserir de forma explícita 5 especialidades. */
INSERT INTO especialidade (nomeespecialidade)
VALUES 
('Cardiologista'),
('Otorrinolaringologista'),
('Cliníco Geral'),
('Gastroenterologista'),
('Ortopedista');

SELECT * FROM especialidade

/*4.Inserir de forma implícita 5 médicos*/
INSERT INTO medico 
VALUES
(1, 1, 'Pardal','765544SP','pardal_med.senaclin','123654'),
(2, 5, 'Mônica','768880SP','monica_med.senaclin','666355'),
(3, 3, 'Zé Carioca','165544RJ','zeca_med.senaclin','123456'),
(4, 4, 'Magali','265544SP','magali_med.senaclin','785441'),
(5, 2, 'Horácio','365544MG','horacio_med.senaclin','985632');

SELECT * FROM medico

/*5. Inserir de forma explícita uma consulta para cada médico*/
INSERT INTO consulta (idmedico, idpaciente, idrecepcionista, datahora, sintomas, prescricao)
VALUES 
(1, 1, 1, '2024-06-20senaclinsenaclinsenaclinsenaclin 14:30', 'Febre e hemorragia interna', '3 ave maria'),
(2, 2, 1, '2024-06-20 15:40', NULL, NULL),
(3, 3, 1, '2024-07-02 14:00', NULL, NULL),
(4, 7, 2, '2024-07-03 15:30', NULL, NULL),
(5, 8, 2, '2024-07-03 16:30', NULL, NULL);

SELECT * FROM consulta

/*6.Inserir mais duas consultas ao Patinhas*/
INSERT INTO consulta (idmedico, idpaciente, idrecepcionista, datahora, sintomas, prescricao)
VALUES 
(1, 3, 1, '2024-06-21 14:30', 'Dores agudas na lombar', NULL),
(2, 3, 1, '2024-06-22 15:40', NULL, NULL);

/*7.Inserir um exame para cada consulta do Patinhas criada no item anterior (6)*/
INSERT INTO Exame  
VALUES
(1, 6, '2024-06-21 14:45', 'Eletrocardiograma', 'Em análise', NULL, NULL, NULL),
(2, 7, '2024-06-22 16:00', 'Raio-X Coluna', 'Em análise', NULL, NULL, NULL);
 
 SELECT * FROM exame

/*8.Remarcar (Atualizar) a consulta do Donald para a mesma data porém, 2hs mais tarde.*/
UPDATE consulta
SET datahora='2024-06-20 16:30'
WHERE idconsulta=1

/*9. A Minie mudou de endereço mas não mudou de cidade (logradouro, numero e 
complemento). Realize a alteração dos dados.
*/
UPDATE paciente
SET  logradouro= 'Rua da Prisão',
numero= '103',
complemento= 'apto201'
WHERE idpaciente=8
 
SELECT * FROM consulta
 
/*10.O Mickey mudou o celular, realize a alteração*/
UPDATE paciente
SET celular= '21967452123'
WHERE idpaciente = 7
 
/*11.O Patinhas não poderá comparecer na consulta com o Ze Carioca. Realize a exclusão da 
mesma no sistema. Foi possível? Justifique.*/
DROP consulta
WHERE idconsulta = 3 
/*não deu n sei pq*/

/*12.Realize a exclusão da Dr Mônica da tabela Medico. Foi possível? Justifique.
*/
DROP medico 
WHERE idmedico = 2 
/* Não deu pq tem consultas com o id dela */

/**/

/*13.Exibir a data de todas as consultas em ordem cronológica, da que está mais próxima para a 
que está mais longe.*/
SELECT * FROM consulta
SELECT idconsulta, datahora FROM consulta
ORDER BY datahora ASC

/*14.Exibir todos os dados da tabela médico.*/
SELECT * FROM medico
 
/*15.Exibir apenas as cidades em que a clínica possui pacientes, em ordem alfabética.*/
SELECT cidade FROM paciente
ORDER BY cidade ASC
 
/*16.Exibir nome, celular e e-mail de todos os pacientes da clínica, em ordem alfabética.
*/
SELECT nomepaciente, celular, email FROM paciente
ORDER BY nomepaciente ASC
 
/*17.Atualizar apenas o CRM do Dr.Pardal que foi cadastrado errado no sistema.*/
UPDATE medico
SET crm = '765454SP'
WHERE idmedico = 1
 
/*18.Resetar a senha de todos os médicos do sistema para o padrão "DOCTOR".*/
UPDATE medico
SET senha = 'DOCTOR'
 
/*19.Exibir apenas o nome do médico e seu CRM, dos médicos registrados em SP, tudo isto em 
ordem alfabética.*/
SELECT nomemedico, crm FROM medico
WHERE crm LIKE '%SP'
ORDER BY nomemedico ASC
 
/*20.Exibir nome e celular de todos os pacientes que vivem em Santos e possuem nome 
iniciando com a letra P.*/
SELECT nomepaciente, celular FROM paciente
WHERE nomepaciente LIKE 'P%' AND cidade = 'Santos'
 
/*DESAFIO: Exibir o nome, logradouro, numero e cidade de todos os pacientes que moram em 
casa, em ordem alfabética.*/
SELECT nomepaciente, logradouro, numero, cidade FROM paciente
WHERE complemento <> '%'
ORDER BY nomepaciente ASC

/****************************************************/
/*1.Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade 
seja “Cardiologista”. */

SELECT nomemedico, nomeespecialidade, crm FROM medico
INNER JOIN especialidade
ON especialidade.idespecialidade = medico.idespecialidade
WHERE nomeespecialidade LIKE 'Cardiologista'

SELECT * FROM especialidade

/*2.Buscar quantos pacientes a clínica possui por cidade. */
SELECT COUNT(idpaciente) AS 'Quantidade de pacientes', cidade FROM paciente
GROUP BY cidade

/*3.Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem 
cronológica. */
SELECT * from consulta

SELECT datahora, nomemedico, nomepaciente FROM consulta
INNER JOIN paciente
ON consulta.idpaciente = paciente.idpaciente
INNER JOIN medico
ON consulta.idmedico = medico.idmedico
GROUP BY datahora ASC

/*4.Buscar o nome do paciente, celular, email, e a data da consulta de todos os pacientes com 
consulta marcada, desde que vivam em Santos.*/
SELECT nomepaciente, celular, email, datahora FROM consulta
INNER JOIN paciente
ON consulta.idpaciente = paciente.idpaciente
WHERE cidade = 'Santos'

/*5.Buscar todos os pacientes que tenham com a letra "P" no nome.*/
SELECT * FROM paciente
WHERE nomepaciente LIKE '%p%'

/*6.Buscar o nome do médico, a data da consulta, o nome do paciente e a especialidade do médico 
de todas as consultas de determinado dia (escolhido por você), em ordem alfabética. */ 
SELECT nomemedico, datahora, nomepaciente, nomeespecialidade FROM especialidade
INNER JOIN medico
ON medico.idespecialidade = especialidade.idespecialidade
INNER JOIN consulta
ON consulta.idmedico = medico.idmedico
INNER JOIN paciente
ON paciente.idpaciente = consulta.idpaciente
WHERE datahora LIKE '2024-07-03%'
GROUP BY nomemedico ASC

/*7.Buscar o nome dos médicos e sua especialidade, apenas dos médicos com CRM de SP.*/
SELECT nomemedico, nomeespecialidade FROM medico
INNER JOIN especialidade
ON medico.idespecialidade = especialidade.idespecialidade
WHERE crm LIKE '%sp'

/*8.Buscar a data da consulta que está mais longe na clínica.*/
SELECT MAX(datahora) FROM consulta

/*9.Buscar quantos médicos a clínica possui por especialidade.*/
SELECT COUNT(idmedico) FROM/*---*/

/*10.Buscar o nome, celular e email de todos os pacientes que começam com a letra “D” em ordem 
alfabética. */
SELECT nomepaciente, celular, email FROM paciente
WHERE nomepaciente LIKE 'D%'
GROUP BY nomepaciente asc

/*11.Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, em 
ordem cronológica (por data). */
SELECT * FROM exame;
SELECT * FROM consulta;/*----*/

/*12.Buscar o nome do médico, o crm e a data da consulta, de todos os médicos, ainda que não 
possuam consultas.*/

SELECT nomemedico, crm, datahora FROM medico
LEFT JOIN consulta 
ON consulta.idmedico = medico.idmedico

SELECT * FROM consulta

/*13.Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética. 
Trazer os pacientes ainda que não possuam consultas.*/
SELECT nomepaciente, celular, email, datahora FROM paciente
LEFT JOIN consulta
ON consulta.idpaciente = paciente.idpaciente

/*14.Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos 
moradores que moram em São Paulo, em ordem alfabética. */
SELECT nomepaciente, logradouro, numero, complemento FROM paciente
WHERE cidade = 'São Paulo'
ORDER BY nomepaciente asc

SELECT * from paciente
/*15.Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do 
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem 
cronológica invertida. */
SELECT datahora, nomerecepcionista, nomepaciente, nomemedico, nomeespecialidade, celular FROM consulta
INNER JOIN paciente
ON paciente.idpaciente = consulta.idpaciente
INNER JOIN recepcionsita
ON consulta.idrecepcionista = recepcionsita.idrecepcionista
INNER JOIN medico
ON medico.idmedico = consulta.idmedico
INNER JOIN especialidade
ON medico.idespecialidade = especialidade.idespecialidade

SELECT * FROM recepcionsita;
SELECT * FROM paciente;
SELECT * FROM medico;



/*Desafio – é possível realizar? Justifique. 
Precisamos de dois relatórios: 
a) um relatório que mostre quantas consultas 
cada médico realizou na clínica. 
b) um relatório que mostre quantas consultas 
foram realizadas por especialidade.*/
