Create table Numbers (Number int, Frequency int)
Truncate table Numbers
insert into Numbers (Number, Frequency) values ('0', '7')
insert into Numbers (Number, Frequency) values ('1', '1')
insert into Numbers (Number, Frequency) values ('2', '3')
insert into Numbers (Number, Frequency) values ('3', '1')


select * from Numbers;



--https://social.msdn.microsoft.com/Forums/sqlserver/en-US/66e79c9c-a010-44ca-9e21-5921152a159d/how-to-repeat-rows-based-on-column-value?forum=transactsql

WITH Cte([Num],[Repeat]) AS
(
SELECT Number,Frequency FROM Numbers
UNION ALL
SELECT [Num],[Repeat]-1 FROM Cte
WHERE [Repeat]>1
)
SELECT * FROM Cte ORDER BY [Num],[Repeat]
OPTION(MAXRECURSION 0)


--https://codingsight.com/calculate-the-median-by-using-tsql/

WITH Cte([Num],[Repeat]) AS
(
SELECT Number,Frequency FROM Numbers
UNION ALL
SELECT [Num],[Repeat]-1 FROM Cte
WHERE [Repeat]>1
)
SELECT * FROM Cte ORDER BY [Num],[Repeat]
OPTION(MAXRECURSION 0);



WITH Cte([Num],[Repeat]) AS
(
SELECT Number,Frequency FROM Numbers
UNION ALL
SELECT [Num],[Repeat]-1 FROM Cte
WHERE [Repeat]>1
)

SELECT ( (SELECT MAX(NUM), 
                 [Repeat] 
          FROM   (SELECT TOP 50 PERCENT NUM,[REPEAT]
                  FROM   CTE 
                  GROUP  BY [REPEAT]
                  ORDER  BY [REPEAT]) AS BOTTOMHALF) 
         + (SELECT MIN(NUM), 
                   [REPEAT] 
            FROM   (SELECT TOP 50 PERCENT NUM, 
                                          [REPEAT] 
                    FROM   CTE 
                    GROUP  BY [REPEAT] 
                    ORDER  BY [REPEAT] DESC) AS TOPHALF) ) / 2 AS MEDIAN;










