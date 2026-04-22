USE ecommerce;

SELECT *
FROM products;

-- Maximum price 
SELECT MAX(price)
FROM products;

SELECT product_name
FROM products
WHERE price = 12000;

SELECT *
FROM products
ORDER BY price DESC;

-- manually
SELECT product_name
FROM products
WHERE price = 12000;

-- USING SubQuery 
SELECT product_name
FROM products
WHERE price = (SELECT MAX(price)
				FROM products);



SELECT * 
FROM order_items;

SELECT product_id
FROM order_items;

-- Find products that have never been ordered
SELECT product_name
FROM products
WHERE product_id NOT IN (
			SELECT product_id
            FROM order_items);


-- Find products that have never been ordered using LEFT JOIN
SELECT product_name
FROM products P
LEFT JOIN order_items OI ON OI.product_id = P.product_id
WHERE OI.product_id IS NULL;



-- 1st Query
SELECT AVG(total_number)
FROM orders;

-- 2nd Query
SELECT customer_id
FROM orders
WHERE total_amount > '5423.284000';  

-- 3rd Query
SELECT *
FROM customers
WHERE customer_id IN ('15', '3', '13', '9');



-- Final Query
SELECT *
FROM customers
WHERE customer_id IN (SELECT customer_id
						FROM orders
						WHERE total_amount > (SELECT AVG(total_amount)
												FROM orders)); 
                                                
                                                
                                                
                                                
                                                
-- -- Retrieve products below average stock 
SELECT product_name, stock
FROM products
WHERE stock < (SELECT AVG(stock)
				FROM products);
                
			
-- -- Retrieve product with highest inventory value 
SELECT product_name
FROM products
WHERE (price*stock) = (SELECT MAX(price*stock) 
						FROM products);
                        
-- -- Retrieve cheapest products in each category 
SELECT product_name, category
FROM products P1
WHERE price = (SELECT MIN(price) 
					FROM products P2
					WHERE P2.category = P1.category);