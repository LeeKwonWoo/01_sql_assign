-- 실습 18)

SELECT COUNT(*)
  FROM emp e
;
/*
COUNT(*)
--------
      15
*/

-- 실습 19)
SELECT COUNT(DISTINCT e.job)
  FROM emp e
;
/*
COUNT(DISTINCTE.JOB)
--------------------
                   5
*/

-- 실습 20)
SELECT COUNT(e.comm)
  FROM emp e
 WHERE e.comm > 0
;
/*
COUNT(E.COMM)
-------------
            3
*/

-- 실습 21)
SELECT TO_CHAR(SUM(e.sal),'$99,999')   "전 직원 급여 총합"
  FROM emp e
;
/*
전 직원 급여 총합
----------
$24,925
*/

-- 실습 22)
SELECT TO_CHAR(AVG(e.sal),'$9,999') "전 직원의 급여 평균"
  FROM emp e
;
/*
전 직원의 급여 평균
------------------
$2,077
*/

-- 실습 23)
SELECT TO_CHAR(SUM(e.sal),'$9,999')"급여 총합"
     , TO_CHAR(AVG(e.sal),'$9,999')"급여 평균"
     , TO_CHAR(MAX(e.sal),'$9,999')"최대 급여"
     , TO_CHAR(MIN(e.sal),'$9,999')"최소 급여"
  FROM emp e
 WHERE e.deptno = 20
;
/*
급여 총합, 급여 평균, 최대 급여, 최소 급여
------------------------------------------
 $6,775	    $2,258	    $3,000	   $800
*/
-- 실습 24)
SELECT TO_CHAR(STDDEV(e.sal),'$9,999')  "급여 표준편차"
     , TO_CHAR(VARIANCE(e.sal),'$9,999,999')"급여 분산"
  FROM emp e
;
/*
급여 표준편차, 급여 분산
--------------------------
 $1,220	       $1,488,348
*/
-- 실습 25)
SELECT TO_CHAR(STDDEV(e.sal),'$9,999')  "급여 표준편차"
     , TO_CHAR(VARIANCE(e.sal),'$9,999,999')"급여 분산"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
급여 표준편차, 급여 분산
------------------------
   $178	        $31,667
*/

-- 실습 26)
SELECT e.deptno 부서번호
     , e.job    직무
     , to_char(DECODE(e.job, 'CLERK'    ,300
                           , 'SALESMAN' ,450
                           , 'MANAGER'  ,600
                           , 'ANALYST'  ,800
                           , 'PRESIDENT',1000),'$9999') "자기개발비"
  FROM emp e
 GROUP BY e.deptno, e.job
 ORDER BY e.deptno ASC, e.job DESC
;

/*
부서번호, 직무, 자기개발비
--------------------------
10	      PRESIDENT	 $1000
10	      MANAGER	 $600
10	      CLERK	     $300
20	      MANAGER	 $600
20	      CLERK	     $300
20	      ANALYST	 $800
30	      SALESMAN	 $450
30	      MANAGER	 $600
30	      CLERK	     $300
null      null       null		
null      CLERK	     $300
*/