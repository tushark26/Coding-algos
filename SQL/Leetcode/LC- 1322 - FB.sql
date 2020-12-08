Create table Ads (ad_id int, user_id int, 
action varchar(20) NOT NULL check (action in ('Clicked', 'Viewed', 'Ignored'))
)
Truncate table Ads
insert into Ads (ad_id, user_id, action) values (1, 1, 'Clicked')
insert into Ads (ad_id, user_id, action) values (2, 2, 'Clicked')
insert into Ads (ad_id, user_id, action) values (3, 3, 'Viewed')
insert into Ads (ad_id, user_id, action) values (5, 5, 'Ignored')
insert into Ads (ad_id, user_id, action) values (1, 7, 'Ignored')
insert into Ads (ad_id, user_id, action) values (2, 7, 'Viewed')
insert into Ads (ad_id, user_id, action) values (3, 5, 'Clicked')
insert into Ads (ad_id, user_id, action) values (1, 4, 'Viewed')
insert into Ads (ad_id, user_id, action) values (2, 11, 'Viewed')
insert into Ads (ad_id, user_id, action) values (1, 2, 'Clicked')

select * from Ads

select ROUND(132.43434242,2)

select ad_id, 
Round(case when 
cast(100*
NULLIF((1.00*count(case when action='Clicked' then user_id end))/
NULLIF(1.00*count(case when action in ('Clicked','Viewed') then user_id end),0.00),0.00) 
 as Decimal(10,5)) is NULL then 0.00 else 
 cast(100*
NULLIF((1.00*count(case when action='Clicked' then user_id end))/
NULLIF(1.00*count(case when action in ('Clicked','Viewed') then user_id end),0.00),0.00) 
 as Decimal(10,5)) 

 end,2) ctr 
from Ads
group by ad_id
order by ctr desc
