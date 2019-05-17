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