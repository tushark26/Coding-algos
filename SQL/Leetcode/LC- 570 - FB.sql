/*
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+------+----------+-----------+----------+
|Id    |Name 	  |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	  |A 	      |null      |
|102   |Dan 	  |A 	      |101       |
|103   |James 	  |A 	      |101       |
|104   |Amy 	  |A 	      |101       |
|105   |Anne 	  |A 	      |101       |
|106   |Ron 	  |B 	      |101       |
+------+----------+-----------+----------+
Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:

+-------+
| Name  |
+-------+
| John  |
+-------+
Note:
No one would report to himself.

*/

CREATE TABLE Employee (ID INT, NAME VARCHAR(20), DEPARTMENT VARCHAR(2), MANAGERID INT); 

INSERT INTO Employee values(101,'John','A',NULL);
INSERT INTO Employee values(102,'Dan','A',101);
INSERT INTO Employee values(103,'James','A',101);
INSERT INTO Employee values(104,'Amy','A',101);
INSERT INTO Employee values(105,'Anne','A',101);
INSERT INTO Employee values(106,'Ron','B',101);



select NAME from Employee where ID in
(SELECT managerid Reportees FROM Employee 
group by managerid
having COUNT(*)>4);


DROP TABLE Employee;