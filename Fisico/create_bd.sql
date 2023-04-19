CREATE TABLE PERSONAGEM (  
 
CPF NUMBER(3),  
 
NOME VARCHAR(30),  
 
CONSTRAINT PK_PERSONAGEM PRIMARY KEY (CPF)   
 
);

CREATE TABLE TELEFONE (  
 
CPF NUMBER(3),  
 
NUMERO NUMBER(6),  
 
CONSTRAINT PK_TELEFONE PRIMARY KEY (CPF,NUMERO),  
 
CONSTRAINT FK_TELEFONE FOREIGN KEY (CPF) REFERENCES PERSONAGEM (CPF)   
 
);

CREATE TABLE ENFERMEIRA (  
 
CPF NUMBER(3),  
 
CRM NUMBER(3) NOT NULL UNIQUE,  
 
CONSTRAINT FK_ENFERMEIRA FOREIGN KEY (CPF) REFERENCES PERSONAGEM (CPF),  
 
CONSTRAINT PK_ENFERMEIRA PRIMARY KEY (CPF)  
 
);

CREATE TABLE PROFESSOR (  
 
CPF NUMBER(3),  
 
DIPLOMA VARCHAR(20),  
 
CONSTRAINT PK_PROFESSOR PRIMARY KEY (CPF),  
 
CONSTRAINT FK_PROFESSOR FOREIGN KEY (CPF) REFERENCES  
 
PERSONAGEM (CPF)  
 
);

CREATE TABLE TREINADOR (  
 
CPF NUMBER(3),  
 
CPF_PROF NUMBER(3) NOT NULL,  
 
CTP NUMBER(3) NOT NULL UNIQUE,  
 
RESIDENCIA VARCHAR(30),  
 
CONSTRAINT FK_TREINADOR_TO_PERSONAGEM FOREIGN KEY (CPF) REFERENCES PERSONAGEM (CPF),  
 
CONSTRAINT FK_ENSINA FOREIGN KEY (CPF_PROF) REFERENCES PROFESSOR (CPF),  
 
CONSTRAINT PK_TREINADOR PRIMARY KEY (CPF)  
 
);

CREATE TABLE GINASIO (  
 
ID NUMBER (2),  
 
CIDADE VARCHAR (30),  
 
TIPO VARCHAR (10),

CPF_LIDER NUMBER(3) NOT NULL UNIQUE,  
 
CONSTRAINT PK_GINASIO PRIMARY KEY (ID),

CONSTRAINT FK_TREINADOR_TO_GINASIO FOREIGN KEY (CPF_LIDER) REFERENCES TREINADOR (CPF)  
 
);

CREATE TABLE BATALHA(  
 
DESAFIANTE NUMBER(3),  
 
DESAFIADO NUMBER(3),  
 
DATA DATE,	  
 
ID NUMBER(2),  
 
CONSTRAINT PK_BATALHA PRIMARY KEY (DESAFIANTE,DESAFIADO,DATA),  
 
CONSTRAINT FK_DESAFIANTE FOREIGN KEY (DESAFIANTE) REFERENCES TREINADOR (CPF),  
 
CONSTRAINT FK_DESAFIADO FOREIGN KEY (DESAFIADO) REFERENCES TREINADOR (CPF),  
 
CONSTRAINT FK_BATALHA_GINASIO FOREIGN KEY (ID) REFERENCES GINASIO (ID)  
 
);



CREATE TABLE ESPECIE (  
 
ID NUMBER(3),  
 
NOME VARCHAR(30) NOT NULL UNIQUE, 
 
TIPO VARCHAR(30), 
 
CONSTRAINT PK_ESPECIE PRIMARY KEY (ID)
);

CREATE TABLE POKEMON (  
 
DESCRITOR NUMBER(3),  
 
CPF NUMBER(3),  
 
ID NUMBER(3) NOT NULL,  

ATK NUMBER(4),

DEF NUMBER(4),

HEI NUMBER(3, 2),

WEI NUMBER(4),
 
CONSTRAINT PK_POKEMON PRIMARY KEY (CPF, DESCRITOR),  
 
CONSTRAINT FK_POKEMON_TREINADOR FOREIGN KEY (CPF) REFERENCES TREINADOR (CPF),  
 
CONSTRAINT FK_POKEMON FOREIGN KEY (ID) REFERENCES ESPECIE (ID),
 
CONSTRAINT CHK_ATAQUE CHECK (ATK BETWEEN 0 AND 150),  
 
CONSTRAINT CHK_DEFESA CHECK (DEF BETWEEN 0 AND 150)  
);


CREATE TABLE CENTRO_POKEMON (  
 
ZIP_CODE NUMBER(9),  
 
CONSTRAINT PK_CENTRO PRIMARY KEY (ZIP_CODE)  
 
);

