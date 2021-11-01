#SQL Practice 30-07-2021
#Week 1 – Day 3

#1.	What products do we sell the most of and how much do we charge for them?
#Assuming those with lowest quantity are the ones with more sales
SELECT ProductName, Quantity, ROUND(Quantity*Price, 2) AS Revenue
FROM order_details OD
JOIN products P ON OD.ProductID = P.ProductID
GROUP BY ProductName, Quantity, Revenue
ORDER BY Quantity ASC LIMIT 10;

#2.	Which products brings us the most revenue? (Excluding “Alice Mutton” because they are going out of business.)
SELECT ProductName, ROUND(Quantity*Price, 2) AS Revenue
FROM order_details od 
JOIN products p ON od.ProductID = p.ProductID 
WHERE ProductName NOT IN ('Alice Mutton')
GROUP BY ProductName, Revenue;

SELECT ProductName, Quantity, ROUND(Quantity*Price,2) AS Revenue
FROM order_details OD 
JOIN products P ON OD.ProductID= P.ProductID
WHERE ProductName<>'Alice Mutton' #<> mean not in 
ORDER BY ProductName ASC;

SELECT * 
FROM products 
WHERE ProductID<>17; #Alice Muton has the Product ID 17

#3.	What is our Annual Total Revenue?
SELECT YEAR(O.OrderDate) AS Año, SUM(OD.Quantity * P.Price) AS Total_Revenue
FROM orders O
JOIN order_details OD ON OD.OrderID = O.OrderID
JOIN products P ON P.ProductID = OD.ProductID
GROUP BY YEAR(O.OrderDate);

#4.	Who is the shipper that delivers most of our customers' orders?
SELECT s.ShipperName, Tab1.*
FROM shippers s
JOIN
(
SELECT ShipperID, COUNT(*) AS Delivers
FROM orders
GROUP BY ShipperID
ORDER BY COUNT(*) DESC) AS Tab1
ON s.ShipperID= Tab1.ShipperID
ORDER BY Delivers DESC
LIMIT 1;

