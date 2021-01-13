use stu

select * from S
select sno,sname,sex,age,sdept from S

/* 2 */
select sno,sname,sdept from S

/* 3 */
select distinct sno from SC

/* 4 */
select * from C
where cno in('c1','c3');

/* 5 */
select cno,cname from c 
where tname='刘明';

/* 6 */
select sno,sname from S
where sdept='数学' and age<20 and sex='男';

/* 7 */
select sno,cno from SC
where grade is null;
	
/* 8 */
select sname,2020-age as '出生年份'from S;

/* 9 */
select sno,sname,sex,age from S 
where sdept='计算机' and age between 20 and 30 and sex='男';

/* 10 */
select distinct sno from SC 
where cno is not null;

/* 11 */
select sno,sname from S 
where  age > 23 and sex='男';

/* 12 */
select sno,grade from SC 
where cno='c1'
order by grade desc;

/* 13 */
select sno,cno,grade from SC 
where grade is not null
order by cno asc,grade desc;

/* 14 */
select * from S 
where sname like '陈%' and sex='男';

/* 15 */
select * from C 
where cname like '%数据库%';

/* 16 */
select AVG(grade) as 'c1课程平均成绩' from SC
where cno='c1';

/* 17 */
select MAX(grade) as 'c4课程最高分数' from SC
where cno='c4';

/* 18 */
select sex as '性别',AVG(age) as '平均年龄',MAX(age) '最大年龄' ,'最小年龄' =MIN(age) from S
group by sex;

/* 19 */
select count(cno) as'选修c4的学生总人数' from SC
where cno='c4';

/* 20 */
select AVG(grade) as'选修c3的学生平均成绩' from SC
where cno='c3';

/* 21 */
select MAX(grade) as'选修c3的学生最高分数' from SC
where cno='c3';

/* 22 */
select count(distinct cno) as'有学生选修的课程门数' from SC;

/* 23 */
select cno,count(*) as'选课人数'from SC
group by cno
having count(*)>5;

/* 24 */
select cno,count(sno) as '选课人数' from SC
group by cno

/* 25 */
select sno , count(*) as'选课门数' from SC
group by sno
having count(*)>4;

/* 26 */
select cno,count(sno)as'选修人数' from SC
group by cno
having count(*)>10
order by 2 desc ,cno asc;

/* 27 */
select sno,SUM(grade)as '总成绩'from SC
where grade >= 60 
group by sno 
having count (*)>4
order by 2 desc

/* 28 */
select sno,count(cno)as'选课门数' from SC
group by sno 
having count (cno)>3

/* 29 */
select sc.sno,sc.cno,c.tname from C, SC
where sc.cno =c.cno and sno='s3' 

/* 30 求刘老师所授课程的每门课程的课号，学生平均成绩 */
select sc.cno,AVG(sc.grade) as'平均成绩' from SC
where sc.cno in (select c.cno from c where tname like '刘%')
group by sc.cno

/* 31 */
select s.sname as '学生姓名',c.cname '课程名','成绩'=sc.grade from C,S,SC
where s.sno=sc.sno and c.cno=sc.cno 

/* 32 */
select sc.sno,cname,tname from SC,C
where sc.sno='s3' and sc.cno=c.cno

/* 33 */
select distinct sname from S,SC,C
where s.sno=sc.sno and sc.cno=c.cno and sex='女' and tname='刘明'

/* 34 */
select s.sname as '姓名',c.cno as '课程号',grade as'成绩' from S,C,SC
where s.sno=sc.sno and c.cno=sc.cno

/* 35 */
select s.sno,sname from S,C,SC
where c.cname='数据库' and s.sno=sc.sno and c.cno=sc.cno

/* 36 */
select s.sno,sname,grade from S,C,SC
where c.cno='C1' and s.sno=sc.sno and c.cno=sc.cno

/* 37 */
select s.sno,sname from S,C,SC
where c.tname='吴一' and s.sno=sc.sno and c.cno=sc.cno and sex='女'

/* 38 */
select sname from S,C,SC
where c.cname='程序设计' and s.sno=sc.sno and c.cno=sc.cno and grade>=90

/* 39 */
select s.sno,sname,sdept,count(sc.cno) as '选课门数',AVG(grade)as'平均分' from S,C,SC
where s.sno=sc.sno and c.cno=sc.cno 
group by s.sno,sname,sdept
having count(sc.cno)>3

/* 40 */
select c.cname,AVG(grade)as'该课程平均成绩' from C,S,SC
where c.tname='刘明' and c.cno=sc.cno 
group by c.cname

/* 41 */
select AVG(age) as '选修c4课程学生的平均年龄' from S,SC
where sc.cno='c2'and s.sno=sc.sno

