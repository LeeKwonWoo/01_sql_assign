-- 실습1)
CREATE TABLE customer
(  userid     VARCHAR2(4)     
 , name       VARCHAR2(30)    NOT NULL
 , birthyear  NUMBER(4)
 , regdate    DATE            DEFAULT sysdate
 , address    VARCHAR2(30)
-- ,CONSTRAINT 제약조건이름 제약조건타입 (적용대상)
 ,CONSTRAINT pk_customer      PRIMARY KEY (userid)
);

--Table CUSTOMER이(가) 생성되었습니다.

--실습2)

DESC customer;
/*
이름        널?       유형           
--------- -------- ------------ 
USERID    NOT NULL VARCHAR2(4)  
NAME      NOT NULL VARCHAR2(30) 
BIRTHYEAR          NUMBER(4)    
REGDATE            DATE         
ADDRESS            VARCHAR2(30) 
*/

--실습3)
CREATE TABLE NEW_CUST
AS
SELECT m.*
  FROM customer m
;

-- Table NEW_CUST이(가) 생성되었습니다.

--실습4)
DESC new_cust;

/*
이름        널?       유형           
--------- -------- ------------ 
USERID             VARCHAR2(4)  
NAME      NOT NULL VARCHAR2(30) 
BIRTHYEAR          NUMBER(4)    
REGDATE            DATE         
ADDRESS            VARCHAR2(30) 
*/
--실습5)
DROP TABLE saleman;
CREATE TABLE salseman
AS
SELECT e.*
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
-- Table salseman이(가) 생성되었습니다.

--실습6)
DESC salseman;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    

*/

--실습7)
ALTER TABLE customer ADD
( phone VARCHAR(11)
 ,grade VARCHAR(30) CHECK(grade IN('VIP','GOLD','SILVER'))
);

--Table customer이(가) 변경되었습니다.

--실습8)
ALTER TABLE customer DROP COLUMN grade;
--Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE customer ADD
( grade VARCHAR(30) CHECK(grade IN('VIP','GOLD','SILVER'))
);
--Table CUSTOMER이(가) 변경되었습니다.

--실습9)
ALTER TABLE customer MODIFY phone VARCHAR2(4);
--Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE CUSTOMER MODIFY userid VARCHAR2(30);
--Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE salseman MODIFY userid NUMBER(4);
--Table CUSTOMER이(가) 변경되었습니다.
ALTER TABLE salseman MODIFY userid VARCHAR2(30);
--Table CUSTOMER이(가) 변경되었습니다.

-- 추가 과제
-- 실습10)
/* 세 개의 테이블을 생성하는 구문을 작성
   3번 방식으로 작성
   ----------------------------------------
    
    GAME
    GAME_CODE NUMBER(2)     PRIMAMRY KEY -- 게임코드 10
    GAME_NAME VARCHAR2(200) NOT NULL     -- 게임이름
    
    GMEMBER
    ID         VARCHAR2(4)  PRIMAMRY KEY -- 회원의 아이디  M001
    NAME       VARCHAR2(15) NOT NULL     -- 회원의 이름
    
    MEMBER_GAME_HISTORY
    ID         VARCHAR2(4)  FOREEIGN KEY 설정,이름 : FK_ID
                            GMEMEBER 테이블의 ID 컬럼을 참조하도롯 설정
    YEAR       NUMBER(4)    게임을 한 년도
    GAME_CODE  NUMBER(2)    FK 설정 이름 : FK_GAME_CODE
                            GAME테이블의 GAME_CODE 컬럼을 참조하도록 설정
*/

DROP TABLE game;
CREATE TABLE game
( GAME_CODE NUMBER(2)     PRIMARY KEY -- 게임코드 10
 ,GAME_NAME VARCHAR2(200) NOT NULL    -- 게임이름
);

INSERT INTO "SCOTT"."GAME" (GAME_CODE, GAME_NAME) VALUES ('10', 'LEAGUEOFLEGEND');
INSERT INTO "SCOTT"."GAME" (GAME_CODE, GAME_NAME) VALUES ('20', 'BATTLEGROUND');
INSERT INTO "SCOTT"."GAME" (GAME_CODE, GAME_NAME) VALUES ('30', 'CRAZYACADE');
COMMIT;

DROP TABLE gmember;
CREATE TABLE gmember
( ID         VARCHAR2(4)  PRIMARY KEY -- 회원의 아이디  M001
 ,NAME       VARCHAR2(15) NOT NULL    -- 회원의 이름
);

INSERT INTO "SCOTT"."GMEMBER" (ID, NAME) VALUES ('M001', '이권우');
INSERT INTO "SCOTT"."GMEMBER" (ID, NAME) VALUES ('M002', '홍길동');
INSERT INTO "SCOTT"."GMEMBER" (ID, NAME) VALUES ('M003', '김광현');
COMMIT;

CREATE TABLE MEMBER_GAME_HISTORY
( ID         VARCHAR2(4)  
 ,YEAR       NUMBER(4)    
 ,GAME_CODE  NUMBER(2)
 , CONSTRAINT FK_ID        FOREIGN KEY(ID)        REFERENCES GMEMBER(ID)
 , CONSTRAINT FK_GAME_CODE FOREIGN KEY(GAME_CODE) REFERENCES GAME(GAME_CODE)
);

INSERT INTO "SCOTT"."MEMBER_GAME_HISTORY" (ID, YEAR, GAME_CODE) VALUES ('M001', '2015', '30');
INSERT INTO "SCOTT"."MEMBER_GAME_HISTORY" (ID, YEAR, GAME_CODE) VALUES ('M002', '2018', '10');
INSERT INTO "SCOTT"."MEMBER_GAME_HISTORY" (ID, YEAR, GAME_CODE) VALUES ('M003', '2019', '20');

SELECT *
  FROM game g, gmember m, member_game_history h
 WHERE m.id = 'M001' AND h.id = 'M001' AND g.game_code = h.game_code
;

/*
GAME_CODE,  GAME_NAME,   ID,    NAME,   ID_1,   YEAR,   GAME_CODE_1
-------------------------------------------------------------------
30	        CRAZYACADE	M001	이권우	M001	2015	30
*/