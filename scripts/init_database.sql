/*
--------------------------------------------------------------------------------
DATABASE PROVISIONING SCRIPT
--------------------------------------------------------------------------------
Purpose: Initial setup of the 'DataWarehouse' environment.
Target:  Master Instance
Schemas: bronze (Raw), silver (Cleansed), gold (Curated)

WARNING: 
Executing this script will DROP the existing 'DataWarehouse' database. 
All data will be permanently deleted.
--------------------------------------------------------------------------------
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force disconnect all users and drop the DB
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the new DB
USE DataWarehouse;
GO  --session context safety

-- Create Medallion Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
