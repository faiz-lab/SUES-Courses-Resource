USE stu
/* 1 */
GO
CREATE PROCEDURE Pro_Com AS
SELECT * FROM S WHERE sdept='计算机'
GO

/* 2 */
EXECUTE Pro_Com

/* 3 */
DROP PROCEDURE Pro_Com
GO

/* 4 */
CREATE PROCEDURE Proc_grade_90 AS
SELECT * FROM S WHERE sno in (SELECT sno FROM SC WHERE grade>90)
EXECUTE Proc_grade_90
GO

/* 5 */
CREATE PROCEDURE Proc_Sname @sName char(20) AS 
SELECT S.sno, C.cname, SC.grade, S.sname FROM S, SC, C WHERE s.sno = sc.sno and sc.cno = c.cno and sname=@sName  
EXECUTE Proc_Sname '曹操'
GO

/* 6 */
ALTER PROCEDURE Proc_Sname @sName char(20) AS 
SELECT S.sno, C.cname, SC.grade, S.sname FROM S, SC, C WHERE s.sno = sc.sno and sc.cno = c.cno and sname=@sName
EXECUTE Proc_Sname '宋江'

/* 7 */
EXECUTE sp_helptext Proc_Sname
GO

/* 8 */
CREATE or ALTER PROCEDURE Proc_Couse @cousename char(10) as
select s.sno,s.sname,sc.grade from s,sc,c where s.sno = sc.sno and sc.cno = c.cno and cname = @cousename

/* 9 */
EXECUTE Proc_Couse '操作系统'
GO

/* 10 */
create procedure proc_sno @sno char(10),@avg int output as
	declare @errorvalue int
	set @errorvalue = 0
	set @avg = (select avg(grade) as '平均分' from sc where sno = @sno)
	if(@@ERROR <> 0)
		set @errorvalue = @@ERROR
	return @errorvalue
GO

/* 11 */
declare @sno char(10),@returnvalue int,@avg int select @sno = '100004'
execute @returnvalue = proc_sno @sno,@avg output
print'本程序执行的结果：'
print'程序的返回值 = '+cast(@returnvalue as char)
print'100004的平均分为'+cast(@avg as char(2))+'分'
GO

/* 12 */
create trigger tri_insert_sc on sc after insert as 
if (select grade from inserted)>(select avg(grade) from sc)
begin
	print'不能插入，分数大于已有分数的平均分'
	rollback
end
go

/* 13 */
insert into SC values ('C4','100004',88)
GO

/* 14 */
alter trigger tri_insert_sc
on sc
after insert
as 
if (select grade from inserted)>100 or (select grade from inserted)<0
begin
	print'成绩值必须在0到100之间，不能插入'
	rollback
end
go

/* 15 */
create trigger tri_update_sc
on sc
for update
as 
	declare @old_grade real , @new_grade real
	if update(grade)
	begin
		select @old_grade = grade from deleted
		select @new_grade = grade from inserted
		if  @new_grade>(@old_grade*1.05) or @new_grade<(@old_grade*0.95)
			rollback transaction
	end

/* 16 */
update sc set grade = 90 where sno = 's2' and cno = 'c4'
GO
SELECT * FROM SC
GO

/* 17 */
create trigger tri_delete_sc
on sc
instead of delete
as 
if (select grade from deleted) >=60
	begin 
		print'不能删除大于等于60的记录'
		rollback transaction
	end

/* 18 */
delete from sc where sno = 's2' and cno = 'c4'
GO

/* 19 */
CREATE OR ALTER trigger tri_update_sname
on s
for update
as 
	if update(sname)
	begin
		print '禁止更新sname'
		rollback transaction
	end

/* 20 */
update s set sname = '黎明' where sno = '100001'
INSERT INTO S VALUES(100001,'黎明','女',20,'数学')
GO

/* 21 */
disable trigger tri_update_sname on s
update s set sname = '黎明' where sno = '100001'
select * from s where sno = '100001'

/* 22 */
drop trigger tri_update_sname

