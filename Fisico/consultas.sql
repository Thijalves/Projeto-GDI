-- Operação de conjunto ------------------------------------------------------------------
-- Seleciona treinador que tem pokemon do tipo fogo, mas não batalhou no ginasio de grama

SELECT T.CPF, P.NOME 
FROM TREINADOR T INNER JOIN PERSONAGEM P ON T.CPF = P.CPF 
WHERE EXISTS (SELECT P.CPF 
                FROM POKEMON P 
                WHERE P.ID IN (SELECT E.ID 
                                FROM ESPECIE E 
                                WHERE E.TIPO ='FOGO') AND T.CPF = P.CPF);
 
MINUS 
 
SELECT T.CPF, P.NOME 
FROM TREINADOR T INNER JOIN PERSONAGEM P ON T.CPF = P.CPF 
WHERE EXISTS (SELECT B.DESAFIANTE  
            FROM BATALHA B 
            WHERE T.CPF = B.DESAFIANTE AND B.ID =(SELECT G.ID 
                                                    FROM GINASIO G  
                                                    WHERE G.TIPO = 'GRAMA'));

-- Subconsulta do tipo tabela ------------------------------------------------------------------------------------
-- RETORNE OS DE POKEMONS QUE POSSUEM ATAQUE IGUAL A MÉDIA DOS POKEMONS DE CADA TREINADOR
SELECT A.CPF, A.ID, A.DESCRITOR
FROM POKEMON A
WHERE (CPF, ATK) IN (
    SELECT CPF, AVG(ATK)
    FROM POKEMON
    GROUP BY CPF
);

-- Subconsulta do tipo escalar ----------------------------------------------------------------------------------
-- informa a quantidade máxima de pokemons capturados por um único treinador

SELECT P.DESCRITOR, P.CPF
FROM POKEMON P
WHERE P.ATK > (
    SELECT AVG(A.ATK)
    FROM POKEMON A
)
-- Junção interna --------------------------------------------------------------------------------------------
-- Mostra o nome e cpf das enfermeiras que atenderam pokemons a partir do dia 09/apr/23

SELECT DISTINCT P.CPF, P.NOME
FROM TRATA T INNER JOIN PERSONAGEM P ON (T.CPF_ENFERMEIRA = P.CPF)
WHERE T.DATA >= '09-APR-2023';

-- Junção externa -------------------------------------------------------------------------------------------
-- coloque o CPF e o  NOME dos personagens que não possuem telefone

SELECT P.CPF, P.NOME
FROM PERSONAGEM P LEFT JOIN telefone T ON P.CPF = T.CPF
WHERE NUMERO IS NULL;

-- Anti-junção ---------------------------------------------------------------------------------------------
-- Seleciona o cpf dos professores sem alunos
SELECT P.CPF
FROM PROFESSOR P
WHERE CPF NOT IN (
    SELECT T.CPF_PROF
    FROM TREINADOR T
);

-- Group by/Having ----------------------------------------------------------------------------------------
-- QUANTIDADE DE POKEMONS QUE CADA TREINADOR TEM EM ORDEM DECRESCENTE
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
HAVING COUNT(PO.DESCRITOR) > 2
ORDER BY QTD_DE_POKEMONS DESC
;

-- Semi junção -----------------------------------------------------------------------------
-- O cpf das enfermeiras que trataram mais de três vezes pokémons de um treinador de ginásio

select distinct tr.cpf_enfermeira
from trata tr
where exists (
	select *
	from treinador t
	where t.cpf = tr.cpf_pokemon and exists (
			select *
			from ginasio g
			where t.cpf = g.cpf_lider)
);

-- Subconsulta do tipo linha ----------------------------------------------------------------
-- Selecionando o pokemon com maior defesa e ataque

SELECT P.ID
FROM POKEMON P
WHERE (P.ATK, P.DEF) = (SELECT MAX(P2.ATK), MAX(P2.DEF)
                        FROM POKEMON P2);