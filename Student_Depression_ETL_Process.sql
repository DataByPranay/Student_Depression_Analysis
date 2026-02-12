/* ============================================================
   PROJECT  : Student Depression Analysis (SQL + Tableau)
   PURPOSE  : Data Cleaning, Transformation & Preparation
   DATABASE : Tableau Project 1
   ============================================================ */

---------------------------------------------------------------
-- 1. DATABASE CREATION & SELECTION
---------------------------------------------------------------

CREATE DATABASE [Tableau Project 1];
GO

USE [Tableau Project 1];
GO


---------------------------------------------------------------
-- 2. INITIAL DATA EXPLORATION
---------------------------------------------------------------

-- View complete dataset
SELECT *
FROM dbo.[Depression+Student+Dataset];

-- Gender distribution analysis
SELECT 
    Gender, 
    COUNT(*) AS [Gender Count]
FROM dbo.[Depression+Student+Dataset]
GROUP BY Gender;


---------------------------------------------------------------
-- 3. DATA CLEANING : STANDARDIZING GENDER COLUMN
---------------------------------------------------------------

-- Convert 'Female' → 'F' and 'Male' → 'M'
UPDATE dbo.[Depression+Student+Dataset]
SET Gender = CASE 
                WHEN LTRIM(RTRIM(Gender)) = 'Female' THEN 'F'
                WHEN LTRIM(RTRIM(Gender)) = 'Male' THEN 'M'
                ELSE Gender
             END
WHERE LTRIM(RTRIM(Gender)) IN ('Female', 'Male');

-- Check for NULL values
SELECT *
FROM dbo.[Depression+Student+Dataset]
WHERE Gender IS NULL;

-- Check for blank values
SELECT *
FROM dbo.[Depression+Student+Dataset]
WHERE LTRIM(RTRIM(Gender)) = '';


---------------------------------------------------------------
-- 4. FEATURE ENGINEERING : AGE GROUP CREATION
---------------------------------------------------------------

-- Analyze age distribution
SELECT 
    Age,
    COUNT(*) AS [Count]
FROM dbo.[Depression+Student+Dataset]
GROUP BY Age
ORDER BY Age DESC;

-- Add Age_Group column
ALTER TABLE dbo.[Depression+Student+Dataset]
ADD Age_Group VARCHAR(10);

-- Populate Age_Group based on defined ranges
UPDATE dbo.[Depression+Student+Dataset]
SET Age_Group =
    CASE 
        WHEN Age BETWEEN 18 AND 24 THEN 'A1'
        WHEN Age BETWEEN 25 AND 30 THEN 'A2'
        ELSE 'A3'
    END;

-- Validate Age_Group distribution
SELECT 
    Age_Group,
    COUNT(*) AS [Count]
FROM dbo.[Depression+Student+Dataset]
GROUP BY Age_Group;


---------------------------------------------------------------
-- 5. COLUMN DISTRIBUTION ANALYSIS
---------------------------------------------------------------

-- View table structure
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Depression+Student+Dataset';

-- Categorical column distributions

SELECT Academic_Pressure, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Academic_Pressure;

SELECT Study_Satisfaction, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Study_Satisfaction;

SELECT Sleep_Duration, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Sleep_Duration;

SELECT Dietary_Habits, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Dietary_Habits;

SELECT Have_you_ever_had_suicidal_thoughts, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Have_you_ever_had_suicidal_thoughts;

SELECT Study_Hours, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Study_Hours;

SELECT Financial_Stress, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Financial_Stress;

SELECT Family_History_of_Mental_Illness, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Family_History_of_Mental_Illness;

SELECT Depression, COUNT(*) AS Count_Value
FROM dbo.[Depression+Student+Dataset]
GROUP BY Depression;


---------------------------------------------------------------
-- 6. ADDING INDEX COLUMN (SURROGATE KEY)
---------------------------------------------------------------

-- Add identity column for unique row identification
ALTER TABLE dbo.[Depression+Student+Dataset]
ADD Index_Column INT IDENTITY(1,1);


---------------------------------------------------------------
-- 7. STANDARDIZING DEPRESSION COLUMN
---------------------------------------------------------------

-- Convert numeric flags to categorical values
UPDATE dbo.[Depression+Student+Dataset]
SET Depression = 'No'
WHERE Depression = '0';

UPDATE dbo.[Depression+Student+Dataset]
SET Depression = 'Yes'
WHERE Depression = '1';

-- Optimize column datatype
ALTER TABLE dbo.[Depression+Student+Dataset]
ALTER COLUMN Depression VARCHAR(10);
