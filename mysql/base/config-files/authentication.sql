-- Databases.
CREATE DATABASE IF NOT EXISTS test_db;

-- Users.
CREATE USER IF NOT EXISTS 'test_user'@'localhost' IDENTIFIED BY 'some_password';

-- Alters.
ALTER USER 'test_user'@'localhost' IDENTIFIED BY 'some_password';

-- Privileges.
GRANT ALL PRIVILEGES ON test_db.* TO 'test_user' identified by 'some_password';

-- Max Connexions.
SET GLOBAL max_connections = 2048;