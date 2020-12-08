create table Failed (fail_date Date)

insert into Failed values('2018-12-28')
insert into Failed values('2018-12-29')
insert into Failed values('2019-01-04')
insert into Failed values('2019-01-05')

create table Succeeded (success_date Date)

insert into Succeeded values ('2018-12-30')
insert into Succeeded values ('2018-12-31')
insert into Succeeded values ('2019-01-01')
insert into Succeeded values ('2019-01-02')
insert into Succeeded values ('2019-01-03')
insert into Succeeded values ('2019-01-06')


select * from 
(select fail_date Date,'Failed' Status from Failed
UNION 
select *,'Succeeded' from Succeeded) A
where date between '01-01-2019' and '12-31-2019'
order by date 






with a  as (
(select fail_date as date,
       'failed' as period_state
       from failed)
union all 
 (select success_date as date,
         'succeeded' as period_state
         from succeeded)
    ),
    
  b as (    
select date,
       period_state,
       row_number() over (order by period_state, date asc) as seq
   from a where date between '2019-01-01' and '2019-12-31'
         )

select period_state, min(date) as start_date, max(date) as end_date from b
group by dateadd(d, -seq, date),period_state
order by start_date asc

