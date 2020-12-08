create table Activity(user_id INT,session_id INT,activity_date DATE,
activity_type varchar(20) NOT NULL check(activity_type in ('open_session', 'end_session', 'scroll_down', 'send_message') )
) 


insert into Activity values(1,1,'2019-07-20','open_session')
insert into Activity values(1,1,'2019-07-20','scroll_down')
insert into Activity values(1,1,'2019-07-20','end_session')
insert into Activity values(2,4,'2019-07-20','open_session')
insert into Activity values(2,4,'2019-07-21','send_message')
insert into Activity values(2,4,'2019-07-21','end_session')
insert into Activity values(3,2,'2019-07-21','open_session')
insert into Activity values(3,2,'2019-07-21','send_message')
insert into Activity values(3,2,'2019-07-21','end_session')
insert into Activity values(4,3,'2019-06-25','open_session')
insert into Activity values(4,3,'2019-06-25','end_session')


--Unpivoting solution
(select p.user_id,p.session_id,open_session,end_session, scroll_down, send_message
from activity s
pivot 
(
MAX(activity_date) for activity_type in ("open_session", "end_session", "scroll_down", "send_message")  
)p
where NOT (scroll_down is NULL and send_message is NULL)




(case when activity_type = 'open_session' then activity_date end ) session_start,
(case when activity_type = 'end_session' then activity_date end )  session_end, 
(case when activity_type not in ('open_session','end_session') then activity_date end )  activity  
from Activity


select activity_date day, count(distinct user_id) active_users
from activity where session_id in (
select distinct session_id from Activity where activity_type not in ('open_session','end_session') 
and activity_date between DATEADD(day,-30,'2019-07-26') and '2019-07-26' 
)
group by activity_date

select * from activity where activity_date between DATEADD(day,-30,'2019-07-26') and '2019-07-26'

select A.activity_date, count(distinct A.user_id) 
from 
	(select * from Activity 
	where activity_type not in ('open_session','end_session') 
	UNION 
	select * from Activity 
	where activity_type in ('open_session') 
	) A
group by A.activity_date


--Final solution
select activity_date as day, count(distinct user_id) as active_users from Activity
where datediff(day,activity_date,'2019-07-27')<30
group by activity_date


drop table Activity
