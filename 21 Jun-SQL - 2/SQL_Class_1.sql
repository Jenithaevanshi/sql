/*
RDBMS Applications:
RDBMS (Relational DataBase Management System)
MS SQL Server
MySQL (for upGrad)
Oracle
PostGreSQL
MsAccess
TerraData
DB2
SQLite
etc

Note: To interact all the above application we need of SQL.

SQL : Structured Query Language

SQL is not case-sensitive query language.
*/

/* Types of SQL Queries: 
1. Data Definition Language (DDL)
Create, Drop, Alter, Truncate, Rename etc

2. Data Manipulation Language (DML)
Insert, Update, Delete

3. Data Control Language (DCL)
Grant, Revoke

4. Transaction Control Language (TCL)
Commit, Rollback, Savepoints

5. Data Query Language
Select
*/

-- What is the DataBase?
-- What is the table?
-- What is the field :   Columns of a table
-- What is the records : Rows of a table
-- ----------------------------------------------------------------------
Use Learning

Select * from EmployeeDB -- * means I want to extract all the cols from a table

Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB

Select Top 5 * from EmployeeDB -- This will work only MS-SQL not in MySQL

Select * from EmployeeDB Limit 5 -- This is for MySQL

-- Order by Clause
/* Using this clause we can sort the data either in asc or desc order,
by DEFAULT order by clause sort the data in asc order
*/
Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB
Order by Sales asc

Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB
Order by Sales desc, FirstName Asc


Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB
Order by YearlyIncome desc, FirstName Asc

-- Can you filter Top 5 Employee Based on the Sales
Select Top 5 * from EmployeeDB Order by Sales Desc


-- How we can filter the data based on specific conditions
/* Where Clause
Using this clause we can filter the data based on certain condition, this clause
just filter the normal rows from the table. In the where clause we can use the logical operator,
some clause like `between`, `in` etc
*/

-- Filter the Sales between 4000 and 5000
Select * from EmployeeDb 
Where Sales >= 4000 and Sales <= 5000
Order by Sales

-- Can you filter the brade A, D and where sales >= 3500
Select * from EmployeeDB
Where Grade = 'A' and Grade = 'B' -- In valid logical operator

Select * from EmployeeDB
Where (Grade = 'A' or Grade = 'B') and Sales >= 3500
Order by FirstName Desc

-- I want to filter the Sales 3013 and 523
Select * from EmployeeDb where Sales = 3013 or Sales = 523

-- How to Import the csv into mySQL workbench
-- Create a Database

Create Database Learning

Use Learning

Select * from Employeedb where Sales > 3500

-- I want all the records except above query's records

Select * from Employeedb where  not Sales > 3500

Select * from EmployeeDb
 where (Occupation = 'Management'
or Occupation = 'Clerical' or Occupation = 'Professional')
And (Grade = 'A' or Grade = 'D')

Select * from EmployeeDB 
where Occupation In ('Management','Clerical','Professional')
And Grade In ('A','B')


Select * from EmployeeDB 
where Occupation In ('Management','Clerical','Professional')
And Grade not In ('A','B')

-- How many of you are aware about Wild Card in MS Excel?
-- In Excel : There are two wild cards : 
1. * : which represent a series of chars => In My SQL inplace of * we have %
2. ? : Which represent a single char => In MySQL inplace of ? we have _

In Excel : I got this : ??E*n
Now, how to write in mysql : __E%n
In Excel : * H* => in mysql : % H%























