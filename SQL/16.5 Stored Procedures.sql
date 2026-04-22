-- Stored Procedures

-- Create a Procedure
-- CREATE PROCEDURE Welcome() 
-- BEGIN 
-- 	SELECT "Hello World";
-- END;



-- Changing Delimiter
DELIMITER /
SELECT * 
FROM employee /
SELECT "Hello world" / 
DELIMITER ;


SELECT "Hello world";


-- We can use hashtag as well
DELIMITER @

SELECT * FROM employee@
SELECT "Hello World"@

DELIMITER ;
 
 SELECT "Hello World"
 
 
-- ____________________________

-- Stored Procedures 

/* 1. Changing Delimiter */
DELIMITER /

SELECT * FROM employee /

DELIMITER ;

/* 2. Create a Procedure */
DELIMITER /

CREATE PROCEDURE Welcome()
BEGIN
    SELECT "Hello World";
END /

DELIMITER ;
 
 
-- Call a Procedure
CALL Welcome(); 


-- Drop Procedure
DROP PROCEDURE Welcome;

-- Pass Argument inside the Procedure
DELIMITER /
CREATE PROCEDURE Expensive(IN threshold INT)
BEGIN
    SELECT *
    FROM sales
    WHERE amount > threshold;
END /
DELIMITER ;

-- Call Procedure 
CALL Expensive(700);




/* Passing Multiple Arguments */
DELIMITER /
CREATE PROCEDURE GoodSales(IN min INT, IN max INT)
BEGIN
    SELECT *
    FROM sales
    WHERE Amount BETWEEN min AND max;
END /
DELIMITER ;

/* Call Procedure */
CALL GoodSales(300, 700);
  
  
  
/* Find sales between AVG and MAX amount */

SELECT *
FROM sales
WHERE Amount BETWEEN 
      (SELECT AVG(Amount) FROM sales) 
  AND (SELECT MAX(Amount) FROM sales);
  
  
  
/* Optimized using subquery once */

SELECT *
FROM sales
WHERE Amount BETWEEN 
      (SELECT AVG(Amount) FROM sales)
  AND (SELECT MAX(Amount) FROM sales);
  
  
  
  
  
  
  
  
/* Stored Procedure with manual range */
DELIMITER /
CREATE PROCEDURE BetterThanAvgSales(IN min INT, IN max INT)
BEGIN
    SELECT *
    FROM sales
    WHERE Amount BETWEEN min AND max;
END /
DELIMITER ;


--  Call Procedure using manual values 
SET @x = 269;
SET @y = 900;

CALL BetterThanAvgSales(@x, @y);