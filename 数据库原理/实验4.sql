use stu
GO
/* 1 */
create or alter view Stu_CS1(sno,sname,sex,age,sdept) as select 
sno,sname,sex,age,sdept from S where sdept = '计算机'
GO
insert into S(sno,sname,sex,age,sdept) values ('S1','王芳','女','20','数学')
insert into S(sno,sname,sex,age,sdept) values ('S7','王大明','男','22','计算机')
select * from Stu_CS1
GO

/* 2 */
select * from SC
truncate table SC
insert into SC1
values ('C1','S1',80),('C1','S2',85),('C1','S3',90),('C1','S4',75),('C1','S5',70),('C1','S6',90),
('C2','S1',70),('C2','S2',NULL),('C2','S3',85),('C2','S5',60),('C2','S6',NULL),('C3','S1',85),
('C3','S3',95),('C3','S4',NULL),('C3','S5',80),('C3','S6',90),('C4','S1',90),('C4','S2',NULL),
('C4','S4',70),('C5','S1',70),('C5','S5',65),('C5','S6',NULL)

GO
create or alter view Stu_CS2(sno,sname,sex,age,sdept) as select 
sno,sname,sex,age,sdept from Stu_CS1 
where sno in (select sno from SC where cno = 'C2')
GO
select * from Stu_CS2
GO

/* 3 */
create or alter view Stu_CS3(sno,sname,sex,age,sdept) as 
select sno,sname,sex,age,sdept from Stu_CS2 
where sno in (select sno from SC where grade>=90)
GO
select * from Stu_CS3
GO
/* 4 */
create view s_grade(sno,scount,savg) as 
select sno,count(cno),avg(grade) from sc group by sno
GO
/* 5 */
select * from s_grade

/* 6 */
select * from s_grade where scount>(select scount from s_grade where sno ='s4')
GO
/* 7 */
create view student_computer(sno,sname,sex,age) as 
select sno,sname,sex,age from S where sdept = '计算机'
GO

/* 8 */
insert into student_computer values('S99','王敏','男',22)
select * from s

/* 9 */
delete from student_computer where sname = '王敏'
select * from student_computer
GO

/* 10 */
create view view1(cno,grade) as select cno,grade from sc where sno = 'S1'
GO
select * from view1
GO

/* 11 */
alter view view1(sno,cno,grade) as 
select sno,cno,grade from sc where sno = 'S1' or sno = 'S3'
GO

/* 12 */
update view1 set grade = 98 where sno = 's1' and cno = 'c1'
select * from view1
GO

/* 13 */
create view stu_等级 (sno,sname,cno,cname,grade) as 
select s.sno,s.sname,c.cno,c.cname,sc.grade from s inner join sc 
on s.sno = sc.sno inner join c on sc.cno = c.cno
GO
SELECT * FROM stu_等级

/* 14 */
create table SC1
(cno varchar(6) not null,
sno varchar(10) not null,
grade int null check (grade between 0 and 100),
primary key (cno,sno)
)
create unique clustered index IDX_SNO_CNO on [SC1](sno asc,cno desc)

/* 15 */
create index IDX_S on s(sdept) 

/* 16 */
create index IDX_SDEPT_AGE on [s](sdept asc,age desc)

/* 17 */
drop index S.IDX_SDEPT_AGE