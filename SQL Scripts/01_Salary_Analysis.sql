-- Question 1:
-- What is the total salary expense for each department while retaining employee-level details?
select * , sum(sal) over(partition by deptno) as total_department_salary, count(*) over() as total_employees
from emp


-- Question 2:
-- Which departments have the highest total payroll cost?
select sum(sal) , deptno
from emp
group by deptno
order by sum(sal) desc


-- Question 3:
-- How can the average salary for each job role be calculated using a subquery and JOIN?
select emp.* , tab."Average Salary"
from emp
inner join 
(
select job , avg(sal) "Average Salary"
from emp
group by job
) tab
on emp.job = tab.job


-- Question 4:
-- How can the average salary for each job role be calculated using a window function?
select * , avg(sal) over(partition by job) "Average Salary"
from emp




-- Question 5:
-- What is the salary of the next employee in the salary ranking?

SELECT *,
       LEAD(SAL,1,0) OVER(ORDER BY SAL) AS Next_Higher_Salary
FROM emp;




-- Question 6:
-- What are the highest and lowest salaries within each job role?

SELECT EMPNO,
       JOB,
       SAL,
       FIRST_VALUE(SAL) OVER(PARTITION BY JOB ORDER BY SAL DESC) AS Highest_In_Team,
       FIRST_VALUE(SAL) OVER(PARTITION BY JOB ORDER BY SAL) AS Lowest_In_Team
FROM emp
ORDER BY JOB, SAL;
