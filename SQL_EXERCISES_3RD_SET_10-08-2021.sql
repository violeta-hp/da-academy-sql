SET sql_mode = 'ONLY_FULL_GROUP_BY';

#1.Write a query to list the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JOB_ID)
FROM labhr.employees;  

#2.	Write a query to get the total salaries payable to employees.
SELECT SUM(SALARY) 
FROM labhr.employees;

#3.	Write a query to get the minimum salary from employees table.
SELECT MIN(SALARY) 
FROM labhr.employees;

#4. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(SALARY)
FROM labhr.employees
WHERE JOB_ID='IT_PROG';

#5.	Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(SALARY) AS "AVERAGE SALARY", COUNT(*) 
FROM labhr.employees
WHERE DEPARTMENT_ID=90;

#6.	Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(SALARY) AS "HIGHEST SALARY", MIN(SALARY) AS "LOWEST SALARY", SUM(SALARY) AS "SUM", AVG(SALARY) AS "AVERAGE SALARY"
FROM labhr.employees;

#7.	Write a query to get the number of employees with the same job.
SELECT JOB_ID, COUNT(*) AS "NUMBER OF EMPLOYEES"
FROM labhr.employees 
GROUP BY JOB_ID;

#8. Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(SALARY)-MIN(SALARY) AS "DIFFERENCE BETWEEN SALARIES"
FROM labhr.employees;

#9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT MANAGER_ID,MIN(SALARY)
FROM labhr.employees
GROUP BY MANAGER_ID
ORDER BY MIN(SALARY) DESC;


#10. Write a query to get the department ID and the total salary payable in each department.
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM labhr.employees
GROUP BY DEPARTMENT_ID;

#11. Write a query to get the average salary for each job ID excluding programmer.
SELECT JOB_ID, AVG(SALARY) 
FROM labhr.employees
WHERE JOB_ID <> 'IT_PROG' #<> not equal to 
GROUP BY JOB_ID;

#12.Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for 
#department ID 90 only.

SELECT JOB_ID, SUM(SALARY) AS "TOTAL SALARY", MAX(SALARY) AS "MAXIMUM SALARY",
MIN(SALARY) AS "MINIMUM SALARY", AVG(SALARY) AS "AVERAGE SALARY"
FROM labhr.employees
WHERE DEPARTMENT_ID= 90
GROUP BY JOB_ID;

#13.	Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than
# or equal to $4000.
SELECT JOB_ID, MAX(SALARY) AS "MAXIMUM SALARY"
FROM labhr.employees
WHERE SALARY >= 4000 
GROUP BY JOB_ID
ORDER BY SALARY ASC;

SELECT e.JOB_ID, MAX(e.SALARY) AS MAX_SALARY
FROM employees e
GROUP BY e.JOB_ID
HAVING MAX_SALARY >= 4000; 

#14.	Write a query to get the average salary for all departments employing more than 10 employees.
SELECT DEPARTMENT_ID, AVG(SALARY) AS "AVERAGE SALARY", COUNT(*) AS "Numer of employees"
FROM labhr.employees
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) > 10;

SELECT d.DEPARTMENT_NAME, AVG(SALARY) AS "AVERAGE SALARY", COUNT(*) AS "Number of employees"
FROM labhr.employees e
JOIN labhr.departments d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME 
HAVING COUNT(*) > 10;