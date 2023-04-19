--######################consultas#########################################

--#treinador que tem pokemon do tipo fogo, mas não desafio o ginasio de grama

select t.cpf, p.nome 
from treinador t inner join personagem p on t.cpf = p.cpf 
where exists (select p.cpf 
    from pokemon p 
    where p.id in (select e.id 
			from especie e 
where e.tipo ='FOGO') and t.cpf = p.cpf)
 
minus 
 
select t.cpf, p.nome 
from treinador t inner join personagem p on t.cpf = p.cpf 
where exists (select b.desafiante  
    	from batalha b 
    	where t.cpf = b.desafiante and b.id =(select g.id 
    											from ginasio g  
    											where g.tipo = 'GRAMA')) 
 
--#informações de todas as vezes que um pokemon foi tratado, quando ele foi tratado e em que centro ele foi tratado. 
 
select t.data, t.zip_code 
from centro_pokemon cp inner join trata t on cp.zip_code = t.zip_code 
where (7, 3) in (select t2.cpf_pokemon, t2.descritor 
from trata t2);


-- informa a quantidade máxima de pokemons capturados por um único treinador

SELECT MAX(QTD)
FROM (
    SELECT COUNT(P.ID) AS QTD
    FROM POKEMON P
    WHERE P.CPF IS NOT NULL
    GROUP BY P.CPF
)

-- enfermeiras que atenderam pokemons no dia 09/apr/23

SELECT DISTINCT P.NOME
    FROM TRATA T
	INNER JOIN PERSONAGEM P ON T.CPF_ENFERMEIRA = P.CPF
WHERE
    T.DATA >= '09-APR-2023';

-- CONSULTA: QUANTIDADE DE POKEMONS QUE CADA TREINADOR TEM EM ORDEM DECRESCENTE
SELECT A.CPF,A.NOME, COUNT(PO.DESCRITOR) AS QTD_DE_POKEMONS
FROM (
    SELECT *
	FROM PERSONAGEM P	
	WHERE P.CPF = ANY(
    	SELECT T.CPF
    	FROM TREINADOR T
	)
) A LEFT JOIN POKEMON PO
ON PO.CPF = A.CPF
GROUP BY (A.CPF,A.NOME)
ORDER BY QTD_DE_POKEMONS DESC;

--FUNÇÃO: RECEBE O NOME DE UM PERSONAGEM E RETORNA A QUANTIDADE DE POKEMONS QUE O PERSONAGEM TEM
CREATE OR REPLACE FUNCTION NUMERO_DE_POKEMONS (NOME_PERSONAGEM VARCHAR )
RETURN NUMBER IS
	QUANTIDADE NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO QUANTIDADE
    FROM POKEMON PO
    WHERE PO.CPF = (
    	SELECT PE.CPF
    	FROM PERSONAGEM PE
    	WHERE PE.NOME = NOME_PERSONAGEM
    );
	RETURN QUANTIDADE;
END NUMERO_DE_POKEMONS;

--PROCEDIMENTO: RECEBE O NOME DE UM PERSONAGEM E IMPIME UMA MENSAGEM COM A QUANTIDADE DE POKEMONS QUE O PERSONAGEM TEM
CREATE OR REPLACE PROCEDURE NUMERO_DE_POKEMONS (NOME_PERSONAGEM IN VARCHAR )
IS
	QUANTIDADE NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO QUANTIDADE
    FROM POKEMON PO
    WHERE PO.CPF = (
    	SELECT PE.CPF
    	FROM PERSONAGEM PE
    	WHERE PE.NOME = NOME_PERSONAGEM
    );
	DBMS_OUTPUT.PUT_LINE('O PERSONAGEM ' || NOME_PERSONAGEM || ' POSSUI ' || QUANTIDADE || ' POKEMONS');
END;

