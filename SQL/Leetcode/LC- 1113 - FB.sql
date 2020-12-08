create table Actions (user_id INT, post_id int, action_date DATE,  
action VARCHAR(10) NOT NULL CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), 
extra varchar(50))


insert into Actions values( '1','1','2019-07-01','view',null)
insert into Actions values('1','1','2019-07-01','like',null)
insert into Actions values('1','1','2019-07-01','share',null)
insert into Actions values('2','4','2019-07-04','view',null)
insert into Actions values('2','4','2019-07-04','report','spam')
insert into Actions values('3','4','2019-07-04','view',null)
insert into Actions values('3','4','2019-07-04','report','spam')
insert into Actions values('4','3','2019-07-02','view',null)
insert into Actions values('4','3','2019-07-02','report','spam')
insert into Actions values('5','2','2019-07-04','view',null)
insert into Actions values('5','2','2019-07-04','report','racism')
insert into Actions values('5','5','2019-07-04','view',null)
insert into Actions values('5','5','2019-07-04','report','racism')


/*
+---------+---------+-------------+--------+--------+
| user_id | post_id | action_date | action | extra  |
+---------+---------+-------------+--------+--------+
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 4       | 2019-07-04  | view   | null   |
| 2       | 4       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-04  | view   | null   |
| 5       | 2       | 2019-07-04  | report | racism |
| 5       | 5       | 2019-07-04  | view   | null   |
| 5       | 5       | 2019-07-04  | report | racism |
+---------+---------+-------------+--------+--------+
*/

select extra report_reason, count(distinct post_id) report_count
from actions 
where action='report' and action_date='2019-07-04'
group by extra

drop table Actions




