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

