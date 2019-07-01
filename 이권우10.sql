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

