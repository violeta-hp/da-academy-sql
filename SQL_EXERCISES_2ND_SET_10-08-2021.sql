#1.Write a query to display the name (first_name, last_name) and salary for all employees whose salary is
# not in the range $10,000 through $15,000.
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees
WHERE SALARY BETWEEN 10000 AND 15000;

#2.Write a query to display the name (first_name, last_name) and department ID of all employees in 
#departments 30 or 100 in ascending order.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM employees 
WHERE DEPARTMENT_ID IN (30, 100)
ORDER BY DEPARTMENT_ID ASC;

#3.Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
#not in the range $10,000 through $15,000 and are in department 30 or 100.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM labhr.employees
WHERE SALARY NOT BETWEEN 10000 AND 15000 
AND DEPARTMENT_ID IN (30, 100);

#4.Write a query to display the name (first_name, last_name) and hire date for all employees who were
# hired in 1987.
#Hint: Google the usage of the SQL function YEAR().
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM labhr.employees
WHERE YEAR(HIRE_DATE)=1987;

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM labhr.employees
WHERE HIRE_DATE LIKE '%1987%'; #Have 1987 in any position 
#LIKE seeks for a specified pattern in a column.


#5.Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
SELECT FIRST_NAME
FROM labhr.employees
WHERE FIRST_NAME LIKE '%b%' 
AND FIRST_NAME LIKE '%c%';

#6.Write a query to display the last name, job, and salary for all employees whose job is that of a
# Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.
SELECT E.LAST_NAME,J.JOB_TITLE, E.SALARY
FROM labhr.employees E 
INNER JOIN labhr.jobs J ON E.JOB_ID= J.JOB_ID
WHERE (JOB_TITLE='Programmer' OR JOB_TITLE='Shipping Clerk') 
AND SALARY NOT IN (4500, 10000, 5000);

DESCRIBE labhr.employees;

#7.	Write a query to display the last name of employees whose names have exactly 6 characters.
#Hint: Google the usage of the SQL function CHARACTER_LENGTH().
SELECT LAST_NAME
FROM labhr.employees
WHERE CHARACTER_LENGTH(LAST_NAME)=6;

#8.	Write a query to display the last name of employees having 'e' as the third CHARACTER.
SELECT LAST_NAME
FROM labhr.employees
WHERE LAST_NAME LIKE '__e%';

#9.	Write a query to display the jobs/designations available in the employees TABLE.
SELECT DISTINCT E.JOB_ID, J.JOB_TITLE
FROM labhr.employees E 
JOIN labhr.jobs J ON E.JOB_ID= J.JOB_ID;

SELECT E.JOB_ID, J.JOB_TITLE
FROM labhr.employees E 
JOIN labhr.jobs J ON E.JOB_ID= J.JOB_ID
GROUP BY JOB_TITLE;

#10.	Write a query to display the name (first_name, last_name), salary and PF (calculate as 15% of 
#salary) of all employees.
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY*0.15 AS PF 
FROM labhr.employees;

SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS "Name", SALARY, SALARY*0.15 AS PF 
FROM labhr.employees;

#11.	Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and
# 'FORD'.
SELECT * 
FROM labhr.employees
WHERE LAST_NAME IN ('BLAKE', 'SCOTT', 'KING', 'FORD');

SELECT * 
FROM labhr.employees
WHERE LAST_NAME ='BLAKE' 
OR LAST_NAME ='SCOTT'
OR LAST_NAME ='KING' 
OR LAST_NAME ='FORD';