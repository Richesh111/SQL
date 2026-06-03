# Retail Sales Analysis SQL Projects 

## Project Overview 

**Project Title**: Retail Sales Analysis   
**Level**: Beginner  
**Database**: Retail_Sales_Data  

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives
**Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
**Data Cleaning**: Identify and remove any records with missing or null values.
**Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
**Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure
### 1. Database Setup
-**Database Creation**: The project starts by creating a database named sql_project.
-**Table Creation**: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
use sql_project

SELECT * FROM dbo.retail_sales

--check if there is null values or not

```


### 2. Data Exploration & Cleaning
**Record Count**: Determine the total number of records in the dataset.
**Customer Count**: Find out how many unique customers are in the dataset.
**Category Count**: Identify all unique product categories in the dataset.
**Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql

--check if there is null values or not

SELECT * FROM dbo.retail_sales
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
 OR total_sale IS NULL


 --total number of data
 SELECT count(*) FROM dbo.retail_sales


 --lets delete all null values so we get correct inferences from the data
DELETE FROM dbo.retail_sales
 WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
 OR total_sale IS NULL


--total number of data after deleting null values
SELECT count(*) FROM dbo.retail_sales

-- How many unique customer do we have?
SELECT COUNT(DISTINCT(customer_id)) from dbo.retail_sales

-- How many categories  do we have?
SELECT category, count(category)[Total Category] FROM dbo.retail_sales
group by category
 ```
 