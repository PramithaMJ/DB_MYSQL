use foe;
show create table project;
insert into Project values('EE001','Prj_1');
insert into Project values('EE001','Prj_2');
insert into Project values('CE001','Prj_1');
insert into Project values('CE008','Prj_1');


DELETE FROM Project
WHERE employee_ID = 'CE001' AND Project = 'Prj_1';

-- 2.Retrieve the Employee ID, Joined date of Employees who are either doing project Prj_2 or have Layanthi as the department head?

(select E.Empl_ID, E.Joined_date from employee as E inner join Project as P
on E.Empl_ID = P.Employee_ID where P.project ='Prj_2')
union
(select E.Empl_ID, E.Joined_date from employee as E natural join department as D
where D.Dept_head='Lasith');

-- more ptimum wave to rn bove code

create view UV1 as select E.Empl_ID, E.Joined_date from employee as E inner join Project as P
on E.Empl_ID = P.Employee_ID where P.project ='Prj_2';
select * from UV1;

create view UV2 as select E.Empl_ID, E.Joined_date from employee as E natural join department as D
where D.Dept_head='Lasith';
select * from UV2;

(select * from UV1) union (select * from UV2);

-- 3. Retrieve the Employee ID, Joined time of Employees who are doing both project Prj_1 and have Meranda as the department head?

create view UV3 as 
select E.Empl_ID, E,Joined_time from employee as E inner join Project as P
on E.Empl_ID = P.Employee_ID where P.project ='Prj_1';
select * from UV3;

create view UV4 as 
select E.Empl_ID, E.Joined_time from employee as E natural join department as D
where D.Dept_head='Menuka';
select * from UV4;

-- (select * from UV3) intersect (select * from UV4); -- work in the after 8.0 version

select E.Empl_ID, E.Joined_time from employee as E natural join department as D
inner join Project as P
on E.Empl_ID = P.Employee_ID
where D.Dept_head ='Menuka' AND P.Project = 'Prj_1';


-- 4. Retrieve the Employee ID, Security code of Employees who are having Meranda as the department head but not doing Prj_1?
	/*
   (select E.Empl_ID, E.Security_code from employee as E natural join Department as D
   where D.Dept_head ='Menuka')
   except
   (select E.Empl_ID, E.Security_code from employee as E inner join Project as P
   on E.Empl_ID = P.Employee_ID where Project = 'Prj_1');
	*/


-- 1.Implement Dependent table and populate it. Create a view known as DEP_EMP by natural joining DEPENDENT & EMPLOYEE?

create table DEPENDENT(
Empl_ID varchar(25) not null,
Depe_name varchar(15) not null,
sex varchar(1) not null,
Primary key (Empl_ID,Depe_name),
constraint fk_dependent foreign key(Empl_ID) references Employee(Empl_ID));

insert into dependent values('EE001','Menuka','M');
insert into dependent values('EE001','Mcintyre','F');
insert into dependent values('EE002','Mark','F');
insert into dependent values('EE003','Supun','M');

select * from dependent;

create view DEP_EMP as select * from Emplyee natural join Depenent;
select * from DEP_EMP;


-- 2. Use a nested query to retrieve Employee ID of employees who are doing project Prj_1 and have male dependents?

select P.Employee_ID from Project as P where P.Project ='Prj_1'
AND P.Employee_ID in (
select D.Empl_ID from Dependent as D where sex='M');


-- 3.Use a nested query to retrieve Designation and Civil Status of all Employees whose age is greater than age of both employees with Empl_ID ‘CE008’, ‘EE001’?

select Empl_ID, Designation, Married from Employee 
where age> All(
select age from Employee where Empl_ID in ('EE001','CE008'));

-- 4.Retrieve the Head’s name of a department if that department has at least one employee  whose dependent’s name same as the department head’s name?

select Dept_head from Department where Dept_Head
in
(Select Depe_name from dependent);

-- 5. Create a trigger to make sure that when updating the age of an employee, the updated value must not exceed more than 1 year from the previous value? 


