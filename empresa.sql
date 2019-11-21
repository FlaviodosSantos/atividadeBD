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


-- POVOAMENTO


INSERT INTO `empregado`(`matricula`,`nome`,`endereco`,`salario`,`supervisor`,`depto`)
	VALUES(01,'Chico','Rua do Chico',2000,NULL,NULL);
    
INSERT INTO `empregado`(`matricula`,`nome`,`endereco`,`salario`,`supervisor`,`depto`)
	VALUES(02,'Maria','Rua da Maria',2000,NULL,NULL);
    
INSERT INTO `empregado`(`matricula`,`nome`,`endereco`,`salario`,`supervisor`,`depto`)
	VALUES(03,'Julia','Rua da Julia',2000,NULL,NULL);
    
INSERT INTO `empregado`(`matricula`,`nome`,`endereco`,`salario`,`supervisor`,`depto`)
	VALUES(04,'Edvaldo','Rua do Edi',4000,NULL,NULL);
    
INSERT INTO `empregado`(`matricula`,`nome`,`endereco`,`salario`,`supervisor`,`depto`)
	VALUES(05,'Aroldo','Rua do Aroldo',5000,NULL,NULL);
	
	
INSERT INTO `departamento`(`coddep`,`nome`,`gerente`,`dataini`)
	VALUES(01,'depA',04,'2010-01-20');
    
INSERT INTO `departamento`(`coddep`,`nome`,`gerente`,`dataini`)
	VALUES(02,'depB',04,'2010-01-20');
    
INSERT INTO `departamento`(`coddep`,`nome`,`gerente`,`dataini`)
	VALUES(03,'depC',05,'2010-01-20');
    
INSERT INTO `departamento`(`coddep`,`nome`,`gerente`,`dataini`)
	VALUES(04,'depD',05,'2010-01-20');
    
INSERT INTO `departamento`(`coddep`,`nome`,`gerente`,`dataini`)
	VALUES(05,'depE',05,'2010-01-20');
	
	
INSERT INTO `projeto`(`codproj`,`nome`,`local`,`depart`)
	VALUES(01,'projA','salaA',05);
INSERT INTO `projeto`(`codproj`,`nome`,`local`,`depart`)
	VALUES(02,'projB','salaB',01);
INSERT INTO `projeto`(`codproj`,`nome`,`local`,`depart`)
	VALUES(03,'projC','salaC',02);
INSERT INTO `projeto`(`codproj`,`nome`,`local`,`depart`)
	VALUES(04,'projD','salaD',03);
INSERT INTO `projeto`(`codproj`,`nome`,`local`,`depart`)
	VALUES(05,'projE','salaE',04);
		



INSERT INTO `alocacao`(`matric`,`codigop`,`horas`)
	VALUES(01,01,30);
    
INSERT INTO `alocacao`(`matric`,`codigop`,`horas`)
	VALUES(02,01,60);
    
INSERT INTO `alocacao`(`matric`,`codigop`,`horas`)
	VALUES(03,02,90);
    
INSERT INTO `alocacao`(`matric`,`codigop`,`horas`)
	VALUES(04,03,30);
    
INSERT INTO `alocacao`(`matric`,`codigop`,`horas`)
	VALUES(05,04,120);



INSERT INTO `dependente`(`coddepend`,`matricula`,`nome`,`sexo`)
	VALUES(05,05,'Franciquim','M');
    
INSERT INTO `dependente`(`coddepend`,`matricula`,`nome`,`sexo`)
	VALUES(01,01,'Quindim','M');
    
INSERT INTO `dependente`(`coddepend`,`matricula`,`nome`,`sexo`)
	VALUES(02,02,'Marquim','M');
    
INSERT INTO `dependente`(`coddepend`,`matricula`,`nome`,`sexo`)
	VALUES(03,03,'Peidim','M');
    
INSERT INTO `dependente`(`coddepend`,`matricula`,`nome`,`sexo`)
	VALUES(04,04,'Joaninha','M');




	
