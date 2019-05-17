-- 실습 01)
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

-- 실습 2)
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


-- 실습 3)
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


--실습 4)
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

--실습 5)
SELECT 'LeeKwonWoo' AS MyName
  FROM dual
;
/*
MYNAME
----------
LeeKwonWoo
*/

-- 실습 6)
SELECT concat('SQL','배우기')
  FROM dual
;
/*
CONCAT('SQL','배우기')
----------------------
SQL배우기
*/

-- 실습 7)
SELECT substr('SQL 배우기',5,2)
  FROM dual
;

/*
SUBSTR('SQL배우기',5,2)
-----------------------
배우
*/

-- 실습 8)
SELECT lpad('SQL',7,'$')
  FROM dual
;

/*
LPAD('SQL',7,'$')
-----------------
$$$$SQL
*/

-- 실습 9)
SELECT rpad('SQL',7,'$')
  FROM dual
;

/*
LPAD('SQL',7,'$')
-----------------
SQL$$$$
*/

-- 실습10)
SELECT ltrim('     sql 배우기 ')
  FROM dual
;

/*
LTRIM('SQL배우기')
------------------
sql 배우기
*/

-- 실습11)
SELECT rtrim('      sql 배우기 ')
  FROM dual
;

/*
RTRIM('SQL배우기')
------------------
      sql 배우기
*/

-- 실습 12)
SELECT trim('       sql 배우기 ')
  FROM dual
;
/*
TRIM('SQL배우기')
-----------------
sql 배우기
*/


-- 실습 13)
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
-- 실습 14)
SELECT e.empno
     , e.ename
     , NVL(e.comm,e.sal+e.comm)
  FROM emp e
 WHERE e.comm IS NULL
;