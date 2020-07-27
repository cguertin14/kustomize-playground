-- Databases.
CREATE DATABASE IF NOT EXISTS test_db_dev;

-- Users.
CREATE USER IF NOT EXISTS 'test_user_dev'@'localhost' IDENTIFIED BY 'some_password';

-- Alters.
ALTER USER 'test_user_dev'@'localhost' IDENTIFIED BY 'some_password';

-- Privileges.
GRANT ALL PRIVILEGES ON test_db_dev.* TO 'test_user_dev' identified by 'some_password';

-- Max Connexions.
SET GLOBAL max_connections = 2048;