system mysql -u root -p

create user if not exists user1 identified by 'pwd1';
create user if not exists user2 identified by 'pwd2';

drop user user2;

-- change the password of user1

alter user user1 identified by 'PWD1';
alter user if exists user1 identified by 'PWD1' password expire interval 120 day;

--  create 4 roles as role1,role2,role3,role4
create role role1;
create role role2;
create role role3;
create role role4;

-- remove role4;
drop role role4;

-- show all users 
select user from mysql.user;

-- show current user
select current_user();

