#SQL Practice 28-07-2021
#Week 1 – Day 1

#What does SQL stand for? Structured Query Language 

#Our client needs to know:
#1.	An alphabetical list of customers located in Mexico
SELECT CustomerName, Country
FROM customers
WHERE Country="Mexico";

#To count the number of customers and check whether or not it coincides with the result from the query above
SELECT Country, COUNT(*)
FROM customers
GROUP BY Country;

#2.	A list of employees from youngest to oldest
SELECT * 
FROM employees 
ORDER BY BirthDate DESC;

#3.	A list of orders that included “Dairy Products” and “Grains/Cereals”
SELECT od.OrderID, od.OrderDetailID, c.CategoryName
FROM order_details od
JOIN products p ON od.ProductID= p.ProductID
JOIN categories c ON p.CategoryID= c.CategoryID 
WHERE CategoryName= 'Dairy Products' OR CategoryName= 'Grains/Cereals';

#4.	What products are supplied by “G'day, Mate” ?
SELECT p.ProductID, p.ProductName, s.SupplierName
FROM suppliers s
JOIN products p ON s.SupplierID= p.SupplierID
WHERE s.SupplierName= "G'day, Mate";

#5.	What shippers have delivered our orders per country?
SELECT c.Country, ShipperName 
FROM customers c
JOIN
     (SELECT ShipperName 
      FROM shippers) AS TS
ON 1=1
GROUP BY c.Country, ShipperName;

#6.	The list of orders managed by Nancy Davolio during 1997students
SELECT o.orderID, o.OrderDate, e.FirstName, e.LastName
FROM orders o
JOIN employees e ON e.EmployeeID= o.EmployeeID
WHERE  e.FirstName= 'Nancy' AND e.LastName= 'Davolio' AND EXTRACT(YEAR FROM o.OrderDate)='1997';

