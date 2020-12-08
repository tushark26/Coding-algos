/*
The Employee table holds all employees including their managers. 
Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+

*/


CREATE TABLE EMPLOYEE ( ID INT, NAME VARCHAR(20), SALARY INT, MANAGERID INT);

INSERT INTO EMPLOYEE VALUES (1,'Joe',70000, 3)
INSERT INTO EMPLOYEE VALUES (2,'Henry',80000, 4)
INSERT INTO EMPLOYEE VALUES (3,'Sam',60000, NULL)
INSERT INTO EMPLOYEE VALUES (4,'Max',90000, NULL)



SELECT * FROM EMPLOYEE 

--OPTION 1
SELECT A.NAME EMPLOYEE
FROM EMPLOYEE A LEFT OUTER JOIN EMPLOYEE B ON A.MANAGERID = B.ID
WHERE A.SALARY >= B.SALARY

--OPTION 2
SELECT a.Name AS Employee
FROM Employee  a, Employee  b
WHERE a.ManagerId = b.Id AND a.Salary > b.Salary



--DATA CLEANUP
DROP TABLE EMPLOYEE