CREATE TABLE TRATA (  
 
CPF_ENFERMEIRA NUMBER(3),  
 
CPF_POKEMON NUMBER(3),  
 
DESCRITOR NUMBER(3),  
 
DATA DATE,  
 
ZIP_CODE NUMBER(9),  
 
CONSTRAINT FK_TRATA_POKEMON FOREIGN KEY (CPF_POKEMON, DESCRITOR) REFERENCES POKEMON (CPF,DESCRITOR),  
 
CONSTRAINT FK_TRATA_ENFERMEIRA FOREIGN KEY (CPF_ENFERMEIRA) REFERENCES ENFERMEIRA (CPF),  
 
CONSTRAINT FK_TRATA_CENTRO FOREIGN KEY (ZIP_CODE) REFERENCES CENTRO_POKEMON (ZIP_CODE),  
 
CONSTRAINT PK_TRATA PRIMARY KEY (CPF_ENFERMEIRA,CPF_POKEMON,DESCRITOR,DATA)  
 
);

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(1, 'Ash Ketchum');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(2, 'Misty Waterflower');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(3, 'Brock Harrison');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(4, 'May Maple');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(5, 'Dawn Berlitz');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(6, 'Iris');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(7, 'Cilan');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(8, 'Serena Yvonne');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(9, 'Clemont');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(10, 'Bonnie');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(105, 'Jessie Team Rocket');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(106, 'James Team Rocket');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(11, 'Nurse Joy');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(12, 'Audrey');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(13, 'Nanami');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(14, 'Eileen');

INSERT INTO PERSONAGEM (CPF, NOME) VALUES   
 
(15, 'Evelyn');

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(1, 999999);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(1, 888888);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(2, 777777);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(3, 666666);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(4, 555555);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(5, 444444);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(6, 333333);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(7, 222222);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(8, 111111);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(9, 121212);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(10, 232323);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(10, 343434);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(10, 454545);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(10, 565656);

INSERT INTO TELEFONE (CPF, NUMERO) VALUES  
 
(10, 676767);

INSERT INTO PROFESSOR (CPF, DIPLOMA) VALUES  
 
(1, 'Teoria dos Pokemons');

INSERT INTO PROFESSOR (CPF, DIPLOMA) VALUES  
 
(2, 'Território');

INSERT INTO PROFESSOR (CPF, DIPLOMA) VALUES  
 
(3, 'Técnicas de Batalha');

INSERT INTO PROFESSOR (CPF, DIPLOMA) VALUES  
 
(4, 'Mitologia');

INSERT INTO PROFESSOR (CPF, DIPLOMA) VALUES  
 
(5, 'Pokemons Lendários');

INSERT INTO TREINADOR (CPF, CPF_PROF, CTP, RESIDENCIA) VALUES  
 
(6, 1, 6, 'Avenida Flores, 333, Lavender');

INSERT INTO TREINADOR (CPF, CPF_PROF, CTP, RESIDENCIA) VALUES  
 
(7, 2, 7, 'Rua da Praia, 444, Pallet');

INSERT INTO TREINADOR (CPF, CPF_PROF, CTP, RESIDENCIA) VALUES  
 
(8, 3, 8, 'Rua das Flores, 555, Pewter');

INSERT INTO TREINADOR (CPF, CPF_PROF, CTP, RESIDENCIA) VALUES  
 
(9, 4, 9, 'Avenida dos Sonhos, 666, Verm');

INSERT INTO TREINADOR (CPF, CPF_PROF, CTP, RESIDENCIA) VALUES  
 
(10, 4, 10, 'Rua do Sol, 777, Fuchsia');

CREATE SEQUENCE contar  
 
START WITH 1  
 
INCREMENT BY 1;

INSERT INTO GINASIO (ID, CIDADE, TIPO, CPF_LIDER) VALUES   
 
(contar.Nextval, 'Cidade de Pallet', 'NORMAL', 8);

INSERT INTO GINASIO (ID, CIDADE, TIPO, CPF_LIDER) VALUES   
 
(contar.Nextval, 'Cidade de Cerulean', 'AGUA', 9);

INSERT INTO GINASIO (ID, CIDADE, TIPO, CPF_LIDER) VALUES   
 
(contar.Nextval, 'Cidade de Vermilion', 'ELETRICO', 6);

INSERT INTO GINASIO (ID, CIDADE, TIPO, CPF_LIDER) VALUES   
 
(contar.Nextval, 'Cidade de Celadon', 'GRAMA', 10);

INSERT INTO GINASIO (ID, CIDADE, TIPO, CPF_LIDER) VALUES   
 
