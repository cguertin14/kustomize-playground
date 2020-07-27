-- Databases.
CREATE DATABASE IF NOT EXISTS test_db_prod;

-- Users.
CREATE USER IF NOT EXISTS 'test_user_prod'@'localhost' IDENTIFIED BY 'some_password';

-- Alters.
ALTER USER 'test_user_prod'@'localhost' IDENTIFIED BY 'some_password';

-- Privileges.
GRANT ALL PRIVILEGES ON test_db_prod.* TO 'test_user_prod' identified by 'some_password';

-- Max Connexions.
SET GLOBAL max_connections = 2048;