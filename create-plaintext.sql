drop database if exists auth_database;
create database if not exists auth_database;
use auth_database;

drop table if exists users;
create table users(
username varchar(20) primary key,
password char(20) not null,
enabled tinyint(1) not null
)ENGINE=InnoDB default charset=latin1;

insert into users
values('John','{noop}1234',1), ('Susan','{noop}1234',1), ('Mary','{noop}1234',1);

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
