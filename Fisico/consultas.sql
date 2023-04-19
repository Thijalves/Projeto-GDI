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

