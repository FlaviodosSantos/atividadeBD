CREATE DATABASE empresa;
USE empresa;

DROP TABLE IF EXISTS alocacao CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS dependente CASCADE;
DROP TABLE IF EXISTS empregado CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;

CREATE TABLE empregado(
endereco VARCHAR (35) NOT NULL,
matricula int (35) NOT NULL,
nome varchar (35) NOT NULL,
salario int (30) NOT NULL,
supervisor int (35) ,
depto int (10),
primary key (matricula)
);

CREATE TABLE departamento(
coddep int (10) NOT NULL,
nome varchar (35) NOT NULL,
dataini date NOT NULL,
gerente int (35) NOT NULL,
primary key (coddep)
);

CREATE TABLE projeto(
codproj int (35) NOT NULL,
nome varchar (35) NOT NULL,
local varchar (35) NOT NULL,
depart int (35) NOT NULL,
primary key (codproj)
);

CREATE TABLE alocacao(
matric int (35) NOT NULL,
codigop int (35) NOT NULL,
horas int (20) NOT NULL,
primary key(matric,codigop)
);

CREATE TABLE dependente(
coddepend int (35)NOT NULL,
matricula int (35)NOT NULL,
nome varchar (35)NOT NULL,
sexo varchar (35)NOT NULL,
primary key (coddepend)
);

ALTER TABLE empregado ADD CONSTRAINT fk_supervisor FOREIGN KEY (supervisor) REFERENCES empregado(matricula);
ALTER TABLE empregado ADD CONSTRAINT fk_depto FOREIGN KEY (depto) REFERENCES departamento(coddep);
ALTER TABLE departamento ADD CONSTRAINT fk_gerente FOREIGN KEY (gerente) REFERENCES empregado(matricula);
ALTER TABLE projeto ADD CONSTRAINT fk_depart FOREIGN KEY (depart) REFERENCES departamento(coddep);
ALTER TABLE alocacao ADD CONSTRAINT fk_matric FOREIGN KEY (matric) REFERENCES empregado(matricula);
ALTER TABLE alocacao ADD CONSTRAINT fk_codigop FOREIGN KEY (codigop) REFERENCES projeto(codproj);
ALTER TABLE dependente ADD CONSTRAINT fk_matricula FOREIGN KEY (matricula) REFERENCES empregado(matricula);
