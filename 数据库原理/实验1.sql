CREATE DATABASE student
ON PRIMARY
(NAME='stu_1',
FILENAME='D:\database_learning\stu_1.mdf',
SIZE=10MB,
MAXSIZE=100MB,
FILEGROWTH=5%)
LOG ON
(NAME='stu_1_log',
FILENAME='D:\database_learning\stu_1_log.ldf',
SIZE=1MB,
MAXSIZE=30MB,
FILEGROWTH=1MB)
GO
ALTER DATABASE student
ADD FILE
(
	NAME=stu_2,
	FILENAME='D:\database_learning\stu_2.ndf',
	SIZE=5MB,
	MAXSIZE=50MB,
	FILEGROWTH=5MB
)
GO
ALTER DATABASE student
MODIFY FILE
(
	NAME=stu_1_log,
	MAXSIZE=50MB,
	FILEGROWTH=3MB
)
GO
DROP DATABASE student
GO

create database student
use student 
create table S
(sno varchar(10) primary key not null,
sname varchar(10) not null,
sex varchar(2) null check (sex in ('ÄÐ','Å®')),
age int null check(age>5),
sdept varchar(10) null,
)

create table C
(cno varchar(6) primary key not null,
cname varchar(20) not null,
pcno varchar(6) null,
credit int null default 4,
)
create table SC
(cno varchar(6) not null,
sno varchar(10) not null,
grade int null check (grade between 0 and 100),
primary key (cno,sno)
)

ALTER TABLE dbo.SC
   ADD CONSTRAINT FK_SC FOREIGN KEY (sno)
      REFERENCES dbo.S (sno)
      ON DELETE CASCADE
      ON UPDATE CASCADE