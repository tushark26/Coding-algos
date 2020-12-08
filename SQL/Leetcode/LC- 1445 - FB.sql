Create table Sales (sale_date date, 
fruit varchar(20) NOT NULL check(fruit in ('apples', 'oranges')), sold_num int)

Truncate table Sales
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-01', 'apples', 10)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-01', 'oranges', 8)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-02', 'apples', 15)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-02', 'oranges', 15)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-03', 'apples', 20)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-03', 'oranges', 0)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-04', 'apples', 15)
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-04', 'oranges', 16)


select * from Sales;

--Final solution using pivot table 
select SALE_DATE, APPLES-ORANGES as DIFF from Sales
PIVOT 
(
SUM(SOLD_NUM) FOR FRUIT IN (APPLES, ORANGES) 
) PVT_TBL
ORDER BY SALE_DATE ASC



