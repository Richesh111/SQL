use netflix_db

select * from dbo.netflix_titles

select count(*) from dbo.netflix_titles


--1.Number of movies vs Tv Shows
select type,count(type)as Total_Content from dbo.netflix_titles
group by type


--2.Find the most common rating for movies and Tv shows
select type,rating
from
(
select type, rating, count(*)[Rating_Count],
rank()over(partition by type order by count(*)desc)as ranking
from dbo.netflix_titles
group by type, rating) as t1
where ranking=1

--3.List all the movies listed in year 2020
select * from dbo.netflix_titles
where type='Movie' and release_year='2020'

--4.find the top 5 countries wiht the most content on netflix
select country,count(show_id) from dbo.netflix_titles
group by country


select new_country,count(new_country) from(
SELECT 
    show_id,
    value AS new_country
FROM dbo.netflix_titles
CROSS APPLY STRING_SPLIT(country, ','))as t1
group by new_country


--5.Indentify the longest movie
select * from netflix_titles
where duration = (select max(duration) from netflix_titles)


--6. Find content added in last 5 years
update netflix_titles
set date_added=cast(date_added as date)

select * from dbo.netflix_titles
where date_added>=(SELECT DATEADD(YEAR, -5, GETDATE()))



select COLUMN_NAME,DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
select * from dbo.netflix_titles


 
 7. FInd all the movies/series by 'Rajiv Chilaka'

 select * from netflix_titles
 where director like '%Rajiv Chilaka%'
