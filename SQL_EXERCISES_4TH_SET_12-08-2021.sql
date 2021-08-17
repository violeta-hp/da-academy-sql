SET sql_mode = 'ONLY_FULL_GROUP_BY';

#1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
#of all the departments.
SELECT LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, C.COUNTRY_NAME
FROM locations L
JOIN countries C ON L.COUNTRY_ID= C.COUNTRY_ID;

#2.Write a query to get the total salaries payable to employees.
SELECT SUM(SALARY)
FROM employees;

#3. Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM employees E
JOIN departments D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID;

#3.Write a query to find the name (first_name, last_name), job, department ID and name of the
#employees who works in London.
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_ID, D.DEPARTMENT_NAME, L.CITY
FROM employees E
JOIN departments D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID
JOIN jobs J ON E.JOB_ID=J.JOB_ID 
JOIN locations L ON L.LOCATION_ID = D.LOCATION_ID
WHERE CITY="LONDON";

#4.Write a query to find the employee id, name (last_name) along with their manager_id and NAME 
#(last_name).
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.MANAGER_ID, D.DEPARTMENT_NAME
FROM employees E
JOIN departments D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID;

#5.Write a query to find the name (first_name, last_name) and hire date of the employees who was 
#hired after 'Jones'.
SELECT LAST_NAME, LAST_NAME, HIRE_DATE
FROM employees 
WHERE HIRE_DATE> (SELECT HIRE_DATE FROM employees WHERE LAST_NAME='Jones')
ORDER BY HIRE_DATE

#6.Write a query to get the department name and number of employees in the department.
SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS "NUMBER OF EMPLOYEES"
FROM employees E
JOIN departments D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;


#7.Write a query to find the employee ID, job title, number of days between ending date and starting 
#date for all jobs in department 90.

SELECT E.EMPLOYEE_ID, J.JOB_TITLE, END_DATE - START_DATE AS DAYS, E.DEPARTMENT_ID 
FROM employees E
JOIN jobs J ON E.JOB_ID= J.JOB_ID
JOIN job_history JH ON E.EMPLOYEE_ID= JH.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID=90;

SELECT EMPLOYEE_ID, JOB_TITLE, END_DATE - START_DATE AS DAYS
FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;

SELECT EMPLOYEE_ID, JOB_TITLE, END_DATE - START_DATE AS DAYS
FROM job_history 
JOIN jobs 
WHERE department_id=90;

#8.Write a query to display the department ID and name and first name of manager.
SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.FIRST_NAME, J.JOB_TITLE 
FROM departments D
JOIN employees E ON E.MANAGER_ID=E.MANAGER_ID
JOIN jobs J ON E.JOB_ID= J.JOB_ID
WHERE J.JOB_TITLE LIKE '%MANAGER%';

#9.Write a query to display the department name, manager name, and city.
SELECT D.DEPARTMENT_NAME, CONCAT(E.FIRST_NAME," ",E.LAST_NAME) AS 'NAME', J.JOB_TITLE, L.CITY 
FROM departments D
JOIN employees E ON E.MANAGER_ID=E.MANAGER_ID
JOIN jobs J ON E.JOB_ID= J.JOB_ID
JOIN locations L ON D.LOCATION_ID= L.LOCATION_ID
WHERE J.JOB_TITLE LIKE '%MANAGER%';

#10.Write a query to display the job title and average salary of employees.
SELECT J.JOB_TITLE, AVG(SALARY) AS SALARY
FROM employees E
JOIN jobs J ON E.JOB_ID= J.JOB_ID
GROUP BY J.JOB_TITLE;


#11.Write a query to display job title, employee name, and the difference between salary of the 
#employee and minimum salary for the job.
SELECT J.JOB_TITLE, CONCAT(E.FIRST_NAME," ",E.LAST_NAME) AS 'NAME', SALARY, MIN(SALARY) AS MIN_SALARY,
(SALARY-MIN(SALARY)) AS SALARY_DIFF
FROM employees E
JOIN jobs J ON E.JOB_ID= J.JOB_ID
GROUP BY J.JOB_ID;

#12.Write a query to display the job history that were done by any employee who is currently drawing 
#more than 10000 of salary.
SELECT JH.JOB_ID, JH.START_DATE, JH.END_DATE, JH.DEPARTMENT_ID, 
CONCAT(E.FIRST_NAME," ",E.LAST_NAME) AS 'NAME', SALARY
FROM employees E
JOIN job_history JH ON E.EMPLOYEE_ID= JH.EMPLOYEE_ID
WHERE SALARY>10000;

SELECT JH.* 
FROM job_history JH
JOIN employees E
ON (JH.EMPLOYEE_ID = E.EMPLOYEE_ID) 
WHERE SALARY > 10000;

#13.Write a query to display department name, name (first_name, last_name), hire date, salary of 
#the manager for all managers whose experience is more than 15 years.
SELECT D.DEPARTMENT_NAME, CONCAT(E.FIRST_NAME," ",E.LAST_NAME) AS 'NAME', E.HIRE_DATE, J.JOB_TITLE,
SALARY, (DATEDIFF(NOW(),HIRE_DATE))/365>15 AS 'Exp of more than 15 y/o'
FROM departments D
JOIN employees E ON E.MANAGER_ID=E.MANAGER_ID
JOIN jobs J ON E.JOB_ID= J.JOB_ID #to see the manager title
WHERE J.JOB_TITLE LIKE '%MANAGER%' 

SELECT DEPARTMENT_NAME, FIRST_NAME, SALARY  
FROM departments D 
JOIN employees E ON D.MANAGER_ID=E.MANAGER_ID
WHERE (SYSDATE()-HIRE_DATE) / 365 > 15;

