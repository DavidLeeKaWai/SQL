use school
go

/*1单表*/
--查询 student查询年龄在19至21岁之间的女生的学号,姓名,年龄,按年龄从大到小排列。
select Sno,Sname,Sage
from Student
where Ssex = '女' and (Sage between 19 and 21)
order by Sage asc

--查询姓名中第2个字为“明”字的学生学号、性别。
select Sno,Ssex
from Student
where Sname like'_明%'

--查询 1001课程没有成绩的学生学号、课程号
select Sno,Cno
from SC
where  Cno = '1001' and Grade is null

--查询JSJ 、SX、WL 系的年龄大于25岁的学生学号,姓名，结果按系及学号排列
select Sno,Sname
from Student
where Sdept in ('JSJ','SX','WL') and Sage > 25
order by Sdept,Sno asc

--按10分制查询学生的sno,cno
select Sno,Cno,(Grade-1)/10+1 as Grade_10
from SC

--查询 student表中的学生共分布在那几个系中。（distinct） 
select distinct Sdept
from Student

--查询0001号学生1001，1002课程的成绩。
select Cno,Grade
from SC
where Cno in ('1001','1002') and Sno = '0001'


/*----------------------------------*/
/*2统计*/
--查询姓名中有“明”字的学生人数。
select count(*)
from Student
where Sname like'%明%'

--计算‘JSJ’系的平均年龄及最大年龄。
select avg(Sage)as avgage,max(Sage)as maxage
from Student
where Sdept = 'JSJ'

--查询学生中姓名为张明、赵英的人数
select count(*)
from Student
where Sname in ('张明','赵英')

--计算每一门课的总分、平均分，最高分、最低分，按平均分由高到低排列
select Cno,sum(Grade)as sumGrade,avg(Grade)as avgGrade,max(Grade)as maxGrade,min(Grade)as minGrade
from SC
group by Cno
order by  avgGrade

--计算 1001,1002 课程的平均分。
select Cno,avg(Grade)as avgGrade
from SC
where Cno in ('1001','1002')
group by Cno

--查询平均分大于80分的学生学号及平均分 
select Sno,avg(Grade)as avgGrade
from SC
group by Sno
having avg(Grade) > 80

--统计选修课程超过 2 门的学生学号
select Sno,
from SC
group by Sno
having count(Cno) > 2

--统计有10位成绩大于85分以上的课程号。
select Cno
from SC
where Grade > 85
group by Cno
having count(Sno) > 10

--统计平均分不及格的学生学号
select Sno
from SC
group by Sno
having avg(Grade) < 60

--统计有大于两门课不及格的学生学号
select Sno
from SC
where Grade < 60
group by Sno
having count(Grade) >2 