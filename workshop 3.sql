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
modify column Designation varchar(25)














