
Create table Customerz (customer_id int, customer_name varchar(30))
Create table Orderz (order_id int, customer_id int, product_name varchar(30))

Truncate table Customerz
insert into Customerz (customer_id, customer_name) values (1, 'Daniel')
insert into Customerz (customer_id, customer_name) values (2, 'Diana')
insert into Customerz (customer_id, customer_name) values (3, 'Elizabeth')
insert into Customerz (customer_id, customer_name) values (4, 'Jhon')

Truncate table Orderz
insert into Orderz (order_id, customer_id, product_name) values (10, 1, 'A')
insert into Orderz (order_id, customer_id, product_name) values (20, 1, 'B')
insert into Orderz (order_id, customer_id, product_name) values (30, 1, 'D')
insert into Orderz (order_id, customer_id, product_name) values (40, 1, 'C')
insert into Orderz (order_id, customer_id, product_name) values (50, 2, 'A')
insert into Orderz (order_id, customer_id, product_name) values (60, 3, 'A')
insert into Orderz (order_id, customer_id, product_name) values (70, 3, 'B')
insert into Orderz (order_id, customer_id, product_name) values (80, 3, 'D')
insert into Orderz (order_id, customer_id, product_name) values (90, 4, 'C')



select * from Customerz
where customer_id in 

(select customer_id 
from 
(
	select customer_id,A,B,C from Orderz
	PIVOT 
	(
	COUNT(PRODUCT_NAME) FOR PRODUCT_NAME IN (A,B,C) 
	) PVT_TBL
) A
group by customer_id
having SUM(A) <>0 and SUM(B) <>0 and SUM(C)=0
)

SELECT CourseName, PROGRAMMING, INTERVIEWPREPARATION
FROM geeksforgeeks 
PIVOT 
( 
SUM(Price) FOR CourseCategory IN (PROGRAMMING, INTERVIEWPREPARATION ) 
) AS PivotTable 
