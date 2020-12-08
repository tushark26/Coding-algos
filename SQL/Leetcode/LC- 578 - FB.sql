drop table survey_log;

create table survey_log (id INT,action VARCHAR(30),question_id INT,answer_id  INT ,q_num INT,timestamp INT) 

insert into survey_log values(5,'show',285,null,1,123)
insert into survey_log values(5,'answer',285,124124,1,124)
insert into survey_log values(5,'show',369,null,2,125)
insert into survey_log values(5,'skip',369,null,2,126)
insert into survey_log values(6,'show',285,null,1,127)
insert into survey_log values(6,'answer',285,124124,1,128)

select * from survey_log

select question_id, count(distinct id) cnt from survey_log
where answer_id is not null
group by question_id;


--Using CTE - Common Table Expressions 
WITH SURVEY_AGG AS 
(
	SELECT QUESTION_ID,SUM(CASE WHEN ACTION='ANSWER' THEN 1 ELSE 0 END) ANS, 
	SUM(CASE WHEN ACTION!='ANSWER' THEN 1 ELSE 0 END) SHOWS 
	FROM survey_log 
	GROUP BY QUESTION_ID
)

SELECT TOP 1 QUESTION_ID as survey_log FROM SURVEY_AGG
ORDER BY ISNULL(CAST(ANS as FLOAT)/CAST(SHOWS AS FLOAT),0) DESC;


with t1 as 
(select question_id, sum(case when action = 'answer' then 1 else 0 end) answers,
sum(case when action != 'answer' then 1 else 0 end) shows from survey_log
 group by question_id
)

select top 1 question_id as survey_log
from t1
order by isnull(cast(answers as float)/cast(shows as float),0) desc;





