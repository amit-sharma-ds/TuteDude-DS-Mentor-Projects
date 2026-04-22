-- 2. Users & Privileges

-- Creating User
CREATE USER 'David'@'localhost' IDENTIFIED BY '1234';

-- Grant Permissions
GRANT ALL PRIVILEGES ON *.* TO 'David'@'localhost';

-- Checking Privilege
SELECT * FROM MYSQL.USER;

-- REVOKE Permission
REVOKE SELECT, INSERT, UPDATE, PRIVILEGES ON *.* FROM 'David'@'localhost'; 

-- DROP User 
 DROP USER 'David'@'localhost';
 
 
 
-- ______________________________________________________________________________________ 
 
-- Creating User again
CREATE USER 'David'@'localhost' IDENTIFIED BY '1234';
 
-- Grant Permissions
GRANT ALL PRIVILEGES ON *.* TO 'David'@'localhost';
GRANT SELECT ON demo.* TO 'David'@'localhost';

-- REVOKE Permissions
REVOKE SELECT ON demo.* FROM 'David'@'localhost'; 
 