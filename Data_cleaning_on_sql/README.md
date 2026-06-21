## Data Analysis
### Data Importing

```sql
--selecting the data base
use data_cleaning_project

--selecting the table
select * from data_cleaning_raw


--droping table which includes deleting everything including structure as well
drop table data_clean

--lets make a duplicate table to preserve our original data
select * into data_clean from data_cleaning_raw

select * from data_clean

--1.Finding duplicates in record
select customer_name,email,city,order_date,amount,count(*)as Total_Count  from data_clean
group by customer_name,email,city, order_date,amount
having count(*)>1

--2.Removing duplicates in record
delete from data_clean where order_id not in (
select order_id from
(
select min(order_id) as order_id from data_clean
group by customer_name,email,city,order_date,amount
) as t1
)

--3.Finding the null values:
select * from data_clean 
where email IS NULL OR customer_name IS NULL OR email IS NULL OR city IS NULL OR order_date IS NULL OR AMOUNT IS NULL

--UPDATING STRING 'NULL' TO NULL
update data_clean
set email= NULL
Where email='NULL'

--3.1. Finding all email with null values
select * from data_clean where email is null


--4. replace missing email
update data_clean
set email='unknown@gmail.com'
where email IS NULL


--5.Detect invalid email
select * from data_clean
where email NOT LIKE '%@gmail.com%'

--6.Fix invalid email
update data_clean
set email='rohit@gmail.com'
where order_id=10

select * from data_clean 
where email='NULL'

--7. Fix extra spaces in customer_name
update data_clean
set customer_name=trim(customer_name)

select * from data_clean

--8.Fix spelling mistake in city
update data_clean
set city='Mumbai'
where city='Mum bai'

--9.Remove extra spaces in city
update data_clean
set city=trim(city)


--10. converting dd-mm-yyyy
SELECT CONVERT(date, '22-02-2020', 105);
--converting mm-dd-yyyy
SELECT CONVERT(date, '01-13-2024', 101); 
--converting yyyy-mm-dd even looks like date from stirng to date
SELECT CONVERT(date, '2024-01-13', 23); 

select * from data_clean

--first lets cheeck the data type
select COLUMN_NAME,data_type from INFORMATION_SCHEMA.columns
	
--11.replace missing order date:
update data_clean
set order_date='2020-21-12'
where order_date is  null

--12 fix negative amount:
update data_clean
set amount=abs(amount)
where amount<=0


--13.fix null values:
update data_clean
set amount=0
where amount is null

select COLUMN_NAME,DATA_TYPE from INFORMATION_SCHEMA.COLUMNS

--converting datatypes in a tale
alter table data_clean
alter column order_id int

alter table data_clean
drop column order_date_text


alter table data_clean
alter column amount int


--selecting all the data
select * from data_clean

alter table data_clean
add order_date_text varchar(20)


update data_clean
set order_date_text= CONVERT(VARCHAR(20), order_date, 23);


--drop the column name order_date_text
alter table data_clean
drop column order_date_text



select * from data_clean


--process tho select second highest number.
select max(amount) from data_clean
where amount<(select max(amount) from data_clean)

select * from data_clean
order by amount desc
offset 1 row
fetch next 1 row only

select amount from
(
select amount,
dense_rank()over(order by amount desc) as dr
from data_clean
) as t
where dr=2

```
S