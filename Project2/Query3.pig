-- Load the Customers.csv file
A = LOAD '/user/hadoop/c_input/Customers.csv' USING PigStorage(',') AS (ID: int, Name: chararray, Age: int, CountryCode: int, Salary: float);

-- Load the Transactions.csv file
B = LOAD '/user/hadoop/t_input/Transactions.csv' USING PigStorage(',') AS (TransID: int, CustID: int, TransTotal: float, TransNumItems: int, TransDesc: chararray);

-- Join Customers and Transactions
C = JOIN A BY ID, B BY CustID;

-- Group by CountryCode
D = GROUP C BY CountryCode;

-- Aggregation

E = FOREACH D GENERATE group, COUNT(C.ID), MIN(C.TransTotal),MAX(C.TransTotal);

-- Output the result
STORE E INTO '/Project2/Q3_output' USING PigStorage(',');
