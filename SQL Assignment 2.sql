create database assignment2;
use assignment2;
create table employee(empid int primary key,empname varchar(100),
department varchar(50),contactno bigint, emaildid varchar(100), 
empheadid int);
insert into employee values(2,'parag','IT',1234567890,'abc@gmail.com',123),
(4,'Rahul','IT',1234567890,'abc@gmail.com',124),
(7,'Rohit','cse',9994567890,'def@gmail.com',125),
(9,'Ram','DS',7774567890,'123@gmail.com',126),
(10,'Renuka','DS',6664567890,'999@gmail.com',127);
insert into employee values(1,'kasi','IT',1234567890,'abc@gmail.com',122);
insert into employee values(3,'praveen','cse',1239667890,'abcm@yahoo.com',121);
insert into employee values(5,'vamsi','DS',1234567890,'abck@gmail.com',128);
insert into employee values(6,'mani','IT',1234567890,'abce@gmail.com',129);
insert into employee values(8,'chitu','cse',1232567890,'abcd@gmail.com',120);
select * from employee;
create table empdept(deptid varchar(50) primary key,deptname
varchar(100), dept_off varchar(100), depthead int);
alter table empdept
modify depthead text(10);
insert into empdept values('IT03','IT','Nampally','HYD'),
('IT02','IT','Manikonda','HYD'),
('DS01','DS','Kukatpally','HYD'),
('DS02','DS','RangaReddy','RR'),
('DS03','DS','Secundarabad','SEC');
insert into empdept values('IT04','IT','KPHB','HYD'),
('IT01','DS','JNTU','HYD'),
('DS06','IT','Nampally','HYD'),
('DS04','DS','JNTU','HYD'),
('DS05','IT','Manikonda','HYD');
select * from empdept;
create table empsalary(empid int(3) , salary bigint, 
ispermanent varchar(3),constraint fk foreign key(empid) 
references employee(empid));
insert into empsalary values(2,20000,'Yes'),
(4,40000,'no'),
(7,50000,'Yes'),
(9,60000,'no'),
(10,70000,'Yes');
insert into empsalary values
(11,10000,'Yes'),(13,10000,'Yes'),(12,30000,'Yes');
insert into empsalary values
(1,10000,'Yes'),
(3,30000,'no'),
(5,80000,'Yes'),
(6,90000,'no'),
(8,100000,'Yes');
select * from empsalary;
# Select the detail of the employee whose name start with P.(hint use like)
select * from employee where empname like('p%');
#How many permanent candidates earn more than 5000.
select count(*) from empsalary where salary>5000;
#Select the details of the employee whose emailId is in gmail.
select * from employee where emaildid regexp 'gmail';
#What is the total salary that is paid to permanent employees?
select sum(salary) from empsalary;
#List name of all employees whose name ends with a.
select * from employee where empname like('%a');
#Select the name of the employee head who is permanent.
select empname from employee 
join empsalary on employee.empid=empsalary.empid
where ispermanent='Yes';
#left join on above any 2 tables
select * from employee 
left join empsalary on employee.empid=empsalary.empid;
#right join on above any 2 tables
select * from employee 
right join empsalary on employee.empid=empsalary.empid;
#inner join on above any 2 tables
select * from employee 
inner join empsalary on employee.empid=empsalary.empid;
#cross join on above any 2 tables
select * from employee 
cross join empsalary on employee.empid=empsalary.empid;
/* since the data is unique in the empiid and no duplicate when we do 
left join we will get the whole employee table and the common sction between them ,
rjoin will give the entire table of empsalary and also the inner join vales,
cross join will give eniter 2 tables. */
#Update a value in the employee table. Hint(Set empname as Maria where empid is 10)
select * from employee;
update employee
set empname='Maria'
where empid=10;
select * from employee;

#Delete the entire row in employee table where empid is 10
set sql_safe_updates=0;
#select * from employee;
alter table empsalary
drop foreign key fk;
alter table employee
drop primary key;
delete from employee
where empid=10;
#Find the count of common salaries given to the employees
select count(salary), salary from empsalary
where salary group by salary;
# lists the number of employees and there common salary, sorted high to low
select count(empid),salary from empsalary
where salary group by salary
order by salary desc;
/* Explain about the JOINS.
INNER JOIN: returns rows when there is a match in both tables.

LEFT JOIN: returns all rows from the left table, even if there are no matches in the right table.

RIGHT JOIN: returns all rows from the right table, even if there are no matches in the left table.

cross JOIN: combines the results of both left and right outer joins.

The joined table will contain all records from both the tables and fill in NULLs for missing matches on either side.

SELF JOIN: joins a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
*/
/*
What are UNION, MINUS and INTERSECT commands?
UNION
The Union is a binary set operator in DBMS. It is used to combine the result set of two select queries.
 Thus, It combines two result sets into one. In other words, the result set obtained after union operation 
 is the collection of the result set of both the tables.
 
 SELECT (coloumn_names) from table1 [WHERE condition] UNION SELECT (coloumn_names) from table2 [WHERE condition];

Minus:- A Minus Query is a query that uses the MINUS operator in SQL to subtract one result set from another result set to
 evaluate the result set difference. If there is no difference, there is no remaining result set. If there is a difference, 
 the resulting rows will be displayed.
 
 SELECT (coloumn_names) from table1 [WHERE condition] MINUS SELECT (coloumn_names) from table2 [WHERE condition];

Intersect:- 
Intersect is a binary set operator in DBMS. The intersection operation between two 
selections returns only the common data sets or rows between them. It should be noted that the intersection 
operation always returns the distinct rows. The duplicate rows will not be returned by the intersect operator.

SELECT (coloumn_names) from table1[WHERE condition] INTERSECT SELECT (coloumn_names) from table2 [WHERE condition];
*/
/*
What are the differences between TRUNCATE, DELETE and DROP

DELETE :- The DELETE command deletes one or more existing records from the table in the database.
(DELETE FROM table_name WHERE condition;)
DROP :- The DROP Command drops the complete table from the database.
(DROP TABLE table_name;)
TRUNCATE :- The TRUNCATE Command deletes all the rows from the existing table, leaving the row with the column names.
(TRUNCATE TABLE table_name;)
*/

