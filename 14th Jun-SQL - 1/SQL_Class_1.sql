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

-- What is the DataBase? collection of data
-- What is the table?  data consists of rows and columns
-- What is the field :   Columns of a table
-- What is the records : Rows of a table
-- ----------------------------------------------------------------------
Use Learning

Select * from EmployeeDB -- * means I want to extract all the cols from a table  --select-> used to retrieve data from a database

Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB

Select Top 5 * from EmployeeDB -- This will work only MS-SQL not in MySQL --> * is a wildcard character that select all character.

Select * from EmployeeDB Limit 5 -- This is for MySQL   #top 5 --> limit--> Pagination – LIMIT and OFFSET help in fetching data in chunks

-- Order by Clause
/* Using this clause we can sort the data either in asc or desc order,
by DEFAULT order by clause sort the data in asc order
*/-- SQL clause that sorts query results by specified columns
Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB
Order by Sales asc

Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB
Order by Sales desc, FirstName Asc


Select FirstName, Occupation, Sales, YearlyIncome from EmployeeDB
Order by YearlyIncome desc, FirstName Asc
use learning;

Positional Sorting (by column index)
sql
-- Sort by 2nd column (name), then 3rd (salary)
SELECT EmpId, firstName, Sales FROM EmployeeDB
ORDER BY 2, 3 asc;

-- Can you filter Top 5 Employee Based on the Sales
Select Top 5 * from EmployeeDB Order by Sales Desc
#using m sql
select * from EmployeeDB order by Sales Desc limit 5

-- How we can filter the data based on specific conditions
/* Where Clause
Using this clause we can filter the data based on certain condition, this clause
just filter the normal rows from the table. In the where clause we can use the logical operator,
some clause like `between`, `in` etc.. it is not filtered the aggregated columns
where-> and,or, not,between and ,in ,not in ,is not null, is null, like,<,>,<=,>=,!=,=
*/-- AND has higher precedence than OR

-- Filter the Sales between 4000 and 5000
Select * from EmployeeDb 
Where Sales >= 4000 and Sales <= 5000
Order by Sales

-- Can you filter the grade A, D and where sales >= 3500
Select * from EmployeeDB
Where Grade = 'A' and Grade = 'B' -- In valid logical operator

Select * from EmployeeDB
Where (Grade = 'A' or Grade = 'B') and Sales >= 3500
Order by FirstName Desc

-- I want to filter the Sales 3013 and 523
Select * from EmployeeDb where Sales = 3013 or Sales = 523

-- Wrong
SELECT Occupation, AVG(Sales)
FROM EmployeesDB
WHERE AVG(Sales) > 1000  -- Error # For Aggregation Filtering (Use HAVING instead)
GROUP BY occupation;

-- Correct
SELECT occupation, AVG(Sales)
FROM EmployeeDB
GROUP BY occupation
HAVING AVG(Sales) > 1000;

--';' semicolon -Recommended but optional for single statements,Required when executing multiple statements in my sql

-- How to Import the csv into mySQL workbench
-- Create a Database

Create Database Learning

Use Learning

Select * from Employeedb where Sales > 3500

-- I want all the records except above query's records

Select * from Employeedb where  not Sales > 3500  -- we can use 'not' or else use '<'

Select * from EmployeeDb
 where (Occupation = 'Management'
or Occupation = 'Clerical' or Occupation = 'Professional')
And (Grade = 'A' or Grade = 'D')  -- instead of mentioning multiple times the column name use 'in' operator.

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


Wildcard Description Example

%	    Matches any sequence of characters (0 or more)	            'John%' matches "John", "Johnny", "Johnson"
_	    Matches exactly one character	                            'J_n' matches "Jan", "Jon", "Jen"
[ ]	    Matches any single character within brackets (SQL Server)	'[JT]ohn' matches "John" or "Tohn"
[^ ]	Matches any single character NOT in brackets (SQL Server)	'[^A-C]at' matches "Dat" but not "Bat"(The first character is NOT A, B, or C)

--Like
The LIKE operator is used in SQL to search for specified patterns in text columns. It allows wildcard characters for flexible pattern matching.

use learning;
select * from EmployeeDB;
-- Basic Pattern Matching

