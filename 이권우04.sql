-- �ǽ� 01)
SELECT INITCAP(e.ename)
  FROM emp e
;

/*
INITCAP(E.ENAME)
----------------
Smith
Allen
Ward
Jones
Martin
Blake
Clark
King
Turner
James
Ford
Miller
J_James
J%James
*/

-- �ǽ� 2)
SELECT LOWER(e.ename)
  FROM emp e
;

/*
LOWER(E.ENAME)
--------------
smith
allen
ward
jones
martin
blake
clark
king
turner
james
ford
miller
j_james
j%james
*/


-- �ǽ� 3)
SELECT INITCAP(e.ename)
  FROM emp e
;

/*
INITCAP(E.ENAME)
----------------
Smith
Allen
Ward
Jones
Martin
Blake
Clark
King
Turner
James
Ford
Miller
J_James
J%James
*/


--�ǽ� 4)
SELECT LENGTH('korea')
  FROM dual
;

SELECT LENGTHB('korea')
  FROM dual
;

/*
LENGTH('KOREA')
---------------
5
*/

--�ǽ� 5)
SELECT 'LeeKwonWoo' AS MyName
  FROM dual
;
/*
MYNAME
----------
LeeKwonWoo
*/

-- �ǽ� 6)
SELECT concat('SQL','����')
  FROM dual
;
/*
CONCAT('SQL','����')
----------------------
SQL����
*/

-- �ǽ� 7)
SELECT substr('SQL ����',5,2)
  FROM dual
;

/*
SUBSTR('SQL����',5,2)
-----------------------
���
*/

-- �ǽ� 8)
SELECT lpad('SQL',7,'$')
  FROM dual
;

/*
LPAD('SQL',7,'$')
-----------------
$$$$SQL
*/

-- �ǽ� 9)
SELECT rpad('SQL',7,'$')
  FROM dual
;

/*
LPAD('SQL',7,'$')
-----------------
SQL$$$$
*/

-- �ǽ�10)
SELECT ltrim('     sql ���� ')
  FROM dual
;

/*
LTRIM('SQL����')
------------------
sql ����
*/

-- �ǽ�11)
SELECT rtrim('      sql ���� ')
  FROM dual
;

/*
RTRIM('SQL����')
------------------
      sql ����
*/

-- �ǽ� 12)
SELECT trim('       sql ���� ')
  FROM dual
;
/*
TRIM('SQL����')
-----------------
sql ����
*/


-- �ǽ� 13)
SELECT e.empno
     , e.ename
     , NVL(e.comm,0)
  FROM emp e
 WHERE e.comm IS NULL
;

/*
EMPNO,  ENAME,  NVL(E.COMM,0)
---------------------------
7369	SMITH	0
7566	JONES	0
7698	BLAKE	0
7782	CLARK	0
7839	KING	0
7900	JAMES	0
7902	FORD	0
7934	MILLER	0
9999	J_JAMES	0
8888	J%JAMES	0
*/
-- �ǽ� 14)
SELECT e.empno
     , e.ename
     , NVL(e.comm,e.sal+e.comm)
  FROM emp e
 WHERE e.comm IS NULL
;