/* 42 */
select x.sname from s x,s y
where y.sname='王芳' and x.sno>y.sno and x.age<y.age

/* 43 */
select sname,age from S
where sex='男' and age>ALL(select age from s where sex='女')

/* 44 */
select * from S
where age >=all(select age from s)

/* 45 */
select sname,age from S
where age >(select AVG(age) from s where sex='女')and sex='男'

/* 46 */
select sname,age from S
where age >all(select age from s where sex='女')and sex='男'

/* 47 */
select sname,age,sex from S
where age <(select age from S where sname='王华')

/* 48 */
select sno from SC,C
where grade<(select AVG(grade) from SC,C where sc.cno=c.cno and c.cname='数学')and c.cname='数学'and sc.cno=c.cno

/* 49 */
select cno from C
where cno not in (select cno from sc,s where sname='李莉'and s.sno=sc.sno)

/* 50 */
select sname from S,SC
where sc.cno='C1' and sc.sno in (select sc.sno from sc where sc.cno='C2')and sc.sno=s.sno

/* 51 */
select sname from s,sc,c
where grade>=(select MAX(grade)from sc,c 
where cname='英语'and sc.cno=c.cno)and sc.sno=s.sno and c.cname='英语'and c.cno=sc.cno

/* 52 */
select sname from S
join sc on sc.sno=s.sno
join c on c.cno=sc.cno 
where sc.sno in (select sno from SC group by sno having count(sno)=1) and c.cno='C2'

/* 53 */
select * from S
where not exists (select * from c where not exists (select * from sc where sc.sno=s.sno and sc.cno=c.cno))

/* 54 */
select sc.sno,sname,sc.cno,grade from S,SC
where grade>80

/* 55 */
select cno,cname from C
where not exists (select * from s where not exists (select * from sc where sc.sno=s.sno and sc.cno=c.cno))

/* 56 */
select s.sno from C,S,SC
where c.tname='刘明' and c.cno=sc.cno and s.sno=sc.sno 
group by s.sno

/* 57 */
select sname from 
(
select sno,count(cno) as num from sc where cno in (
select cno from s join sc on s.sno=sc.sno and s.sno='s2'
)
group by sno
) t2
join (select count(cno) num from s join sc on s.sno=sc.sno and s.sno='s2') t1 on t2.num = t1.num
join s on s.sno=t2.sno

/* 58 */
insert into s(sno,sname,age)
values('S9','吴用','18')
delete from S where sname='吴用'
select * from S

/* 59 */
create table student 
( 
sno varchar(8) not null,
sname varchar(8) not null,
sex varchar(8) not null
)
insert into student
select sno,sname,sex from S
where sno not in (select sno from sc where grade<80)
SELECT * FROM student

/* 60 */
insert into c(cno,cname,credit,tname)
values('C12','文学欣赏','2',NULL)
SELECT * FROM C

/* 61 */
create table newTable 
( 
cno varchar(8) not null,
cname varchar(8) not null,
grade int
)
insert into newTable
select c.cno,c.cname,AVG(grade) from C,SC
where c.cno=sc.cno 
group by c.cno,c.cname
SELECT * FROM newTable

/* 62 */
delete from SC
where grade is null
SELECT * FROM SC

/* 63 */
delete from SC
where sno in (select sno from S where sname='王明')

/* 64 */
delete from SC
where sno='s1'
delete from s
where sno='s1'


/* 65 */
delete from sc
where cno='c1'and sno in (select sno from s where sex='男')

/* 66 */
delete from SC
where sno='s8'
delete from S
where sno='s8'
SELECT * FROM SC

/* 67 */
delete from sc
where sno in (select sno from s where sname='刘芳')
delete from s
where sname='刘芳'

/* 68 */
update s set age = '22' where sno='s4'

/* 69 */
update sc set grade = grade*(1+0.05) where cno='c3'

/* 70 */
update sc set grade = grade*(1+0.04) where sno in (select sno from s where sex='男')and cno in (select cno from c where cname='吴一')

/* 71 */
update sc set grade =NULL where grade <60 and cno in (select cno from c where cname='数据库') 

/* 72 */
update sc set grade = grade*(1+0.15) where sno in (select sno from s where sex='女') and grade<(select AVG(grade) from SC)
SELECT * FROM SC
/* 73 */
update sc set grade =grade*(1+0.04) where cno='c4' and grade >75;
update sc set grade = grade*(1+0.05) where cno='c4' and grade <=75
/* 74 */
update sc set grade=grade + 2 where cno in(select cno from c where cname='%英语%')
/* 75 */

