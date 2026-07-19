
-- Question 1:
-- How many employees are assigned to each job role while preserving employee-level information?
select deptno , ename , sal , job 
, count(*) over(partition by job ) as jobcount
from emp



-- Question 2:
-- For each employee, who are the immediate predecessor and successor in the salary ranking?
select * , lead(ename , 2 , 'No Next' ) over(order by sal desc)
		 , Lag( ename , 1 ) over(order by sal desc)
from emp





-- Question 3:
-- What is each employee's hiring sequence based on the hire date?

SELECT EMPNO,
       ENAME,
       JOB,
       HIREDATE,
       SAL,
       RANK() OVER(ORDER BY HIREDATE) AS Hire_Sequence
FROM emp
ORDER BY SAL;





