use sql_project

SELECT * FROM dbo.retail_sales

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

--Data Analysis and Business Key Problems and Inferences
--1. Write a query to find total sales in specific data '2022-11-05'
SELECT * FROM dbo.retail_sales
where  sale_date='2022-11-05'

--2. Write a query to retrieve all trasaction where category is Clothing and total quantity is 10 in month of nov 2022
SELECT * FROM dbo.retail_sales
where category='Clothing' and quantiy>=4 and year(sale_date)='2022' and month(sale_date)='11'

--3. Write a sql query to calculate total sales for each category
SELECT category,sum(total_sale)[Category_total_sales] FROM dbo.retail_sales
GROUP BY category

--4. Find the average age of customers who purchased item from beauty category.
SELECT AVG(age)[Average_Age] FROM dbo.retail_sales
WHERE category='Beauty' 

--5. Find all the sales greater than 1000.
SELECT * FROM dbo.retail_sales
WHERE total_sale>1000

--6. Find total number of  transaction made by each gender in each category.
SELECT category,gender, count(customer_id) FROM dbo.retail_sales
GROUP BY category,gender
order by category

--7.Find out average sales for each month and best selling month of the year
SELECT * FROM

(
SELECT year(sale_date)[Year],month(sale_date)[Month],avg(total_sale)[Average Sale], 
RANK()OVER(PARTITION BY year(sale_date) ORDER BY avg(total_sale) DESC)AS RANK
FROM dbo.retail_sales
Group by year(sale_date),month(sale_date)
) AS subquery
WHERE RANK between 1 and 3

--8. Top 5 customer based on hightes toal sales
SELECT top 5  customer_id,sum(total_sale)[Total_SAle] FROM dbo.retail_sales
group by customer_id
order by sum(total_sale) desc



--9. find customer who purchase unique item from each category.
SELECT category, COUNT(DISTINCT customer_id)[Unique_Customer]from dbo.retail_sales
GROUP BY category



--10. Write a sql query to find different shift and number of order in each shift
with cte as 
(
SELECT *,
	CASE 
		WHEN DATEPART(HOUR, sale_time)<12 THEN 'Morning'
		WHEN DATEPART(HOUR, sale_time) between 12 and 17 THEN 'Afternoon'
		ELSE 'Evening'
	END [Shift]
FROM dbo.retail_sales
)

select Shift,count(*)[Total Orders] from cte
group by Shift


