use school
go

/*1����*/
--��ѯ student��ѯ������19��21��֮���Ů����ѧ��,����,����,������Ӵ�С���С�
select Sno,Sname,Sage
from Student
where Ssex = 'Ů' and (Sage between 19 and 21)
order by Sage asc

--��ѯ�����е�2����Ϊ�������ֵ�ѧ��ѧ�š��Ա�
select Sno,Ssex
from Student
where Sname like'_��%'

--��ѯ 1001�γ�û�гɼ���ѧ��ѧ�š��γ̺�
select Sno,Cno
from SC
where  Cno = '1001' and Grade is null

--��ѯJSJ ��SX��WL ϵ���������25���ѧ��ѧ��,�����������ϵ��ѧ������
select Sno,Sname
from Student
where Sdept in ('JSJ','SX','WL') and Sage > 25
order by Sdept,Sno asc

--��10���Ʋ�ѯѧ����sno,cno
select Sno,Cno,(Grade-1)/10+1 as Grade_10
from SC

--��ѯ student���е�ѧ�����ֲ����Ǽ���ϵ�С���distinct�� 
select distinct Sdept
from Student

--��ѯ0001��ѧ��1001��1002�γ̵ĳɼ���
select Cno,Grade
from SC
where Cno in ('1001','1002') and Sno = '0001'


/*----------------------------------*/
/*2ͳ��*/
--��ѯ�������С������ֵ�ѧ��������
select count(*)
from Student
where Sname like'%��%'

--���㡮JSJ��ϵ��ƽ�����估������䡣
select avg(Sage)as avgage,max(Sage)as maxage
from Student
where Sdept = 'JSJ'

--��ѯѧ��������Ϊ��������Ӣ������
select count(*)
from Student
where Sname in ('����','��Ӣ')

--����ÿһ�ſε��ܷ֡�ƽ���֣���߷֡���ͷ֣���ƽ�����ɸߵ�������
select Cno,sum(Grade)as sumGrade,avg(Grade)as avgGrade,max(Grade)as maxGrade,min(Grade)as minGrade
from SC
group by Cno
order by  avgGrade

--���� 1001,1002 �γ̵�ƽ���֡�
select Cno,avg(Grade)as avgGrade
from SC
where Cno in ('1001','1002')
group by Cno

--��ѯƽ���ִ���80�ֵ�ѧ��ѧ�ż�ƽ���� 
select Sno,avg(Grade)as avgGrade
from SC
group by Sno
having avg(Grade) > 80

--ͳ��ѡ�޿γ̳��� 2 �ŵ�ѧ��ѧ��
select Sno,
from SC
group by Sno
having count(Cno) > 2

--ͳ����10λ�ɼ�����85�����ϵĿγ̺š�
select Cno
from SC
where Grade > 85
group by Cno
having count(Sno) > 10

--ͳ��ƽ���ֲ������ѧ��ѧ��
select Sno
from SC
group by Sno
having avg(Grade) < 60

--ͳ���д������ſβ������ѧ��ѧ��
select Sno
from SC
where Grade < 60
group by Sno
having count(Grade) >2 