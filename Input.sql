-- Step 1: Export MySQL Database
-- Using mysqldump to export data
mysqldump -u root -p --compatible=postgresql --no-create-info mydb > mydb_data.sql

-- Step 2: Modify the Dump File for PostgreSQL Compatibility
-- Replace MySQL-specific syntax like AUTO_INCREMENT with PostgreSQL sequences
-- Convert ENUM types to CHECK constraints or VARCHAR

-- Step 3: Create the PostgreSQL Database
CREATE DATABASE mydb_pg;

-- Step 4: Import Schema (Tables & Constraints) into PostgreSQL
psql -U postgres -d mydb_pg -f mydb_schema.sql

-- Step 5: Import Data into PostgreSQL
psql -U postgres -d mydb_pg -f mydb_data.sql

-- Step 6: Data Integrity Checks
-- Count records in both databases for verification
SELECT COUNT(*) FROM mytable;
