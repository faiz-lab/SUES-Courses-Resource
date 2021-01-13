create database stu
use stu
create table S
(sno varchar(6) primary key not null,
sname varchar(20) not null,
sex varchar(2) null,
age int null,
sdept varchar(20) null,
)
create table C
(cno varchar(8) primary key not null,
cname varchar(20) not null,
pcno varchar(8) null,
credit int default 4 null,
)
create table SC
(cno varchar(8) not null,
sno varchar(6) not null,
grade int null,
primary key (cno,sno)
)
alter table C drop column pcno 
alter table C add tname varchar(10) null
alter table S alter column sdept varchar(30) null
alter table S add constraint sex check(sex in ('男','女'))
alter table S add constraint df_age default 18 for age 
alter table SC add constraint SC1 foreign key(sno) references s(sno)
alter table SC add constraint SC2 foreign key(cno) references c(cno)
/*第12题和第6题一样*/
drop table S,SC,C

create table S
(sno varchar(6) primary key not null,
sname varchar(20) not null,
sex varchar(2) null check (sex in ('男','女')) default '男',
age int null default 18,
sdept varchar(30) null,
)
create table C
(cno varchar(8) primary key not null,
cname varchar(20) not null,
tname varchar(10) null,
credit int default 4 null,
)
create table SC 
(cno varchar(8) not null,
sno varchar(6) not null,
grade int null check (grade between 0 and 100),
primary key (cno,sno)
)

insert into S
values ('S1','王芳','女',20,'数学'),
	   ('S2','李莉','女',19,'计算机'),
	   ('S3','王华','男',22,'管理'),
	   ('S4','王明','男',19,'数学'),
	   ('S5','宋江','男',21,'管理'),
	   ('S6','曹操','男',18,'计算机')
insert into C
values ('C2','数学','刘明',4),
	   ('C4','李莉','程序设计',3),
	   ('C3','王华','数据库',4),
	   ('C1','王明','操作系统',4),
	   ('C5','宋江','C语言',4)

insert into SC
values ('C1','S1',80),('C1','S2',85),('C1','S3',90),('C1','S4',75),('C1','S5',70),('C1','S6',90),
	   ('C2','S1',70),('C2','S2',NULL),('C2','S3',85),('C2','S5',60),('C2','S6',NULL),('C3','S1',85),
	   ('C3','S3',95),('C3','S4',NULL),('C3','S5',80),('C3','S6',90),('C4','S1',90),('C4','S2',NULL),
	   ('C4','S4',70),('C5','S1',70),('C5','S5',65),('C5','S6',NULL)

select * from S
select * from C
select * from SC
