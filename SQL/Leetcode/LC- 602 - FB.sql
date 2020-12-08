create table Request_Accepted(requester_id INT, accepter_id INT, accept_date DATE);

insert into Request_Accepted values(1,2,'2016/06/03');
insert into Request_Accepted values(1,3,'2016/06/08');
insert into Request_Accepted values(2,3,'2016/06/08');
insert into Request_Accepted values(3,4,'2016/06/09');
insert into Request_Accepted values(3,4,'2016/06/10');



select * from Request_Accepted

select top 1 accepter_id, count(distinct requester_id) Friends from Request_Accepted
group by accepter_id
order by friends desc;

select top 1 A.accepter_id as id, count(distinct A.requester_id) num from 
(select requester_id, accepter_id from Request_Accepted
UNION 
select accepter_id, requester_id from Request_Accepted
) A
group by A.accepter_id
order by num desc;

drop table Request_Accepted
