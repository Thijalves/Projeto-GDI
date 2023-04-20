-------------------Procedure media dos ataques-----------------
CREATE OR REPLACE PROCEDURE mediaAtk (CPF_P NUMBER)
IS avgAtaque NUMBER; 
BEGIN 
	SELECT AVG(ATK) INTO avgAtaque
	FROM POKEMON
	where CPF = CPF_P;
	DBMS_OUTPUT.PUT_LINE('Média do ataque: '||avgAtaque);
END;

EXEC mediaAtk(6);

---------------Procedure CPF do professor de um treinador----------------
CREATE OR REPLACE PROCEDURE PROFESSOR_DO_TREINADOR (CPF_P NUMBER)
IS CPF_PROFESSOR NUMBER; 
BEGIN 
	SELECT CPF_PROF INTO CPF_PROFESSOR
	FROM TREINADOR
	where CPF = CPF_P;
	DBMS_OUTPUT.PUT_LINE('O Professor de '|| CPF_P || ' é: ' || CPF_PROFESSOR);
END;

BEGIN
	PROFESSOR_DO_TREINADOR(10);
END;

---------------Procedure tipo de um ginasio--------------
CREATE OR REPLACE PROCEDURE tipoGinasio(ID1 NUMBER)
IS RESP VARCHAR(30); 
BEGIN 
	SELECT TIPO INTO RESP
	FROM GINASIO
	where ID = ID1;
	DBMS_OUTPUT.PUT_LINE('Tipo do ginasio: '||RESP);
END;

exec tipoGinasio(2);

---------------Function selecionar diploma de um professor----------------
CREATE OR REPLACE PROCEDURE display_professor_diploma(cpf_param NUMBER)
IS
  diploma_var VARCHAR2(20);
BEGIN
  diploma_var := get_professor_diploma(cpf_param);
  
  IF diploma_var IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Professor diploma is ' || diploma_var);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No diploma found for the given CPF');
  END IF;
END;

SELECT get_professor_diploma(123) FROM DUAL;

---------------Function quantidade de pokemons de um treinador--------------
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

SELECT NUMERO_DE_POKEMONS('Iris') FROM DUAL;
