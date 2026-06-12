use netflix_db

select * from netflix_titles
	

--5.Identity the longest movies
select * from netflix_titles
where type='Movie' and duration=(select max(duration) from netflix_titles)

--6. select the content added in last 5 years
select * from netflix_titles
where date_added>=(select dateadd(year,-5,getdate()))


--7. FInd all the movies/series by 'Rajiv Chilaka'
select * from netflix_titles
where director like '%Rajiv Chilaka%'

--8.List all the TV SHOWS with more than 5 seasons

select * from netflix_titles
where type='TV Show' and duration>'5 season'

--9. Count the number of content item in each genre
select value,count(value)as Genre from 
(
select type,show_id,value from netflix_titles
cross apply string_split(listed_in,',')
) as t
group by value

--10. 

--11.List all the movies that are documentries

select *,value from netflix_titles
cross apply string_split(listed_in,',')
where value='Documentaries'

select * from netflix_titles
where  listed_in LIKE '%Documentaries%'


--12. fIND ALL THE CONTENT WITHOUT THE DIRECTOR
select * from netflix_titles
where director is null


select * from netflix_titles
select column_name,data_type from INFORMATION_SCHEMA.columns