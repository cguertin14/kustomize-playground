-- Databases.
CREATE DATABASE IF NOT EXISTS test_db_staging;

-- Users.
CREATE USER IF NOT EXISTS 'test_user_staging'@'localhost' IDENTIFIED BY 'some_password';

-- Alters.
ALTER USER 'test_user_staging'@'localhost' IDENTIFIED BY 'some_password';

-- Privileges.
GRANT ALL PRIVILEGES ON test_db_staging.* TO 'test_user_staging' identified by 'some_password';

-- Max Connexions.
SET GLOBAL max_connections = 2048;