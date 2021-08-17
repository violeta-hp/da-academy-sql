#1.	Write a query to find the name (first_name, last_name) and the salary of the employees who have a 
#higher salary than the employee whose last_name='Bull'.
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME="Bull");

#2.	Write a query to find the name (first_name, last_name) of all employees who works in the IT 
#department.
SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM employees
WHERE JOB_ID= "IT_PROG";

#3.	Write a query to find the name (first_name, last_name) of the employees who are managers.
SELECT FIRST_NAME, LAST_NAME, JOB_TITLE 
FROM employees e
JOIN jobs j ON e.JOB_ID= j.JOB_ID 
WHERE j.JOB_TITLE LIKE '%MANAGER%';

#4.	Write a query to find the name (first_name, last_name), and salary of the employees whose salary is
#greater than the average salary.
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

#5.	Write a query to find the name (first_name, last_name), and salary of the employees who earn more 
#than the average salary and work in any of the IT departments.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM employees 
WHERE SALARY > (SELECT AVG(SALARY) FROM employees) 
AND DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID FROM departments WHERE JOB_ID="IT_PROG")

#6.	Write a query to find the name (first_name, last_name), and salary of the employees who earns more
#than the earning of Mr. Bell.
SELECT FIRST_NAME, LAST_NAME 
FROM employees 
WHERE SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME="Bell");

#7.	Write a query to find the name (first_name, last_name), and salary of the employees who earn the 
#same salary as the minimum salary for all departments.
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY=(SELECT MIN(SALARY) FROM employees);

#8.	Write a query to find the name (first_name, last_name), and salary of the employees whose salary
#is greater than the average salary of all departments.
SELECT FIRST_NAME,LAST_NAME
FROM labhr.employees 
WHERE SALARY > ALL (SELECT AVG(SALARY) FROM labhr.employees GROUP BY DEPARTMENT_ID);

#9.	Write a query to find the name (first_name, last_name) and salary of the employees who earn a
# salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the 
#results of the salary of the lowest to highest.
SELECT FIRST_NAME,LAST_NAME, SALARY
FROM employees 
WHERE SALARY > ALL (SELECT SALARY FROM employees WHERE JOB_ID= 'SH_CLERK')
ORDER BY SALARY ASC;

#10.	Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
SELECT FIRST_NAME,LAST_NAME
FROM employees 
WHERE SALARY > ALL (SELECT SALARY FROM employees WHERE JOB_ID= 'SH_CLERK')
ORDER BY SALARY ASC;

#11.	Write a query to select last 10 records from employee table based on the employee id order.
SELECT * 
FROM labhr.employees 
ORDER BY EMPLOYEE_ID DESC LIMIT 10;

#12.	Write a query to list the department ID and name of all the departments where no employee is 
#working.
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments 
WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM employees);
 