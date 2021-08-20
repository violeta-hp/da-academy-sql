#1.Write a query to get the details of the employees where the length of the first name greater than or 
#equal to 8.
SELECT *, CHARACTER_LENGTH(FIRST_NAME) >= 8 AS 'Character length'
FROM employees

SELECT *
FROM employees
WHERE CHARACTER_LENGTH(FIRST_NAME) >= 8; 

#2.	Write a query to append '@example.com' to email field.
#a.	Sample Output :
  #SKING@example.com
  #NKOCHHAR@example.com
  #LDEHAAN@example.com
UPDATE employees SET EMAIL = CONCAT(EMAIL, '@example.com');

SELECT *
FROM employees; 
  
#3.	Write a query to get the employee id, first name and hire month.
#Read about the SQL function EXTRACT() https://www.w3schools.com/mysql/func_mysql_extract.asp
SELECT EMPLOYEE_ID, FIRST_NAME, EXTRACT(MONTH FROM "HIRE_DATE")
FROM employees;

#MID(string, start, length)
SELECT EMPLOYEE_ID, FIRST_NAME, MID(HIRE_DATE, 6, 2) as HIRE_MONTH
FROM employees;


#4.	Write a query to extract the last 4 character of phone numbers. 
# (only use the SQL functions CHARACTER_LENGTH() in combination with SUBSTRING(), google about the usage of the 
# 2 functions)
SELECT CHARACTER_LENGTH(PHONE_NUMBER,4)
FROM employees; 

SELECT FIRST_NAME,LAST_NAME,PHONE_NUMBER,CHARACTER_LENGTH(PHONE_NUMBER) AS 'CHAR LEN',
SUBSTRING(PHONE_NUMBER, -4) AS 'LAST 4 CHARACTERS'
FROM employees; 

#5.	Write a query to get the locations that have minimum street length.
SELECT *
FROM locations
WHERE LENGTH(STREET_ADDRESS) <= (SELECT  MIN(LENGTH(STREET_ADDRESS)) 
											FROM locations);

#6.	Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 
#(only use the SQL functions SUBSTRING() in combination with the LIKE operator)
#Read about the SUBSTRING() function:
#https://www.sqlshack.com/es/resumen-de-la-funcion-de-subcadena/
#Read about the LIKE operator:
#SQL LIKE Operator (w3schools.com)
SELECT first_name, last_name 
FROM employees 
WHERE INSTR(last_name,'C') > 2;

SELECT first_name, last_name 
FROM employees 
WHERE SUBSTR(last_name LIKE '%C%') > 2;

SELECT FIRST_NAME,LAST_NAME,PHONE_NUMBER,CHARACTER_LENGTH(PHONE_NUMBER) AS 'CHAR LEN',
SUBSTRING(PHONE_NUMBER, -4) AS 'LAST 4 CHARACTERS'
FROM employees; 

#7.Write a query to display the first day of the month (in datetime format) three months before the current month.
SELECT DATE(((PERIOD_ADD(EXTRACT(YEAR_MONTH FROM CURDATE()),-3)*100)+1)) AS 'First day of the month';

#8.Write a query that displays the first name and the length of the first name for all employees whose name 
#starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
#employees' first names.

SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS 'LENGTH'
FROM employees
WHERE FIRST_NAME LIKE 'A%' 
OR FIRST_NAME LIKE 'J%'
OR FIRST_NAME LIKE 'M%'
ORDER BY FIRST_NAME;

#9.	Write a query to extract the year from the current date.
#Remember EXTRACT()? Google the SQL function CURRENT_DATE()
SELECT EXTRACT(YEAR FROM CURRENT_DATE());


#10.	Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30’.
SELECT FIRST_NAME, HIRE_DATE 
FROM employees 
WHERE HIRE_DATE BETWEEN '1987-06-01' AND '1987-07-30';

#11. Write a query to get the firstname, lastname who joined in the month of June. (only use the SQL functions
# EXTRACT()).
SELECT FIRST_NAME, LAST_NAME, hire_date
FROM employees 
WHERE MONTH(HIRE_DATE) =  6;

#SELECT EXTRACT(MONTH = 06 FROM HIRE_DATE);

#12.	Write a query to get the years in which more than 10 employees joined.
SELECT DATE_FORMAT(HIRE_DATE,'%Y') AS "Date"
FROM employees  
GROUP BY DATE_FORMAT(HIRE_DATE,'%Y') 
HAVING COUNT(EMPLOYEE_ID) > 10;

#13.	Write a query to get first name of employees who joined in 1987.
SELECT FIRST_NAME, HIRE_DATE 
FROM employees 
WHERE HIRE_DATE LIKE '%1987%';

#14.	Write a query to get department name, manager name, and salary of the manager for all managers whose 
#experience is more than 5 years. Remember CURRENT_DATE() function.
SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_TITLE, HIRE_DATE
FROM employees e
JOIN jobs j ON e.JOB_ID= j.JOB_ID 
WHERE j.JOB_TITLE LIKE '%MANAGER%' 
AND (YEAR(CURRENT_DATE())-YEAR(HIRE_DATE)) >5 ;

#15.	Write a query to get first name, hire date and experience of the employees.
SELECT FIRST_NAME, HIRE_DATE, (YEAR(CURRENT_DATE())-YEAR(HIRE_DATE)) AS EXPERIENCE
FROM employees;

#16.	Write a query to get the department ID, year, and number of employees joined in that year.
SELECT DEPARTMENT_ID, DATE_FORMAT(HIRE_DATE,'%Y') AS "Date", COUNT(EMPLOYEE_ID)
FROM employees E
GROUP BY DEPARTMENT_ID, DATE_FORMAT(HIRE_DATE, '%Y');
 
