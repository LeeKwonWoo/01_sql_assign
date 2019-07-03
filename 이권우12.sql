-- �ǽ�1)

CREATE SEQUENCE seq_cust_userid
START WITH 1
INCREMENT BY 1
MAXVALUE 99
NOCYCLE
;

-- �ǽ�2)

SELECT i.*
  FROM user_sequences i
;
/*
SEQUENCE_NAME,  MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG, ORDER_FLAG, CACHE_SIZE, LAST_NUMBER, SCALE_FLAG, EXTEND_FLAG, SESSION_FLAG
-----------------------------------------------------------------------------------------------------------------------------------------
SEQ_CUST_USERID	1	       99	      1	            N	        N	        20	        1	               N	    N	        N
*/

-- �ǽ�3)



CREATE TABLE new_customer
AS
SELECT a.*
  FROM customer a
 WHERE 1 = 1
;

CREATE INDEX idx_cust_userid
ON new_customer (userid)
;

-- �ǽ�4)
SELECT i.index_name
     , i.index_type
     , i.table_name
     , i.include_column
  FROM user_indexes i
;

/*
INDEX_NAME,                        INDEX_TYPE, TABLE_NAME, INCLUDE_COLUMN
------------------------------------------------------------
PK_CUSTOMER	                       NORMAL	    CUSTOMER	
PK_DEPT	                           NORMAL	    DEPT	
PK_EMP	                           NORMAL	    EMP	
SYS_C007505	                       NORMAL	    GAME	
SYS_C007507	                       NORMAL	    GMEMBER	
PK_MAIN3	                       NORMAL	    MAIN_TABLE3	
PK_NICNAME3	                       NORMAL	    MAIN_TABLE3	
PK_MAIN4	                       NORMAL	    MAIN_TABLE4	
PK_NICNAME4	                       NORMAL	    MAIN_TABLE4	
PK_MEMBER	                       NORMAL	    MEMBER	
IDX_CUST_USERID	                   NORMAL	    NEW_CUSTOMER	
IDX_NEW_MEMBER_ID	FUNCTION-BASED NORMAL	    NEW_MEMBER	
PK_SUB4	                           NORMAL	    SUB_TABLE4	
*/

SELECT i.index_name
     , i.table_name
  FROM user_ind_columns i
;

/*
INDEX_NAME,                     TABLE_NAME
--------------------------------------------------------------
BIN$6QgPVQTMTMmNO6VVssJmfw==$0	BIN$Mn9ngaHIQLCPuMbT0Gc09Q==$0
BIN$7dO1htkiQSyQMcNErIToiQ==$0	BIN$Mn9ngaHIQLCPuMbT0Gc09Q==$0
BIN$E5UROtlmS/axUbDQ2uFqMw==$0	BIN$T1M9kncETm26XrSL9Q6grA==$0
BIN$L1gC0pKMRwW1twmUEsJcsQ==$0	BIN$rfTM6cC3THe/xXS+l4h/cg==$0
BIN$ZJJAx7pURampGW4Hol8IIA==$0	BIN$ikW4xZOIRvuLrCELor/aEQ==$0
BIN$aVJY1r6iRsaLYpBzYdhtnw==$0	BIN$hXGPukDTTA+tHCzyLEVAsw==$0
BIN$maPlBjYQR3SUmcpccGoScw==$0	BIN$s8ekskChQ4mlFjQf5/Ag5g==$0
BIN$nw6HSwAbTv2H7rt2Z9djbg==$0	BIN$l6N2Od8GTw2K7fn9Ldn3aQ==$0
BIN$oKnCEssgTUC9XO1V1C/eGg==$0	BIN$MvyhubljRwmomiqNVx0BGg==$0
BIN$q8VbV1bCQCyf8tw/Qn2TAA==$0	BIN$VafJ3wASRCqwLrsOQr2dhA==$0
BIN$q8VbV1bCQCyf8tw/Qn2TAA==$0	BIN$VafJ3wASRCqwLrsOQr2dhA==$0
BIN$qlt1C1HyTwenFCS/DNhjHQ==$0	BIN$ikW4xZOIRvuLrCELor/aEQ==$0
IDX_CUST_USERID	                NEW_CUSTOMER
IDX_NEW_MEMBER_ID	            NEW_MEMBER
PK_CUSTOMER	                    CUSTOMER
PK_DEPT                     	DEPT
PK_EMP	                        EMP
PK_MAIN3	                    MAIN_TABLE3
PK_MAIN4	                    MAIN_TABLE4
PK_MEMBER	                    MEMBER
PK_NICNAME3                 	MAIN_TABLE3
PK_NICNAME4	                    MAIN_TABLE4
PK_SUB4	                        SUB_TABLE4
PK_SUB4	                        SUB_TABLE4
SYS_C007505	                    GAME
SYS_C007507	                    GMEMBER
*/

-- �ǽ�5)
SELECT i.index_name
     , i.index_type
     , i.table_name
     , i.include_column
  FROM user_indexes i
 WHERE i.index_name = 'IDX_CUST_USERID'
;

/*
INDEX_NAME,     INDEX_TYPE, TABLE_NAME, INCLUDE_COLUMN
--------------------------------------------------
IDX_CUST_USERID	NORMAL	    NEW_CUSTOMER	
*/

