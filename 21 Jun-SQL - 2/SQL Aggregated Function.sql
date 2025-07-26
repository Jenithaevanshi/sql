-- SQL Aggregated Functions
-- Sum, Max, Min, Count, Avg etc
use learning;
select * from employeedb
Select sum(Sales) as TotalSales from EmployeeDB; -- 57453

Select sum(Sales) as TotalSales,
Avg(Sales) as AvgSales,
max(Sales) as MaxSales,
min(Sales) as MinSales, Count(*) as TotalRec
 from EmployeeDB; -- 57453, 2872.6500, 4944,100,20

Select * From EmployeeDB;

-- How we can find out Grade wise Total and Average Sales
Select Grade, Sum(Sales) as TotalSales, 
Round(avg(Sales),2) as AvgSales From EmployeeDB
Group by Grade;

Select * From Superstore;

-- Can you give me Region, Category Wise TotalSales and TotalQuantity with Profit
Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
Group by Region, Category

-- How we can filter the above query result based on TotalQuantity
-- Can you filter where the quantity is greater than 3000

Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
Group by Region, Category

Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
where totalQty>3000 -- invalid query because it has aggregated columns so use having filter clause
Group by Region, Category

-- Having clause
/*Im mysql having clause filtered aggregated and non aggregated columns 
more specically having cluase designed to filter the aggregated result.*/

Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
Group by Region, Category
having totalQty>3000;

Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
Group by Region, Category
having totalQty between 2000 and 7000 and region like '%a%';--having cluase filtered aggregated and on aggregated columns

Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
Group by Region, Category
having sum(Quantity) between 2000 and 7000 and region like '%a%';-- sum(quantity) or its alias name we use no performance difference between the two methods

/*
note:
In MS-SQL having cluase can filtered the either
aggregated result or group by result,but having clause will not work when we are going to 
filter non aggregated column like in mysql*
mssql not understand the alias name in the having cluase but for my sql its wotking so better give the sum(quantity) istead alias name,*/

select region,category,sales from superstore
having region ='West'; -- is valid in mysql it is not valid in mssql (having cluase either having aggregated column or group by then it works)

where clause vs having clause
where clause can filter only the normal rows in the table. where clauise cannot filtered aggregated column

having clause can filtered the aggregated and non aggregated column result
where cluase is much faster than having clause

Select Region, Category, Round(Sum(Sales),2) as TotalSales, Sum(Quantity) as TotalQty,
Round(Sum(Profit),2) as Profit From Superstore
where region!= 'Central'
Group by Region, Category
having sum(Quantity) between 2000 and 7000 and region like '%a%';-- where clause can use with group by ,order by and having clause

Select Category,segment, Sum(Quantity) as Qty From Superstore
where segment!= 'Corporate'
Group by Category,segment;-- fast

Select Category,segment, Sum(Quantity) as Qty From Superstore
Group by Category,segment
having segment!= 'Corporate';-- both the query the same result but having is slower where is faster

-- filtered the aggregated column with the help of where cluase sub query (another way)

(
select category,segment ,sum(quantity) as qty from superstore
group by category, segment
)   -- this will give one table consist of these data's. given new table name and indirectly query the tablw using where cluase

select * from 
(
select category,segment ,sum(quantity) as qty from superstore
group by category, segment
) AS upgrad -- (or any table name you want)   -- select *from upgrad (upgrad as the above query indirectly because it has aggregated column)
where qty >4000

-- sql data types and its operators
/* for string:  we have 2 data types 
1. non unicode data type
2. unicode data type

1. non unicode data type:
 -char => char is used for fixed length of the data . eg zipcode ,PAN, UID  etc
 -varchar => It is used for variable length of data. eg. employeename,address,city etc
 -varchar(max) => variable length with 2 GB size
 note: 1 byte one char and non unicode data type can store only in english language.
 
 2. unicode data type(which supports all language inclding english as well)
 -nchar => fixed length of the data
 -nvarchar => It is used for variable length of data upto 4000char you can store
 -nvarchar(max) =>  variable length with 2 GB size
 note : 2 byte for one char
 
 --char,varchar,varchar(max),int,float,decimal,time,date,text etc
 --sql operator : IN,between, and, or ,not,like,+,-,*,/ etc
 
 In clause: we can filter multiple criteria from a single column or mutiple column if needed.*/
 
 select region,category,state,sales,profit from superstore
 where state in ('florida','Texas','california','utah','newyork','ohio');
 
 -- i want to exclude all the above state
 
  select region,category,state,sales,profit from superstore
 where state not in ('florida','Texas','california','utah','newyork','ohio');

