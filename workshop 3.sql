SELECT * FROM foe.employee;

ALTER TABLE EMPLOYEE
ADD Age int default 25;

ALTER TABLE EMPLOYEE
ADD Joined_date date default '2019-12-07';

ALTER TABLE EMPLOYEE
ADD Joined_time time default '00:00:00';

ALTER TABLE EMPLOYEE
ADD Married Boolean  default TRUE;

ALTER TABLE EMPLOYEE
ADD Security_code binary(6) default 010101;

ALTER TABLE EMPLOYEE
ADD Experience decimal(3,1) default 10.0;

alter table employee
add check (Age >0 and Age<60);

alter table employee
add check (Experience <50);

alter table employee
change Area Specialization varchar(20);

alter table employee
modify column Designation varchar(25);

alter table employee
drop primary key,
add unique(Empl_ID);

alter table employee
add constraint PK_Emp primary key (Empl_ID,Designation);

show create table employee;

alter table employee
drop column Experience;

-- DATABASE DATA MODIFICATION
-- 1) Delete all tuples which Dept_ID is not EIE.

delete from employee where Dept_ID != 'EIE';

-- Delete the tuple which Empl_ID is EE005.
delete from employee where Empl_ID ='EE005';

-- 2)Set the default constraint in column Joined_time to NULL.
alter table employee
alter Joined_time set default null;

show create table employee;

-- 03)Insert a new employee into table EMPLOYEE who has Empl_ID = CE008, Dept_ID = CEE and Designation= Lecturer. 
-- All other values must be either default or null.

INSERT INTO EMPLOYEE (Empl_ID,Dept_ID,Designation) values ('CE008','CEE','Lecturer');

-- 04)Update all other values as given.
INSERT INTO EMPLOYEE (Empl_ID,Dept_ID,Designation,Age,Joined_date,Joined_time,Married,Security_code) 
values ('EE005','EIE','Labourer',55,'2000-05-06','00:10:00',false,'010111');

update employee
set Age=27 where Empl_ID='EE001';

update employee
set Joined_date ='2017-12-18' where Empl_ID='EE001';

update employee
set Joined_time ='00:08:30' where Empl_ID='EE001';

update employee
set Security_code ='011100' where Empl_ID='EE001';

update employee
set Age=39 ,
Joined_date ='2012-01-07',
Joined_time ='00:11:30',
Security_code='110101'
where Empl_ID='EE002';

-- DATABASE DATA MODIFICATION

-- 01) Retrieve all tuples from the employee table
select *  from employee;

-- 02)Retrieve data of all attributes of Lecturers
select * from employee where Designation ='lecturer';

-- 03) Retrieve Empl_ID and Security_Code of employees whose age is greater than 25
select Empl_ID,Security_code from employee where (Age >25);

-- 4) Retrieve the Age, Joined_date of all married Employees in which the query result should be in descending order of Age?
select Empl_ID,Age,Joined_date from employee where Married=true order by Age DESC;

-- 5) Alias Head table as H and Employee table as E. Retrieve the result by Equi-joining (inner join) the two tables
Select * from Employee as E inner join 
Department as D on E.Dept_ID = D.Dept_ID;

-- 6) Retrieve the natural join between DEPARTMENT and EMPLOYEE table
select * from employee natural join department;

-- 7) Retrieve the Left outer join, right outer join between DEPARTMENT and EMPLOYEE table
select * from employee as  E left outer join department as D on E.Dept_ID=D.Dept_ID;
select * from employee as  E right outer join department as D on E.Dept_ID=D.Dept_ID;

-- 8) Retrieve the full outer join between HEAD and EMPLOYEE table
(select * from employee as  E left outer join department as D on E.Dept_ID=D.Dept_ID)
union
(select * from employee as  E right outer join department as D on E.Dept_ID=D.Dept_ID);

-- 9) Retrieve the cartesian product of two tables
select * from employee cross join department;

-- 10)Retrieve the Empl_ID as Employee_ID and corresponding Dept_Head as Department_Head who were recruited after 2017

select E.Empl_ID as Employee_ID,
D.Dept_Head as Department_Head
from employee as E
natural join Department As D
 where Joined_date>'2017-12-31';
 
-- 11) Retrieve different types (i.e. set) of designations in employee table
select distinct Designation from employee;
	

-- 12) Retrieve the Dept_ID, no. of Employees and average age of employees in that department?

select Dept_Id, avg(age),max(age), min(age), count(Dept_ID) as Empoyee_Count
from employee group by Dept_ID;


-- 13) Retrieve the Dept_ID renamed to Department_ID, no. of Employees as Employee_number and 
--     Maximum age as Age_Max of employees in that department in which no. of Employees are greater than 2
 	
select Dept_Id, avg(age),max(age), min(age), count(Dept_ID) as Empoyee_Count
from employee group by Dept_ID having Empoyee_Count>2;
    
-- 14) Retrieve the Empl_ID of all teachers who joined in period 2010 to 2019 in a month October,
--     November or December

select Empl_ID,Joined_date from employee 
where Joined_date like '201_-1_-__';

select Empl_ID,Designation from employee 
where Designation like '%Lecturer';

-- 15) Retrieve the age of Employees, age after 10 years as AGE10 whose age is in set (27,39,55)?

select Age, Age+10 as AGE10 from employee 
where Age in (27, 39, 55);

-- 16) Retrieve the ages of employees who have no/unknown specialization?

select Age from employee where Specialization is null;



