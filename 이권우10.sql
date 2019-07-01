-- �ǽ�1)
CREATE TABLE customer
(  userid     VARCHAR2(4)     
 , name       VARCHAR2(30)    NOT NULL
 , birthyear  NUMBER(4)
 , regdate    DATE            DEFAULT sysdate
 , address    VARCHAR2(30)
-- ,CONSTRAINT ���������̸� ��������Ÿ�� (������)
 ,CONSTRAINT pk_customer      PRIMARY KEY (userid)
);

--Table CUSTOMER��(��) �����Ǿ����ϴ�.

--�ǽ�2)

DESC customer;
/*
�̸�        ��?       ����           
--------- -------- ------------ 
USERID    NOT NULL VARCHAR2(4)  
NAME      NOT NULL VARCHAR2(30) 
BIRTHYEAR          NUMBER(4)    
REGDATE            DATE         
ADDRESS            VARCHAR2(30) 
*/

--�ǽ�3)
CREATE TABLE NEW_CUST
AS
SELECT m.*
  FROM customer m
;

-- Table NEW_CUST��(��) �����Ǿ����ϴ�.

--�ǽ�4)
DESC new_cust;

/*
�̸�        ��?       ����           
--------- -------- ------------ 
USERID             VARCHAR2(4)  
NAME      NOT NULL VARCHAR2(30) 
BIRTHYEAR          NUMBER(4)    
REGDATE            DATE         
ADDRESS            VARCHAR2(30) 
*/
--�ǽ�5)
DROP TABLE saleman;
CREATE TABLE salseman
AS
SELECT e.*
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
-- Table salseman��(��) �����Ǿ����ϴ�.

--�ǽ�6)
DESC salseman;
/*
�̸�       ��? ����           
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

--�ǽ�7)
ALTER TABLE customer ADD
( phone VARCHAR(11)
 ,grade VARCHAR(30) CHECK(grade IN('VIP','GOLD','SILVER'))
);

--Table customer��(��) ����Ǿ����ϴ�.

--�ǽ�8)
ALTER TABLE customer DROP COLUMN grade;
--Table CUSTOMER��(��) ����Ǿ����ϴ�.
ALTER TABLE customer ADD
( grade VARCHAR(30) CHECK(grade IN('VIP','GOLD','SILVER'))
);
--Table CUSTOMER��(��) ����Ǿ����ϴ�.

--�ǽ�9)
ALTER TABLE customer MODIFY phone VARCHAR2(4);
--Table CUSTOMER��(��) ����Ǿ����ϴ�.
ALTER TABLE CUSTOMER MODIFY userid VARCHAR2(30);
--Table CUSTOMER��(��) ����Ǿ����ϴ�.
ALTER TABLE salseman MODIFY userid NUMBER(4);
--Table CUSTOMER��(��) ����Ǿ����ϴ�.
ALTER TABLE salseman MODIFY userid VARCHAR2(30);
--Table CUSTOMER��(��) ����Ǿ����ϴ�.

-- �߰� ����
-- �ǽ�10)
/* �� ���� ���̺��� �����ϴ� ������ �ۼ�
   3�� ������� �ۼ�
   ----------------------------------------
    
    GAME
    GAME_CODE NUMBER(2)     PRIMAMRY KEY -- �����ڵ� 10
    GAME_NAME VARCHAR2(200) NOT NULL     -- �����̸�
    
    GMEMBER
    ID         VARCHAR2(4)  PRIMAMRY KEY -- ȸ���� ���̵�  M001
    NAME       VARCHAR2(15) NOT NULL     -- ȸ���� �̸�
    
    MEMBER_GAME_HISTORY
    ID         VARCHAR2(4)  FOREEIGN KEY ����,�̸� : FK_ID
                            GMEMEBER ���̺��� ID �÷��� �����ϵ��� ����
    YEAR       NUMBER(4)    ������ �� �⵵
    GAME_CODE  NUMBER(2)    FK ���� �̸� : FK_GAME_CODE
                            GAME���̺��� GAME_CODE �÷��� �����ϵ��� ����
*/

DROP TABLE game;
CREATE TABLE game
( GAME_CODE NUMBER(2)     PRIMARY KEY -- �����ڵ� 10
 ,GAME_NAME VARCHAR2(200) NOT NULL    -- �����̸�
);

INSERT INTO "SCOTT"."GAME" (GAME_CODE, GAME_NAME) VALUES ('10', 'LEAGUEOFLEGEND');
INSERT INTO "SCOTT"."GAME" (GAME_CODE, GAME_NAME) VALUES ('20', 'BATTLEGROUND');
INSERT INTO "SCOTT"."GAME" (GAME_CODE, GAME_NAME) VALUES ('30', 'CRAZYACADE');
COMMIT;

DROP TABLE gmember;
CREATE TABLE gmember
( ID         VARCHAR2(4)  PRIMARY KEY -- ȸ���� ���̵�  M001
 ,NAME       VARCHAR2(15) NOT NULL    -- ȸ���� �̸�
);

INSERT INTO "SCOTT"."GMEMBER" (ID, NAME) VALUES ('M001', '�̱ǿ�');
INSERT INTO "SCOTT"."GMEMBER" (ID, NAME) VALUES ('M002', 'ȫ�浿');
INSERT INTO "SCOTT"."GMEMBER" (ID, NAME) VALUES ('M003', '�豤��');
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
30	        CRAZYACADE	M001	�̱ǿ�	M001	2015	30
*/