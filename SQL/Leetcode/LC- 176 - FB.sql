/*Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/

/*DATA PREP*/

CREATE TABLE Employee (ID INT, SALARY INT); 

INSERT INTO Employee VALUES (1, 100); 
INSERT INTO Employee VALUES (2, 200); 
INSERT INTO Employee VALUES (3, 300); 


--SOLUTION 
select max(salary) SecondHighestSalary from Employee where SALARY < (select max(salary) from Employee);



--DATA CLEANUP
drop table Employee;



