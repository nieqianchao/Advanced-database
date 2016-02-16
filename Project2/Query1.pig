-- Load the Transactions.csv file
A = LOAD '/user/hadoop/t_input/Transactions.csv' USING PigStorage(',') AS (TransID: int, CustID: int, TransTotal: float, TransNumItems: int, TransDesc: chararray);

-- Group by customer id
B = GROUP A BY CustID;

-- Aggregation
C = FOREACH B GENERATE group, COUNT(A.TransID), SUM(A.TransTotal);

-- Output the result
STORE C INTO '/Project2/Q1_output' USING PigStorage(',');









