CREATE DATABASE FOE;
Use foe;

CREATE TABLE DEPARTMENT (
    Dept_ID varchar(45) NOT NULL,  
    Dept_Head varchar(255) NOT NULL,
    PRIMARY KEY (Dept_ID)
);

CREATE TABLE EMPLOYEE (
    Empl_ID VARCHAR(10) NOT NULL,
    Dept_ID VARCHAR(50),
    Area VARCHAR(50),
    Designation VARCHAR(50),
    PRIMARY KEY (Empl_ID)
);

INSERT INTO DEPARTMENT (Dept_ID,Dept_Head) values ('EIE','Menuka');
INSERT INTO DEPARTMENT values ('MME','Ranil');
INSERT INTO DEPARTMENT values ('CEE','Lasith');

INSERT INTO EMPLOYEE (Empl_ID,Dept_ID,Area,Designation) values ('EE001','EIE','Software','Lecturer');
INSERT INTO EMPLOYEE values ('EE002','EIE','Communication','Senior Lecturer');
INSERT INTO EMPLOYEE values ('MM007','MME','Automobile','Lecturer');
INSERT INTO EMPLOYEE values ('CEE001','CEE','null','Lab Attendent');
INSERT INTO EMPLOYEE values ('CE003','CEE','structural','Lecturer');
INSERT INTO EMPLOYEE values ('CE007','CEE','Environment','Lecturer');
INSERT INTO EMPLOYEE values ('EE005','EIE','null','Labourer');

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_DeptID
FOREIGN KEY(Dept_ID) REFERENCES DEPARTMENT (Dept_ID) ON DELETE SET null ON UPDATE cascade;

-- an example to show on update cascase
-- UPDATE DEPARTMENT SET Dept_ID = 'DEIE' WHERE Dept_Head = 'Menuka';

/*
CREATE TABLE EMPLOYEE (
Empl_ID int NOT NULL,  
Dept_ID varchar(50),
Area varchar(50),
Designation varchar(50),
PRIMARY KEY (Empl_ID),                
CONSTRAINT FK_EMP foreign key(Dept_ID) REFERENCES DEPARTMENT(Dept_ID)
);
*/

-- ALTER TABLE EMPLOYEE DROP FOREIGN KEY FK_DeptID;

show create table employee;

CREATE TABLE PROJECT(  
Employee_ID varchar(25) NOT NULL,      
Project varchar(15) NOT NULL,    
PRIMARY KEY (Project, Employee_ID));

-- Many: many relationship implementation
CREATE TABLE ProjEmpRelation(     
ProjID varchar(15) NOT NULL, 
EmplID varchar(25) NOT NULL,    
PRIMARY KEY (ProjID, EmplID),     
CONSTRAINT fk_emp FOREIGN KEY (ProjID) REFERENCES PROJECT(Project),     
CONSTRAINT fk_prj FOREIGN KEY (EmplID) REFERENCES EMPLOYEE(Empl_ID)
);