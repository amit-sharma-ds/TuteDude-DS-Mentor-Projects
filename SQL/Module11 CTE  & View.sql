USE ecommerce;

SELECT * 
FROM products;

SELECT *
FROM order_items;

-- Category-wise Total Sales Revenue 
SELECT category, SUM(OI.quantity*OI.price) AS sales
FROM products P 
JOIN order_items OI ON P.product_id = OI.product_id
GROUP BY category;

-- USING SUBQUERY
SELECT category, sales
FROM (SELECT category, SUM(OI.quantity*OI.price) AS sales
	FROM products p
    JOIN order_items OI ON P.product_id = OI.product_id
    GROUP BY category) T;
    
    
-- CTE 
WITH T AS(SELECT category, SUM(OI.quantity*OI.price) AS sales
FROM products P
	JOIN order_items OI ON P.product_id = OI.product_id
	GROUP BY category)
    
SELECT *
FROM T;





-- Question 1: Top 10 Customers by Total Spending 
WITH T AS(
	SELECT customer_id, SUM(total_amount) AS total_amount
    FROM orders
    GROUP BY customer_id
)
SELECT CONCAT(first_name, ' ', last_name) AS name, total_amount
FROM customers C
JOIN T ON T.customer_id = C.customer_id
ORDER BY total_amount DESC 
LIMIT 10;


-- Question 2: 
WITH T AS(
	SELECT DAY(order_date) AS "day", SUM(total_amount) AS total_amount
    FROM orders
    GROUP BY DAY(order_date)
)
SELECT *
FROM T;


-- CREATING VIEW
CREATE VIEW dailytrend AS
SELECT CONCAT(first_name, " ", last_name) AS customer, order_date, total_amount, quantity
FROM orders O 
JOIN customers C ON C.customer_id = O.customer_id
JOIN order_items OI ON OI.order_id = O.order_id;

-- We can use the above view on any other SQL page 
SELECT * 
FROM dailytrend;


-- Daily Sales Summary by Total Amount
SELECT DAY(order_date) AS day, 
       SUM(total_amount) AS total_amount, 
       SUM(quantity) AS total_quantity
FROM dailytrend
GROUP BY DAY(order_date)
ORDER BY total_amount;



-- Question

-- Creating View for Sales Department
CREATE VIEW OrderDetails AS
SELECT O.order_id, order_date, first_name, last_name, product_name, quantity,
OI.price
FROM orders O
JOIN customers C ON O.customer_id = C.customer_id
JOIN order_items OI ON O.order_id = OI.order_id
JOIN products P ON OI.product_id = P.product_id;


-- Creating View for Inventory Department
 CREATE VIEW InventoryStock AS
 SELECT product_id, product_name, category, price, stock
 FROM products;