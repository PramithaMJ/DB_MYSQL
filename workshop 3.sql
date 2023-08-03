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






