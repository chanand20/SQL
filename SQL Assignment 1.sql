create database assignment;
use assignment;
#Create a student table with the student id, name, and marks as
#attributes where the student id is the primary key.
create table student(id int(10) auto_increment,name text(10),marks int(10),constraint primary key(id));
#2. Insert the details of a new student in the above table
insert into student values(101,'vamsi',100),(102,'praveen',99),(103,'chandu',98),(104,'kasi',97),(105,'vinay',96),(106,'mani',95);
select*from student;
insert into student values(107,'reyaz',94);
select*from student;
#3. Delete the detail of a student in the above table.
truncate table student;
select*from student;
#4. Insert more records to the above student table more than 7.
insert into student values(101,'vamsi',100),(102,'praveen',99),(107,'reyaz',94),(103,'chandu',98),(104,'kasi',97),(105,'vinay',96),(106,'mani',95);
select*from student;
#Use the select command to get the details of the students with marks more than 80.
select * from student where marks>90;
#Find the min, max, sum, and average of the marks in a student marks table.
select min(marks) from student; # min
select max(marks) from student; # max
select sum(marks) from student; # sum
select avg(marks) from student; # avg
# Find the student names whose marks are greater than 60 and less than 40.
select name from student where marks between 40 and 60;
#Write a SQL query to order the (student ID, marks) table in descending order of the marks
select id,marks from student order by marks desc;
select marks,marks%3,power(marks,2) from student; 
/*Write a SQL query to display names into capital letters, small letters,
display first 3 letters of name, display last 3 letters of name, display
the position the letter A in name*/
select upper(name) from student;
select lower(name) from student;
select left(name,3) from student;
select right(name,3) from student;
select position('a' in name),name from student;
/*Remove extra spaces from left, right and both sides from the text – ”
Innomatics Research Lab “.*/
select ltrim("  Innomatics Research Lab  ");
select rtrim("  Innomatics Research Lab  ");
select trim("  Innomatics Research Lab  ");
#Display today’s date in “Date/Month/Year” format
select current_date();
/*Display dayname, monthname, day, dayname, day of month, day of year for
today’s date.*/
select dayname("2022-10-11");
select monthname("2022-10-11");
select dayofyear("2022-10-11");
select dayofmonth("2022-10-11");
select day("2022-10-11");
select year("2022-10-11");
select month("2022-10-11");
#difference between primary key and foriegn key
/*
PRIMARY KEY
1)Primary key is a column or combination of columns that uniquely defines 
a row in a table of a relational database.
2)Primary keys enforce entity integrity by uniquely identifying entity 
instances.
3)Primary key is unique key
4)Cannot be NULL
FOREIGN KEY
1)Foreign key is an attribute of table reference as Primary key in another
table.
2)Foreign keys enforce referential integrity by completing an association
 between two entities.
3)Foriegn key always refers to primary key
4)Can be NULL
*/
