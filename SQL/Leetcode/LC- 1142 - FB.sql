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
insert into Activity values(3,5,'2019-07-21','open_session')
insert into Activity values(3,5,'2019-07-21','scroll_down')
insert into Activity values(3,5,'2019-07-21','end_session')
insert into Activity values(4,3,'2019-06-25','open_session')
insert into Activity values(4,3,'2019-06-25','end_session')


select convert(decimal(10,2), count(distinct session_id)/ convert(decimal(10,2),count(distinct user_id))) average_sessions_per_user 
from Activity where datediff(day,activity_date,'2019-07-27')<30

select ISNULL(convert(decimal(10,2),AVG(NoOfSessions)),0.00) average_sessions_per_user from 
(select user_id, convert(decimal(10,2),count(distinct session_id)) NoOfSessions 
from Activity where datediff(day,activity_date,'2019-07-27')<30
group by user_id) A




drop table Activity;

