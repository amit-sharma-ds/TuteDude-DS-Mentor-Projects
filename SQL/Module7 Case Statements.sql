-- Note: All the table creations Queries in the  -> 3. SQL Basics lecture 

SELECT *
FROM orders;

SELECT *
FROM order_items;

SELECT * 
FROM products;

-- Without CTE 
SELECT product_name,
	CASE 
		WHEN stock < 100 THEN "Low Stock" 
        ELSE "Sufficient Stock"
	END AS Availability
FROM products;


-- Query 1: Get products where stock is less than 100 (USING CTE)
WITH Stock_Availability AS(
SELECT product_name,
	CASE 
		WHEN stock < 100 THEN "Low Stock" 
        ELSE "Sufficient Stock"
	END AS Availability
FROM products
)
SELECT * 
FROM Stock_Availability
WHERE Availability = "Low Stock";


-- Query 2
SELECT product_name, price,
	CASE
		WHEN price <= 500 THEN "Cheap"
        WHEN price <= 1500 THEN "Reasonable"
        WHEN price > 1500 THEN "Expensive"
	END AS PriceCategory
FROM products;




-- Query 3
SELECT PriceCategory, COUNT(DISTINCT product_name) AS Quantity
FROM 
	(SELECT product_name, 
		CASE
			WHEN price <= 500 THEN "Cheap"
			WHEN price <= 1500 THEN "Reasonable"
			ELSE "Expensive"
		END AS PriceCategory
	FROM products) t
GROUP BY PriceCategory;



-- Query 4
 SELECT 
	COUNT(CASE WHEN price <= 500 THEN product_name END) AS Cheap,
    COUNT(CASE WHEN price BETWEEN 501 AND 1500 THEN product_name END) AS Reasonable,
    COUNT(CASE WHEN price > 1500 THEN product_name END) AS Expensive
FROM products;

-- ALTER
SELECT 
	SUM(CASE WHEN price <= 500 THEN 1 ELSE 0 END) AS Cheap,
    SUM(CASE WHEN price <- 1500 THEN 1 ELSE 0 END) AS Reasonable,
    SUM(CASE WHEN price > 1500 THEN 1 ELSE 0 END) AS Expensive
FROM products;


-- Query 5
SELECT Category,
    CASE
        WHEN p.price <= 50 THEN '0-50'
        WHEN p.price <= 100 THEN '51-100'
        WHEN p.price <= 200 THEN '101-200'
        ELSE '200+'
    END AS Price_Range,
    SUM(Quantity) AS TotalQuantitySold

FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY Category, Price_Range
ORDER BY Category, Price_Range;