
-- Question 1:
-- What is the time gap between consecutive employee hiring dates?
select * ,
                   lag(hiredate) over(order by hiredate asc) Prev_Hire_Date,
		   hiredate - lag(hiredate) over(order by hiredate asc) "Hiring Gap"
from emp



-- Question 2:
-- How can the hiring interval between consecutive employees be calculated using a subquery and window functions?
select * , hiredate - Prev_Hire_Date as "Hiring Gap"
from
(
select * , lag(hiredate) over(order by hiredate asc) Prev_Hire_Date
from emp
) tab




