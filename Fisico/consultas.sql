-- Operação de conjunto ------------------------------------------------------------------
-- Seleciona treinador que tem pokemon do tipo fogo, mas não batalhou no ginasio de grama

select t.cpf, p.nome 
from treinador t inner join personagem p on t.cpf = p.cpf 
where exists (select p.cpf 
                from pokemon p 
                where p.id in (select e.id 
                                from especie e 
                                where e.tipo ='FOGO') and t.cpf = p.cpf);
 
minus 
 
select t.cpf, p.nome 
from treinador t inner join personagem p on t.cpf = p.cpf 
where exists (select b.desafiante  
            from batalha b 
            where t.cpf = b.desafiante and b.id =(select g.id 
                                                    from ginasio g  
                                                    where g.tipo = 'GRAMA'));

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

SELECT MAX(QTD)
FROM (
    SELECT COUNT(*) AS QTD
    FROM POKEMON P
    GROUP BY P.CPF);

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
ORDER BY QTD_DE_POKEMONS DESC;

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

