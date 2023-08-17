use foe;
show create table project;
insert into Project values('EE001','Prj_1');
insert into Project values('EE001','Prj_2');
insert into Project values('CE001','Prj_1');
insert into Project values('CE008','Prj_1');


DELETE FROM Project
WHERE employee_ID = 'CE001' AND Project = 'Prj_1';

-- 3. Retrieve the Employee ID, Joined time of Employees who are doing both project Prj_1 and have Meranda as the department head?
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