-- Names starting with 'A'
SELECT * FROM EmployeeDB WHERE firstname LIKE 'A%';

-- Names ending with 'ley'
SELECT * FROM EmployeeDB WHERE firstname LIKE '%ley';

-- Names containing 'mon'
SELECT * FROM EmployeeDB WHERE firstname LIKE '%mon%';

2. Position-Specific Matching

-- 4-letter names starting with 'J'
SELECT * FROM employeeDB WHERE firstName LIKE 'J___';

-- Second letter is 'a'
SELECT * FROM EmployeeDB WHERE firstname LIKE '_a%';

3. Character Set Matching (SQL Server)
-- Names starting with A, B, or C
SELECT * FROM EmployeeDB WHERE firstName LIKE '[ABCabc]%'; -- most of the time it is not working use regular expression regexp

-- yearlyincome not starting with numbers
SELECT * FROM employeeDB WHERE yearlyincome LIKE '[^0-5]%';

---- Names starting with A, B, or C using regexp
SELECT * FROM EmployeeDB WHERE firstName REGEXP '^[ABCabc]';  -- instead of like use regexp put ^ outside the [] and removed %.
--MySQL: LIKE is case-insensitive by default for basic comparisons but case-sensitive for character ranges

SELECT * FROM EmployeeDB 
WHERE LEFT(firstName, 1) IN ('A', 'a', 'B', 'b', 'C', 'c');


-- yearlyincome starting with numbers
SELECT * FROM employeedb WHERE yearlyincome REGEXP '^[0-4]';

SELECT * FROM employeedb WHERE yearlyincome regexp '^[0-4]%'; --incorrect

-- yearly income not starting with numbers
SELECT * FROM employeedb 
WHERE yearlyincome REGEXP '^[^0-4]';  -- not starting means inside[^]



select * from employeeDB;
create table EmployeeDB
(
EmpID int primary key not null,  
FirstName varchar(50),
LastName varchar(30),	
Education varchar(30),
Occupation	varchar(30),
Grade varchar(10),
YearlyIncome int,
Sales int,
HireDate date,
DeptID int
);


insert into EmployeeDB 
values
(1870,'Annie','Jenkins','Bachelors','Management','A',35000,4650,'1899-12-30',9),
(9137,'Sandra','Hicks','Bachelors','Clerical','D',25000,4449,'1899-12-30',5),
(8843,'Benjamin','Willis','Master Degree','Professional','B',50000,4093,'1899-12-30',8),
(9939,'Abhisheak','Saraswat','Bachelors','Professional','A',45000,3805,'1899-12-30',6),
(6016,'Roger','Gomez','Intermediate','Clerical','C',55000,3750,'1899-12-30',6),
(3727,'Christopher','Oliver','High School','Management','B',50000,3307,'1899-12-30',4),
(9641,'Kimberly','Coleman','Intermediate','Professional','D',50000,3248,'1899-12-30',7),
(1171,'Judy','Sanchez','Master Degree','Professional','D',70000,3014,'1899-12-30',4),
(9974,'Shirley','Chavez','Intermediate','Clerical','C',90000,3013,'1899-12-30',4),
(4386,'Raymond','Young','Bachelors','Professional','A',90000,3000,'1899-12-30',1),
(7632,'Ruby','Matthews','Intermediate','Clerical','A',40000,3000,'1899-12-30',3),
(6905,'Lori','Shaw','Master Degree','Clerical','A',35000,3000,'1899-12-30',4),
(2281,'Pamela','Alexander','Bachelors','Professional','D',60000,2693,'1899-12-30',1),
(8938,'Kathryn','Fox','Education','Professional','A',35000,2399,'1899-12-30',5),
(8045,'Christina','Little','Master Degree','Human Resource','D',60000,2239,'1899-12-30',1),
(8592,'Gloria','Harper','High School','Clerical','A',40000,1383,'1899-12-30',2),
(5711,'Brian','Ryan','Bachelors','Clerical','A',40000,843,'1899-12-30',6),
(4481,'Harold','Hunter','High School','Professional','C',50000,523,'1899-12-30',3),
(4682,'Helen','Dean','High School','Management','B',75000,100,'1899-12-30',2),
(2220,'Walter','Kennedy','Education','Human Resource','A',60000,4944,'1899-12-30',6);

















