create database data_cleaning_project

use data_cleaning_project

--create a 

select * from data_cleaning_raw

--creating the duplicate table
select * into data_clean from data_cleaning_raw

select * from data_clean

--1.detect duplicate record
select customer_name,email,city,order_date,amount, count(*) from data_clean
group by customer_name,email,city,order_date,amount 
having count(*)>1


delete from data_clean where order_id not in 
(
select order_id from 
(
	select min(order_id) as order_id from data_clean
	group by customer_name,email,city,order_date,amount
	) as t
)
