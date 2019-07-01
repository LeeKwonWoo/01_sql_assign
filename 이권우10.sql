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
    GAME_CODE NUMBER(2)     PRIMAMRY KEY - �����ڵ� 10
    GAME_NAME VARCHAR2(200) NOT NULL     - �����̸�
    
    GMEMBER
    ID         VARCHAR2(4)  PRIMAMRY KEY - ȸ���� ���̵�  M001
    NAME       VARCHAR2(15) NOT NULL     - ȸ���� �̸�
    
    MEMBER_GAME_HISTORY
    ID         VARCHAR2(4)  FOREEIGN KEY ����,�̸� : FK_ID
                            GMEMEBER ���̺��� ID �÷��� �����ϵ��� ����
    YEAR       NUMBER(4)    ������ �� �⵵
    GAME_CODE  NUMBER(2)    FK ���� �̸� : FK_GAME_CODE
                            GAME���̺��� GAME_CODE �÷��� �����ϵ��� ����
*/