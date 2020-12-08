create table FriendRequest(sender_id INT, send_to_id INT, request_date DATE) 

insert into FriendRequest values(1,2,'2016/06/01');
insert into FriendRequest values(1,3,'2016/06/01');
insert into FriendRequest values(1,4,'2016/06/01');
insert into FriendRequest values(2,3,'2016/06/02');
insert into FriendRequest values(3,4,'2016/06/09');



create table RequestAccepted(requester_id INT, accepter_id INT, accept_date DATE);

insert into RequestAccepted values(1,2,'2016/06/03');
insert into RequestAccepted values(1,3,'2016/06/08');
insert into RequestAccepted values(2,3,'2016/06/08');
insert into RequestAccepted values(3,4,'2016/06/09');
insert into RequestAccepted values(3,4,'2016/06/10');


select * from FriendRequest;
select * from RequestAccepted;




SELECT CONVERT(DECIMAL(3,2),
CONVERT(DECIMAL(3,2), count(distinct CONCAT(requester_id, accepter_id)))
/ CONVERT(DECIMAL(3,2), NULLIF(count(distinct CONCAT(sender_id,send_to_id,request_date)),0.00))
) accept_rate
FROM RequestAccepted, FriendRequest





drop table FriendRequest;
drop table RequestAccepted;


