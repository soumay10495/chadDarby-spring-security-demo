drop database if exists auth_database;
create database if not exists auth_database;
use auth_database;

drop table if exists users;
create table users(
username varchar(20) primary key,
password char(68) not null,     # 8 + 60(password) = 68
enabled tinyint(1) not null
)ENGINE=InnoDB default charset=latin1;

insert into users
values('John','{bcrypt}$2a$10$3sJWk.cT/VXLQWzK4SbLSO5NhJeqeI/mR2XY1fWpO0skIwYTPiHVq',1),
        ('Susan','{bcrypt}$2a$10$3sJWk.cT/VXLQWzK4SbLSO5NhJeqeI/mR2XY1fWpO0skIwYTPiHVq',1),
         ('Mary','{bcrypt}$2a$10$3sJWk.cT/VXLQWzK4SbLSO5NhJeqeI/mR2XY1fWpO0skIwYTPiHVq',1);

#	noop - No operation ie. store password as plain-text
#	bcrypt - store password(60 chars) using one-way encrypted hashing (https://www.bcryptcalculator.com/)


drop table if exists authorities;
create table authorities(
username varchar(20) not null,
authority varchar(20) not null,
unique key (username, authority),
foreign key (username) references users(username)
)ENGINE=InnoDB default charset=latin1;

insert into authorities
values('John','ROLE_EMPLOYEE'),('Susan','ROLE_EMPLOYEE'),('Susan','ROLE_ADMIN'),
        ('Mary','ROLE_EMPLOYEE'),('Mary','ROLE_MANAGER');
