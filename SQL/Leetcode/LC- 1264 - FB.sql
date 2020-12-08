
Create table Friendship (user1_id int, user2_id int)
Create table Likes (user_id int, page_id int)

Truncate table Friendship
insert into Friendship (user1_id, user2_id) values (1, 2)
insert into Friendship (user1_id, user2_id) values (1, 3)
insert into Friendship (user1_id, user2_id) values (1, 4)
insert into Friendship (user1_id, user2_id) values (2, 3)
insert into Friendship (user1_id, user2_id) values (2, 4)
insert into Friendship (user1_id, user2_id) values (2, 5)
insert into Friendship (user1_id, user2_id) values (6, 1)

Truncate table Likes
insert into Likes (user_id, page_id) values (1, 88)
insert into Likes (user_id, page_id) values (2, 23)
insert into Likes (user_id, page_id) values (3, 24)
insert into Likes (user_id, page_id) values (4, 56)
insert into Likes (user_id, page_id) values (5, 11)
insert into Likes (user_id, page_id) values (6, 33)
insert into Likes (user_id, page_id) values (2, 77)
insert into Likes (user_id, page_id) values (3, 77)
insert into Likes (user_id, page_id) values (6, 88)


--Final solution
select distinct page_id 
from ( select user1_id,user2_id,'Orig' Typ from Friendship UNION select user2_id,user1_id,'Transitive' from Friendship) A 
RIGHT OUTER JOIN Likes B on A.user2_id = B.user_id 
where A.user1_id=1 and B.user_id <>1
and page_id not in (select page_id from Likes where user_id=A.user1_id)

