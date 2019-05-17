-- sql 과제 : 본인이름 한글로 작성
-- sql 과제 파일 명 : 본인이름01.sql
-- 제출 제목 : 청해진대학 본인 이름 SQL 01 과제
-- 강사 이메일 : hannacne@naver.com



-- 실습 6)
SELECT *
  FROM emp
;
/*
EMPNO,  ENAME,  JOB,        MGR,    HIREDATE,   SAL,        COMM,   DEPTNO
---------------------------------------------------------------------------
7369	SMITH	CLERK	    7902	80/12/17	800		    20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	    300	    30
7521	WARD	SALESMAN	7698	81/02/22	1250	    500	    30
7566	JONES	MANAGER	    7839	81/04/02	2975		20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	    1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850		30
7782	CLARK	MANAGER	    7839	81/06/09	2450		10
7839	KING	PRESIDENT		    81/11/17	5000		10
7844	TURNER	SALESMAN	7698	81/09/08	1500	    0	    30
7900	JAMES	CLERK	    7698	81/12/03	950		    30
7902	FORD	ANALYST	    7566	81/12/03	3000		20
7934	MILLER	CLERK	    7782	82/01/23	1300		10
*/

-- 실습 7)
SELECT *
  FROM emp e, dept d
 WHERE e.ename = 'ALLEN'
;
/*
EMPNO,  ENAME,  JOB,        MGR,    HIREDATE,   SAL,    COMM,   DEPTNO, DEPTNO_1, DNAME,        LOC
--------------------------------------------------------------------------------------------------------
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30	    10	      ACCOUNTING	NEW YORK
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30	    20  	  RESEARCH	    DALLAS
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30	    30	      SALES	        CHICAGO
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30	    40	      OPERATIONS	BOSTON
*/

-- 실습 8)
SELECT e.empno
     , e.ename
     , e.deptno
  FROM emp e
 WHERE e.deptno = 20
;

/*
EMPNO,  ENAME, DEPTNO
--------------------
7369	SMITH	20
7566	JONES	20
7902	FORD	20
*/

-- 실습 9)
SELECT e.empno
     , e.ename
     , e.sal
     , e.deptno
  FROM emp e
 WHERE e.deptno = 20
   AND e.sal < 3000
;

/*
EMPNO,  ENAME,  SAL,  DEPTNO
----------------------------
7369	SMITH	800	    20
7566	JONES	2975	20
*/

-- 실습 10)
SELECT e.empno
     , e.ename
     , e.sal + NVL(e.comm,0)
  FROM emp e
;

/*
EMPNO,  ENAME,  E.SAL+NVL(E.COMM,0)
-----------------------------------
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
*/

--실습 11)
SELECT e.empno
     , e.ename
     , e.sal + e.sal + NVL(e.comm,0) 년급여
  FROM emp e
;

/*
EMPNO,  ENAME, 년급여
--------------------
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
*/

--실습 12)
SELECT e.empno
     , e.ename
     , e.job
     , e.comm
  FROM emp e
 WHERE e.ename = 'MARTIN'
    OR e.ename = 'BLAKE'
;

/*
EMPNO,  ENAME,  JOB,        COMM
--------------------------------
7654	MARTIN	SALESMAN    1400
7698	BLAKE	MANAGER	
*/

--실습 13)
SELECT e.empno
     , e.ename
     , e.job
     , e.sal + NVL(e.comm,0)
  FROM emp e
 WHERE e.ename = 'MARTIN'
    OR e.ename = 'BLAKE'
;

/*
EMPNO,  ENAME,  JOB,        E.SAL+NVL(E.COMM,0)
------------------------------------
7654	MARTIN	SALESMAN    2650
7698	BLAKE	MANAGER	    2850
*/