-- �ǽ� 18)

SELECT COUNT(*)
  FROM emp e
;
/*
COUNT(*)
--------
      15
*/

-- �ǽ� 19)
SELECT COUNT(DISTINCT e.job)
  FROM emp e
;
/*
COUNT(DISTINCTE.JOB)
--------------------
                   5
*/

-- �ǽ� 20)
SELECT COUNT(e.comm)
  FROM emp e
 WHERE e.comm > 0
;
/*
COUNT(E.COMM)
-------------
            3
*/

-- �ǽ� 21)
SELECT TO_CHAR(SUM(e.sal),'$99,999')   "�� ���� �޿� ����"
  FROM emp e
;
/*
�� ���� �޿� ����
----------
$24,925
*/

-- �ǽ� 22)
SELECT TO_CHAR(AVG(e.sal),'$9,999') "�� ������ �޿� ���"
  FROM emp e
;
/*
�� ������ �޿� ���
------------------
$2,077
*/

-- �ǽ� 23)
SELECT TO_CHAR(SUM(e.sal),'$9,999')"�޿� ����"
     , TO_CHAR(AVG(e.sal),'$9,999')"�޿� ���"
     , TO_CHAR(MAX(e.sal),'$9,999')"�ִ� �޿�"
     , TO_CHAR(MIN(e.sal),'$9,999')"�ּ� �޿�"
  FROM emp e
 WHERE e.deptno = 20
;
/*
�޿� ����, �޿� ���, �ִ� �޿�, �ּ� �޿�
------------------------------------------
 $6,775	    $2,258	    $3,000	   $800
*/
-- �ǽ� 24)
SELECT TO_CHAR(STDDEV(e.sal),'$9,999')  "�޿� ǥ������"
     , TO_CHAR(VARIANCE(e.sal),'$9,999,999')"�޿� �л�"
  FROM emp e
;
/*
�޿� ǥ������, �޿� �л�
--------------------------
 $1,220	       $1,488,348
*/
-- �ǽ� 25)
SELECT TO_CHAR(STDDEV(e.sal),'$9,999')  "�޿� ǥ������"
     , TO_CHAR(VARIANCE(e.sal),'$9,999,999')"�޿� �л�"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
�޿� ǥ������, �޿� �л�
------------------------
   $178	        $31,667
*/

-- �ǽ� 26)
SELECT e.deptno �μ���ȣ
     , e.job    ����
     , to_char(DECODE(e.job, 'CLERK'    ,300
                           , 'SALESMAN' ,450
                           , 'MANAGER'  ,600
                           , 'ANALYST'  ,800
                           , 'PRESIDENT',1000),'$9999') "�ڱⰳ�ߺ�"
  FROM emp e
 GROUP BY e.deptno, e.job
 ORDER BY e.deptno ASC, e.job DESC
;

/*
�μ���ȣ, ����, �ڱⰳ�ߺ�
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