-- �ǽ�6)
SELECT i.index_name
     , i.table_name
  FROM user_ind_columns i
 WHERE i.index_name = 'IDX_CUST_USERID'
;
/*
INDEX_NAME,     TABLE_NAME
----------------------------
IDX_CUST_USERID	NEW_CUSTOMER
*/

-- �ǽ� 7)
DROP INDEX idx_cust_userid;
--Index IDX_CUST_USERID��(��) �����Ǿ����ϴ�.

-- �ǽ�8)
SELECT i.index_name
     , i.table_name
  FROM user_ind_columns i
 WHERE i.index_name = 'IDX_CUST_USERID'
;

/*
INDEX_NAME,     TABLE_NAME
----------------------------
*/

-- �ǽ�9 silver_regdt �ǽ�10 silver_regdt 
-- customer ���̺� silver 2��(������, ��ȿ��)
-- gold 1��(����)
-- VIP 1��(����) 4���� �����͸� INSERT���� 

-- �ǽ�9)
CREATE OR REPLACE VIEW v_silver_regdt
AS
SELECT c.userid as ���̵�
     , c.name
     , c.birthyear
     , c.regdate as �����
     , c.address
  FROM customer c
 WHERE c.userid = 'C001'
   OR c.userid = 'C002'
WITH READ ONLY
;
CREATE OR REPLACE VIEW v_gold_regdt
AS
SELECT c.userid as ���̵�
     , c.name
     , c.birthyear
     , c.regdate as �����
     , c.address
  FROM customer c
 WHERE c.userid = 'C003'
WITH READ ONLY
;
CREATE OR REPLACE VIEW v_vip_regdt
AS
SELECT c.userid as ���̵�
     , c.name
     , c.birthyear
     , c.regdate as �����
     , c.address
  FROM customer c
 WHERE c.userid = 'C004'
WITH READ ONLY
;

-- �ǽ�11)
SELECT s.���̵�
     , s.name
     , s.birthyear
     , s.�����
     , s.address
  FROM v_silver_regdt s
;

/*
���̵�, NAME, BIRTHYEAR, �����, ADDRESS
----------------------------------------
C001	������	1976	19/07/03	����
C002	��ȿ��	1979	19/07/03	����
*/

SELECT g.���̵�
     , g.name
     , g.birthyear
     , g.�����
     , g.address
  FROM v_gold_regdt g
;

/*
���̵�, NAME, BIRTHYEAR, �����, ADDRESS
----------------------------------------
C003	����	1977	19/07/03	����
*/
SELECT v.���̵�
     , v.name
     , v.birthyear
     , v.�����
     , v.address
  FROM v_vip_regdt v
;
/*
���̵�, NAME, BIRTHYEAR, �����, ADDRESS
----------------------------------------
C004	�̱ǿ�	1996	19/07/03	õ��
*/

-- �ǽ�11)
SELECT v.view_name
     , v.view_type
     , v.view_type_owner
  FROM user_views v
;
/*
VIEW_NAME,      VIEW_TYPE, VIEW_TYPE_OWNER
------------------------------------------
V_EMP_DEPT		
V_GOLD_REGDT		
V_SILVER_REGDT		
V_VIP_REGDT		
*/

-- �ǽ�12)
SELECT v.view_name
     , v.text
  FROM user_views v
;
/*
VIEW_NAME,          TEXT
--------------------------------------------------
    V_EMP_DEPT     "SELECT e.empno
                         , e.ename
                         , e1.ename as mgr_name
                         , e.deptno
                         , d.dname
                         , d.loc
                      FROM new_emp e
                         , new_dept d
                         , new_emp e1
                     WHERE e.deptno = d.deptno(+)
                       AND e.mgr = e1.empno(+)
                     WITH READ ONLY"
                    
    V_GOLD_REGDT	"SELECT c.userid as ���̵�
                          , c.name
                          , c.birthyear
                          , c.regdate as �����
                          , c.address
                       FROM customer c
                      WHERE c.userid = 'C003'
                      WITH READ ONLY"

   V_SILVER_REGDT	"SELECT c.userid as ���̵�
                          , c.name
                          , c.birthyear
                          , c.regdate as �����
                          , c.address
                       FROM customer c
                      WHERE c.userid = 'C001'
                         OR c.userid = 'C002'
                      WITH READ ONLY"

   V_VIP_REGDT	    "SELECT c.userid as ���̵�
                          , c.name
                          , c.birthyear
                          , c.regdate as �����
                          , c.address
                       FROM customer c
                      WHERE c.userid = 'C004'
                      WITH READ ONLY"
*/

-- �ǽ�13)
DROP VIEW v_silver_regdt;
DROP VIEW v_gold_regdt;
DROP VIEW v_vip_regdt;

/*
View V_SILVER_REGDT��(��) �����Ǿ����ϴ�.


View V_GOLD_REGDT��(��) �����Ǿ����ϴ�.


View V_VIP_REGDT��(��) �����Ǿ����ϴ�.
*/

-- �ǽ�14)
SELECT v.view_name
     , v.view_type
     , v.view_type_owner
  FROM user_views v
;

/*
VIEW_NAME, VIEW_TYPE, VIEW_TYPE_OWNER
-------------------------------------
V_EMP_DEPT		
*/