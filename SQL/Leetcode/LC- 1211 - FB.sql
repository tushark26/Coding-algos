create table queries(query_name varchar(40), result varchar(40), position int, rating int)

insert into queries values('Dog','Golden Retriever',1,5 )
insert into queries values('Dog','German Shepherd',2,5)
insert into queries values('Dog','Mule',200,1)
insert into queries values('Cat','Shirazi',5,2)
insert into queries values('Cat','Siamese',3,3)
insert into queries values('Cat','Sphynx',7,4)


SELECT ROUND(123.9994, 3), ROUND(123.9995, 3);

--Failed some tests 
select query_name,ROUND(AVG(quality),2) quality ,
ROUND(100*count(case when rating < 3 then rating end) / CONVERT(DECIMAL(10,2),count(*)) ,2)  poor_query_percentage 
from (select *, convert(decimal(10,2), convert(decimal(10,2),rating) / convert(decimal(10,2),position)) quality from queries) A
group by query_name
order by AVG(quality) desc


--Discussion board solution
select query_name, cast(avg(rating/(position*1.0)) as Decimal(10,2)) quality,
cast(100*count(case when rating < 3 then rating end) / (1.0*count(*)) as DECIMAL(10,2)) poor_query_percentage
from queries
group by query_name


drop table queries;

