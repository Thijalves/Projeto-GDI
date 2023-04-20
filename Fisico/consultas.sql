-- Group by/Having

-- -Semi junção
-- -Subconsulta do tipo linha

-- Operação de conjunto
-- Seleciona treinador que tem pokemon do tipo fogo, mas não batalhou no ginasio de grama

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

-- Subconsulta do tipo tabela
-- Informações de todas as vezes que um pokemon foi tratado, quando ele foi tratado e em que centro ele foi tratado. 
 
-- select t.data, t.zip_code 
-- from centro_pokemon cp inner join trata t on cp.zip_code = t.zip_code 
-- where (7, 3) in (select t2.cpf_pokemon, t2.descritor 
--                 from trata t2);

-- Subconsulta do tipo escalar
-- informa a quantidade máxima de pokemons capturados por um único treinador

SELECT MAX(QTD)
FROM (
    SELECT COUNT(*) AS QTD
    FROM POKEMON P
    GROUP BY P.CPF);

-- Junção interna
-- Mostra o nome e cpf das enfermeiras que atenderam pokemons a partir do dia 09/apr/23

SELECT DISTINCT P.CPF, P.NOME
FROM TRATA T INNER JOIN PERSONAGEM P ON (T.CPF_ENFERMEIRA = P.CPF)
WHERE T.DATA >= '09-APR-2023';

-- Junção externa
-- coloque o CPF e o  NOME dos personagens que não possuem telefone

select P.CPF, P.NOME
from PERSONAGEM P left join telefone T on P.CPF = T.CPF
where NUMERO is null

-- Anti-junção
-- Para cada Espécie de Pokemon Pok1, selecione o ID_Esp1 e do ID_Esp2, sendo ATK_Esp1 > ATK_Esp2

-- select Esp1.id as ID_Esp1, Esp2.id as id_Esp2
-- from especie Esp1 inner join pokemon Esp2 on Esp1.atk > Esp2.atk

