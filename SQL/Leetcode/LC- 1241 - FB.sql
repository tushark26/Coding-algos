Create table Submissions (sub_id int, parent_id int)
Truncate table Submissions
insert into Submissions (sub_id, parent_id) values (1, NULL)
insert into Submissions (sub_id, parent_id) values (2, NULL)
insert into Submissions (sub_id, parent_id) values (1, NULL)
insert into Submissions (sub_id, parent_id) values (12, NULL)
insert into Submissions (sub_id, parent_id) values (3, 1)
insert into Submissions (sub_id, parent_id) values (5, 2)
insert into Submissions (sub_id, parent_id) values (3, 1)
insert into Submissions (sub_id, parent_id) values (4, 1)
insert into Submissions (sub_id, parent_id) values (9, 1)
insert into Submissions (sub_id, parent_id) values (10, 2)
insert into Submissions (sub_id, parent_id) values (6, 7)

select * from Submissions A LEFT OUTER JOIN Submissions B 
ON A.parent_id = B.sub_id

select distinct parent_id post_id, count(distinct sub_id) number_of_comments 
from Submissions  
where parent_id is not NULL
and sub_id 
group by parent_id

select * from Submissions where parent_id


--Final submission
select A.sub_id post_id, count(distinct B.sub_id) number_of_comments
from Submissions A left outer join Submissions B on A.sub_id = B.parent_id
where A.parent_id is null
group by A.sub_id




