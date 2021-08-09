#1.	Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name".
SELECT FIRST_NAME AS "First Name", LAST_NAME AS "Last Name" 
FROM employees;

#2.	Write a query to get unique department ID from employee table.
SELECT DEPARTMENT_ID
FROM employees;

#3.	Write a query to get all employee details from the employee table order by first name, 
#descending.
SELECT *
FROM employees
ORDER BY FIRST_NAME DESC;

#4.	Write a query to get the names (first_name, last_name), salary, PF of all the employees 
#(PF is calculated as 15% of salary).
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY*0.15 AS PF 
FROM employees;

#5.	Write a query to get the employee ID, names (first_name, last_name), salary in ascending 
#order of salary.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM employees
ORDER BY SALARY ASC;

#6.	Write a query to get the total salaries payable to employees.
SELECT SUM(SALARY) AS "TOTAL SALARIES"
FROM employees;

#7.	Write a query to get the maximum and minimum salary from employees table.
SELECT MAX(SALARY) AS "MAXIMUM SALARY", MIN(SALARY) AS "MINIMUM SALARY"
FROM employees;

#8.	Write a query to get the average salary and number of employees in the employees table.
SELECT AVG(SALARY) AS "AVERAGE SALARY", COUNT(EMPLOYEE_ID) AS "NUMBER OF EMPLOYEES"
FROM employees;

#9.	Write a query to get the number of employees working with the company.
SELECT COUNT(EMPLOYEE_ID) AS "NUMBER OF EMPLOYEES"
FROM employees;

#10.	Write a query to get the number of jobs available in the employees table.
SELECT JOB_ID FROM employees
UNION 
SELECT JOB_ID FROM jobs;

#11.	Write a query get all first name from employees table in upper case.
SELECT UPPER(FIRST_NAME)
FROM employees;

#12.	Write a query to get the first 3 characters of first name from employees table.
SELECT LEFT (FIRST_NAME,3)
FROM employees;

#13.	Write a query to calculate 171*214+625.
SELECT 171*214+625 
Result;

#14.	Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the
# employees from employees table.
SELECT  CONCAT(FIRST_NAME,' ', LAST_NAME) 'Employee Name' 
FROM employees;

#15.	Write a query to get first name from employees table after removing white spaces from both side.
SELECT FIRST_NAME
FROM employees;

SELECT TRIM(FIRST_NAME) AS "First Name" 
FROM employees;

#16.Write a query to get the length of the employee names (first_name, last_name) from employees table.
SELECT FIRST_NAME, LAST_NAME, LENGTH(FIRST_NAME) + LENGTH(LAST_NAME) AS "Length of the employee names"
FROM employees; 

#17.	Write a query to check if the first_name fields of the employees table contains numbers.
SELECT FIRST_NAME 
   FROM employees 
   WHERE  FIRST_NAME REGEXP  "[0-9]"; #REGEXP looks for a number from 0-9 in the table
   
#18.	Write a query to select first 10 records from a table.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME 
    FROM employees  LIMIT 10;
    
#19.	Write a query to get monthly salary (round 2 decimal places) of each and every employee. 
#Note : Assume the salary field provides the 'annual salary' information.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ROUND(SALARY/12,2) AS "MONTHLY SALARY" 
    FROM employees;
    

    