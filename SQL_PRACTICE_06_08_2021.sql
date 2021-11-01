#SQL Practice 29-07-2021
#Week 1 – Day 2

#Our client needs to know:
#1.	A list of our US suppliers, identifying their phone area code.

SELECT SupplierName, Country, SUBSTR(Phone,2,3) AS PhoneAreaCode
FROM suppliers WHERE Country= "USA";
 
#2.	What customer(s) have never placed an order?
SELECT c.CustomerID, c.CustomerName
FROM customers c
LEFT JOIN orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;
						
#3.	In what countries do we have customers?
SELECT DISTINCT Country
FROM customers;

#4.	What are the 5 most sold products?
SELECT p.ProductID, p.ProductName, (Price*Quantity) AS Revenue
FROM products p
JOIN order_details od ON p.ProductID=od.ProductID
ORDER BY Revenue DESC
LIMIT 5;

#5.	What product(s) should our client stop offering?
#According to revenue
SELECT ProductName, OrderDetailID, Quantity, ROUND(Price) AS Price, Quantity*Price AS Revenue
FROM order_details od
JOIN products p
ON od.ProductID = p.ProductID
ORDER BY Revenue ASC
LIMIT 3;

#Products order by quantity (availability in the stock)
SELECT p.ProductName, COUNT(Quantity) AS Quantity 
FROM order_details od
JOIN products p
ON od.ProductID = p.ProductID 
GROUP BY ProductName
ORDER BY Quantity DESC;


#Bonus Questions:
#A) Describe how could you assign a manager to an employee, hence creating a hierarchical organization of records
#in the [Employees] table. (Clue: you're allowed to modify the [Employees] attributes)
#Bonus points: Build the query for the scenario you just described.

#By modifying the table employees where I can add a ManagerID
ALTER TABLE employees
ADD ManagerID VARCHAR(255);

SELECT * FROM lab.employees;

ALTER TABLE employees
DROP COLUMN ManagerID;

#B) Describe a possible valid business scenario where you would have a need to extract information by 
#cross-joining tables in our case study.
#Bonus points: Build the query for the scenario you just described.

#Since the company has not too many employees but a large net of customers and then requires the shippers
#quite frequently, the shippers decided to give a gift to each employee in his or her birthday month, 
#so they are requesting for it as well as their names.
SELECT e.EmployeeID, e.LastName, e.FirstName, e.BirthDate,
sh.ShipperID, sh.ShipperName, EXTRACT(MONTH FROM e.BirthDate) AS "Birthday month"
FROM employees e
CROSS JOIN shippers sh;



