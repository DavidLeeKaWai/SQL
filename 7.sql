use school
go

/*1单表*/
select Sno,Sname,Sage
from Student
where Ssex = '女' and (Sage between 19 and 21)
order by Sage asc

select Sno,Ssex
from Student
where Sname like'_明%'

select Sno,Cno
from SC
where  Cno = '1001' and Grade is null

select Sno,Sname
from Student
where Sdept in ('JSJ','SX','WL') and Sage > 25
order by Sdept,Sno asc

select Sno,Cno,(Grade-1)/10+1 as Grade_10
from SC

select distinct Sdept
from Student

select Cno,Grade
from SC
where Cno in ('1001','1002') and Sno = '0001'

/*2统计*/
select count(*)
from Student
where Sname like'%明%'

select avg(Sage)as avgage,max(Sage)as maxage
from Student
where Sdept = 'JSJ'

select count(*)
from Student
where Sname in ('张明','赵英')

select Cno,sum(Grade)as sumGrade,avg(Grade)as avgGrade,max(Grade)as maxGrade,min(Grade)as minGrade
from SC
group by Cno
order by  avgGrade