(contar.Nextval, 'Cidade de Fuchsia', 'VENENO', 7);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(6, 7, TO_DATE('08/04/2023', 'DD/MM/YYYY'), 1);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(9, 8, TO_DATE('07/04/2023', 'DD/MM/YYYY'), 2);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(10, 7, TO_DATE('06/04/2023', 'DD/MM/YYYY'), 1);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(10, 8, TO_DATE('05/04/2023', 'DD/MM/YYYY'), 2);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(6, 8, TO_DATE('04/04/2023', 'DD/MM/YYYY'), 1);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(7, 6, TO_DATE('09/04/2023', 'DD/MM/YYYY'), 1);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(7, 6, TO_DATE('10/04/2023', 'DD/MM/YYYY'), 1);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA, ID) VALUES  
 
(6, 10,TO_DATE('11/04/2023', 'DD/MM/YYYY'), 5);

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA) VALUES  
 
(9, 7,TO_DATE('08/04/2023', 'DD/MM/YYYY'));

INSERT INTO BATALHA (DESAFIANTE, DESAFIADO, DATA) VALUES  
 
(9, 10,TO_DATE('1/05/2023', 'DD/MM/YYYY'));

INSERT INTO ENFERMEIRA (CPF, CRM) VALUES   
 
(11, 111 );

INSERT INTO ENFERMEIRA (CPF, CRM) VALUES   
 
(12, 666);

INSERT INTO ENFERMEIRA (CPF, CRM) VALUES   
 
(13, 976);

INSERT INTO ENFERMEIRA (CPF, CRM) VALUES   
 
(14, 12);

INSERT INTO ENFERMEIRA (CPF, CRM) VALUES   
 
(15, 24);

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (1, 'Charizard', 'FOGO');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (2, 'Bulbasaur', 'PLANTA');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (3, 'Squirtle', 'AGUA');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (4, 'Pikachu','ELETRICO');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (5, 'Dragonite', 'DRAGAO');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (6, 'Mewtwo', 'PSIQUICO');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (7, 'Snorlax', 'NORMAL');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (8, 'Gyarados', 'AGUA');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (9, 'Lucario','LUTADOR'); 

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (10, 'Vaporeon', 'AGUA'); 

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (11, 'Blaziken', 'FOGO');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (12, 'Gengar', 'FANTASMA');

INSERT INTO ESPECIE (ID, NOME, TIPO) VALUES (13, 'Tyranitar', 'PEDRA');

INSERT INTO CENTRO_POKEMON (ZIP_CODE) VALUES   
 
(12345);

INSERT INTO CENTRO_POKEMON (ZIP_CODE) VALUES   
 
(23456);

INSERT INTO CENTRO_POKEMON (ZIP_CODE) VALUES   
 
(34567);

INSERT INTO CENTRO_POKEMON (ZIP_CODE) VALUES   
 
(45678);

INSERT INTO CENTRO_POKEMON (ZIP_CODE) VALUES   
 
(56789);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(1, 6, 3, 70, 120, 0.883, 244);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES (2, 6, 13, 130, 100, 1.390, 105);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES (3, 6, 13, 80, 70, 0.860, 301);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(4, 6, 2, 90, 110, 1.222, 50);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(5, 6, 1, 120, 90, 0.570, 163);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(1, 7, 1, 100, 80, 1.132, 153);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(2, 7, 2, 70, 130, 0.840, 279);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(3, 7, 3, 60, 80, 0.422, 153);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(1, 9, 7, 110, 120, 0.460, 154);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(2, 9, 6, 140, 110, 1.159, 138);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(3, 9, 5, 90, 100, 0.746, 318);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(4, 9, 5, 80, 90, 0.732, 77);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(5, 9, 4, 100, 120, 0.619, 117);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(6, 9, 7, 70, 80, 1.436, 83);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(7, 9, 6, 100, 90, 0.878, 215);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(8, 9, 5, 110, 70, 0.434, 144);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(9, 9, 5, 60, 100, 0.698, 311);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(10, 9, 4, 120, 110, 1.388, 121);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(1, 10, 1, 90, 70, 0.846, 228);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(2, 10, 1, 80, 120, 0.452, 144);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(3, 10, 1, 110, 100, 1.043, 62);

INSERT INTO POKEMON (DESCRITOR, CPF, ID, ATK, DEF, HEI, WEI) VALUES	(4, 10, 1, 70, 80, 1.179, 95);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(11, 6, 1, TO_DATE('2023-04-08', 'YYYY-MM-DD'), 12345);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(12, 7, 3, TO_DATE('2023-04-08', 'YYYY-MM-DD'), 23456);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(13, 9, 7, TO_DATE('2023-04-08', 'YYYY-MM-DD'), 34567);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(14, 10, 1, TO_DATE('2023-04-08', 'YYYY-MM-DD'), 45678);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(14, 10, 1, TO_DATE('2023-04-09', 'YYYY-MM-DD'), 45678);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(14, 10, 1, TO_DATE('2023-04-11', 'YYYY-MM-DD'), 34567);

INSERT INTO TRATA (CPF_ENFERMEIRA, CPF_POKEMON, DESCRITOR, DATA, ZIP_CODE) VALUES  
 
(14, 10, 4, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 23456);
