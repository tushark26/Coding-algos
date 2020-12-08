Create table Activity (machine_id int, process_id int, 
activity_type varchar(20) check (activity_type in ('start', 'end')),
timestamp float)

Truncate table Activity
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 0, 'start', 0.712)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 0, 'end', 1.52)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 1, 'start', 3.14)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (0, 1, 'end', 4.12)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 0, 'start', 0.55)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 0, 'end', 1.55)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 1, 'start', 0.43)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (1, 1, 'end', 1.42)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 0, 'start', 4.1)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 0, 'end', 4.512)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 1, 'start', 2.5)
insert into Activity (machine_id, process_id, activity_type, timestamp) values (2, 1, 'end', 5)


select * from Activity

select machine_id,cast ( ROUND(avg(processing_time),3) as Decimal(10,5))  processing_time from 
(
	select machine_id,process_id,max(en)-max(st) processing_time  from 
	(select machine_id, process_id, 
	case when activity_type='start' then timestamp end st,
	case when activity_type='end' then timestamp end en
	from Activity) A
	group by machine_id,process_id
) B
group by machine_id
order by processing_time


drop table activity
