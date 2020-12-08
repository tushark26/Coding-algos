create table Actions (user_id INT, post_id int, action_date DATE,  
action VARCHAR(10) NOT NULL CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), 
extra varchar(50))


insert into Actions values( '1','1','2019-07-01','view',null)
insert into Actions values('1','1','2019-07-01','like',null)
insert into Actions values('1','1','2019-07-01','share',null)
insert into Actions values('2','2','2019-07-04','view',null)
insert into Actions values('2','2','2019-07-04','report','spam')
insert into Actions values('3','4','2019-07-04','view',null)
insert into Actions values('3','4','2019-07-04','report','spam')
insert into Actions values('4','3','2019-07-02','view',null)
insert into Actions values('4','3','2019-07-02','report','spam')
insert into Actions values('5','2','2019-07-03','view',null)
insert into Actions values('5','2','2019-07-03','report','racism')
insert into Actions values('5','5','2019-07-03','view',null)
insert into Actions values('5','5','2019-07-03','report','racism')


create table Removals (post_id INT, remove_date DATE) 

insert into Removals values(2,'2019-07-20') 
insert into Removals values(3,'2019-07-18') 

select * from Actions A LEFT OUTER JOIN Removals B 
ON A.post_id= B.post_id
where A.action='report' and extra='spam'
ORDER BY action_date 


select convert( decimal(10,2),100*avg(A.removal_rate)) average_daily_percent  from 
(select action_date, 
convert(decimal(10,4), count( distinct case when B.remove_date is not NULL then  A.post_id end) 
/CONVERT(Decimal(10,4), count(distinct A.post_id) )) removal_rate
from Actions A LEFT OUTER JOIN Removals B 
ON A.post_id= B.post_id
where A.action='report' and extra='spam'
group by action_date)A


drop table Actions
drop table Removals