#5.	Do we have customers that only request orders for one category of products?
SELECT cat.CategoryID, TAB1.CustomerName #cat.CategoryID
FROM 
categories cat
JOIN
(
SELECT C.CustomerID, C.CustomerName, P.ProductName 
FROM orders O 
JOIN order_details OD ON O.OrderID = OD.OrderID
JOIN products P ON OD.ProductID = P.ProductID
JOIN customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CustomerName, P.ProductName) AS TAB1 
ON 1=1
WHERE (SELECT 
WHERE CustomerID IN (cat.CategoryID= 8 OR 3)
GROUP BY cat.CategoryID,TAB1.CustomerName * #C.CustomerID

SELECT cat.CategoryID, cat.CategoryName
CASE
    WHEN CategoryID IN (1,2,3,4,5,6,7,8) THEN 'The user buys products from all categories'
    WHEN CategoryID IN (1,2,3,4,5,6,7) THEN 'The user buys products from all categories'
    ELSE 'The quantity is under 30'
END AS Cats
FROM categories cat;




SELECT c.CustomerID, c.CustomerName
FROM customers c
JOIN  orders od ON c.CustomerID= od.CustomerID 
JOIN products p 
WHERE ProductID (SELECT p.ProductID FROM products JOIN p ON p.ProductID) As TAB



#SQL Practice 30-07-2021
#Week 1 – Day 3

#1.	What products do we sell the most of and how much do we charge for them?
#Assuming those with lowest quantity are the ones with more sales
SELECT ProductName, Quantity, ROUND(Quantity*Price, 2) AS Revenue
FROM order_details OD
JOIN products P ON OD.ProductID = P.ProductID
GROUP BY ProductName, Quantity, Revenue
ORDER BY Quantity ASC LIMIT 10;

#2.	Which products brings us the most revenue? (Excluding “Alice Mutton” because they are going out of business.)
SELECT ProductName, ROUND(Quantity*Price, 2) AS Revenue
FROM order_details od 
JOIN products p ON od.ProductID = p.ProductID 
WHERE ProductName NOT IN ('Alice Mutton')
GROUP BY ProductName, Revenue;

SELECT ProductName, Quantity, ROUND(Quantity*Price,2) AS Revenue
FROM order_details OD 
JOIN products P ON OD.ProductID= P.ProductID
WHERE ProductName<>'Alice Mutton' #<> mean not in 
ORDER BY ProductName ASC;

SELECT * 
FROM products 
WHERE ProductID<>17; #Alice Muton has the Product ID 17

#3.	What is our Annual Total Revenue?
SELECT YEAR(O.OrderDate) AS Año, SUM(OD.Quantity * P.Price) AS Total_Revenue
FROM orders O
JOIN order_details OD ON OD.OrderID = O.OrderID
JOIN products P ON P.ProductID = OD.ProductID
GROUP BY YEAR(O.OrderDate);

#4.	Who is the shipper that delivers most of our customers' orders?
SELECT s.ShipperName, Tab1.*
FROM shippers s
JOIN
(
SELECT ShipperID, COUNT(*) AS Delivers
FROM orders
GROUP BY ShipperID
ORDER BY COUNT(*) DESC) AS Tab1
ON s.ShipperID= Tab1.ShipperID
ORDER BY Delivers DESC
LIMIT 1;

#5.	Do we have customers that only request orders for one category of products?
SELECT cat.CategoryID, TAB1.CustomerName #cat.CategoryID
FROM 
categories cat
JOIN
(
SELECT C.CustomerID, C.CustomerName, P.ProductName 
FROM orders O 
JOIN order_details OD ON O.OrderID = OD.OrderID
JOIN products P ON OD.ProductID = P.ProductID
JOIN customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CustomerName, P.ProductName) AS TAB1 
ON 1=1
WHERE (SELECT 
WHERE CustomerID IN (cat.CategoryID= 8 OR 3)
GROUP BY cat.CategoryID,TAB1.CustomerName * #C.CustomerID

SELECT cat.CategoryID, cat.CategoryName
CASE
    WHEN CategoryID IN (1,2,3,4,5,6,7,8) THEN 'The user buys products from all categories'
    WHEN CategoryID IN (1,2,3,4,5,6,7) THEN 'The user buys products from all categories'
    ELSE 'The quantity is under 30'
END AS Cats
FROM categories cat;
#SQL Practice 30-07-2021
#Week 1 – Day 3

#1.	What products do we sell the most of and how much do we charge for them?
#Assuming those with lowest quantity are the ones with more sales
SELECT ProductName, Quantity, ROUND(Quantity*Price, 2) AS Revenue
FROM order_details OD
JOIN products P ON OD.ProductID = P.ProductID
GROUP BY ProductName, Quantity, Revenue
ORDER BY Quantity ASC LIMIT 10;

#2.	Which products brings us the most revenue? (Excluding “Alice Mutton” because they are going out of business.)
SELECT ProductName, ROUND(Quantity*Price, 2) AS Revenue
FROM order_details od 
JOIN products p ON od.ProductID = p.ProductID 
WHERE ProductName NOT IN ('Alice Mutton')
GROUP BY ProductName, Revenue;

SELECT ProductName, Quantity, ROUND(Quantity*Price,2) AS Revenue
FROM order_details OD 
JOIN products P ON OD.ProductID= P.ProductID
WHERE ProductName<>'Alice Mutton' #<> mean not in 
ORDER BY ProductName ASC;

SELECT * 
FROM products 
WHERE ProductID<>17; #Alice Muton has the Product ID 17

#3.	What is our Annual Total Revenue?
SELECT YEAR(O.OrderDate) AS Año, SUM(OD.Quantity * P.Price) AS Total_Revenue
FROM orders O
JOIN order_details OD ON OD.OrderID = O.OrderID
JOIN products P ON P.ProductID = OD.ProductID
GROUP BY YEAR(O.OrderDate);

#4.	Who is the shipper that delivers most of our customers' orders?
SELECT s.ShipperName, Tab1.*
FROM shippers s
JOIN
(
SELECT ShipperID, COUNT(*) AS Delivers
FROM orders
GROUP BY ShipperID
ORDER BY COUNT(*) DESC) AS Tab1
ON s.ShipperID= Tab1.ShipperID
ORDER BY Delivers DESC
LIMIT 1;

#5.	Do we have customers that only request orders for one category of products?
SELECT c.CustomerName, count(cat.CategoryID) AS Category_per_customer
FROM categories cat
JOIN products p ON p.CategoryID= cat.CategoryID
JOIN order_details od ON p.ProductID = od.ProductID
JOIN orders o ON od.OrderID= o.OrderID
JOIN customers c ON o.CustomerID= c.CustomerID
GROUP BY c.CustomerName
ORDER BY Category_per_customer
LIMIT 3;