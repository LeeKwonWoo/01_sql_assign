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

SELECT INITCAP('LeeKwonWoo') AS MyName
  FROM dual
;

/*
MYNAME
----------
Leekwonwoo
*/

SELECT LOWER('LeeKwonWoo') AS MyName
  FROM dual
;

/*
MYNAME
----------
leekwonwoo
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
;

/*
EMPNO,  ENAME,  NVL(E.COMM,0)
---------------------------
7369	SMITH	0
7499	ALLEN	300
7521	WARD	500
7566	JONES	0
7654	MARTIN	1400
7698	BLAKE	0
7782	CLARK	0
7839	KING	0
7844	TURNER	0
7900	JAMES	0
7902	FORD	0
7934	MILLER	0
9999	J_JAMES	0
8888	J%JAMES	0
*/
-- 실습 14)
SELECT e.empno
     , e.ename
     , e.sal
     , NVL(e.sal+e.comm,e.sal)
  FROM emp e
;

/*
EMPNO,  ENAME,  NVL(E.SAL+E.COMM,E.SAL)
---------------------------------------
7369	SMITH	800
7499	ALLEN	1900
7521	WARD	1750
7566	JONES	2975
7654	MARTIN	2650
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7844	TURNER	1500
7900	JAMES	950
7902	FORD	3000
7934	MILLER	1300
9999	J_JAMES	
8888	J%JAMES	
*/

--(3)단일행 함수- 데이터 타입 변환 as 패턴 6개 조회

-- 실습 15)

SELECT e.empno 사원번호
     , e.ename 이름
     , e.sal   급여
     , to_char(DECODE(e.job, 'CLERK'    ,300
                   , 'SALESMAN'  ,450
                   , 'MANAGER'  ,600
                   , 'ANALYST'  ,800
                   , 'PRESIDENT',1000),'$9999') "자기개발비"
  FROM emp e
;

/*
사원번호, 이름,  급여, 자기개발비
--------------------------------
7369	  SMITH	 800	  $300.00
7499	  ALLEN	 1600	  $450.00
7521	  WARD	 1250	  $450.00
7566	  JONES	 2975	  $600.00
7654	  MARTIN 1250	  $450.00
7698	  BLAKE	 2850	  $600.00
7782	  CLARK	 2450	  $600.00
7839	  KING	 5000	  $1000.00
7844	  TURNER 1500	  $450.00
7900	  JAMES	 950	  $300.00
7902	  FORD	 3000	  $800.00
7934	  MILLER 1300	  $300.00
9999	  J_JAMES		  $300.00
8888	  J%JAMES		  $300.00
*/