-- between clause : filter the data in specific range
 select region,category,state,sales,profit from superstore
 where sales between 15,552 and 19.46
 order by sales;

select sales,sales/2 as half sales from superstore; -- double the sales we use *  instead

-- hypothetical query
select employees who are full time and earn more than 60K  rs or are part time and earns less than 30k rs

select * from employees
where (shift_type ='Full_time' and salary> 60000) or (shift_type ='Part_time' and salary <30000);

-- how to create the table and insert the data
create table employee_details(   -- it is created inside the learning schema
employee_id int,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
date_of_joining datetime,
salary decimal(10,2),
bonus_percent float);

drop table employee_details;

select * from employee_details;
insert into employee_details (employee_id,first_name,last_name,date_of_birth,date_of_joining,salary,bonus_percent)values
(1,'Ram','kumar','1994-07-07','2025-08-13 09:00:00',50000.00,5.70),
(2,'sam','dany','1993-08-09','2022-06-15 07:00:00',90000.00,3.70),
(3,'Ravi','ragu','1996-01-09','2025-08-13 09:00:00',50000.00,5.70);

-- concatenate the first name and last name
select concat(first_name,' ',last_name) as full_name from employee_details;

-- calc the age of the each employee
select first_name,last_name,
floor(datediff(current_date,date_of_birth)/365) as Age from employee_details;

-- find out how many years each employees has been with the company 
select first_name,last_name,
floor(datediff(current_date,date_of_joining)/365) as year_with_the_company from employee_details;

-- In class assignment query
/*question: calc the avg scores of each department where the avg score is greater than 70, sort the
records based on department_id*/

select department_id, avg(scores) as avg_score from table_name
group by department_id
having avg(score) > 70
order by department_id;

/*question: count the number of courses taught in each classroom and orders the result first by 
the numberof course in the descending order then by classroom_id */
select classroom_id, count(courses) as course_count from table_name
group by classroom_id
order by course_count desc ,classroom_id;

-- how to add the brand new column in the existing table
select * from employee_details;
alter table employee_details add column Grade char(1);

--how to drop the column from the table
alter table employee_details drop column last_name;
alter table employee_details add column last_name;
-- how to update the recod
update employee_details set Grade = 'A' where employee_id = 2;

-- delete vs drop vs truncate
-- delete : removes specific rows from the table  or whole table  and it is a DML statement which can be rollback if needed
delete from employee_details where Grade ='A'; -- delete the value A from grade
delete from employee_details; -- it deletes all the rows. except header.

-- truncate
-- removes all data quickly without using any condition keeping table structure it is DDL statement can not be rollback
truncate employee_details;
insert into employee_details (employee_id,first_name,last_name,date_of_birth,date_of_joining,salary,bonus_percent)values
(1,'Ram','kumar','1994-07-07','2025-08-13 09:00:00',50000.00,5.70),
(2,'sam','dany','1993-08-09','2022-06-15 07:00:00',90000.00,3.70),
(3,'Ravi','ragu','1996-01-09','2025-08-13 09:00:00',50000.00,5.70);

-- drop
drop remove the entire database object(tables,databases etc) ID is also DDL statement which cannot be rollback.
drop table employee_details;
/*
Aspect	          Delete	                  Truncate	Drop
What's Removed   Specific Rows and All Rows	  All Rows	Entire object
Table Structure	 Kept	                      Kept	     Removed
Where Clause	 yes	                          No	     No
Speed	         Slow	                      Fast	    Very Fast
Rollback	     yes	                     Limited	no
Triggers	     Fires	                         No	     No

*/

