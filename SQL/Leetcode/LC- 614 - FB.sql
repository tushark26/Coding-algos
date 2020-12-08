create table follow (followee varchar(20), follower varchar(20))

insert into follow values ('A','B')
insert into follow values ('B','C')
insert into follow values ('B','D')
insert into follow values ('D','E')

select * from follow;

--Sub query solution
select followee follower, COUNT(*) num 
from follow where followee in (select distinct follower from follow)
group by followee
order by num desc


--Join solution 
select A.follower, count(distinct B.follower) num from follow A JOIN follow B on A.follower = B.followee
Group by A.follower;

drop table follow;

