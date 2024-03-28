use UNIVER;

---task1---
create view [�������������]
	as select TEACHER [���],
			  TEACHER_NAME [���_�������������],
			  GENDER [���],
			  PULPIT [���_�������]
			  from TEACHER;

select * from �������������;

drop view �������������;

---task2---
create view [����������_������]
	as select FACULTY.FACULTY_NAME [���������], count(PULPIT) [���������� ������]
	from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY
		group by FACULTY_NAME;

select * from ����������_������;

drop view ����������_������;

---task3---
create view [���������]
	as select AUDITORIUM [���], AUDITORIUM_TYPE [������������_���������]
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%';

select * from ���������;

drop view ���������;

---task4---
create view [����������_���������]
	as select AUDITORIUM [���], AUDITORIUM_TYPE [������������_���������]
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%' with check option;

insert ����������_��������� values('131-8', '��-�');

select * from ����������_���������;

drop view ����������_���������;

---task5---
create view [����������]
	as select top 3 SUBJECT [���], SUBJECT_NAME [������������_����������], PULPIT [���_�������]
	from SUBJECT
	order by ���;

select * from ����������;

drop view ����������;

---task6---
create view [����������_������]
	as select FACULTY.FACULTY_NAME [���������], count(PULPIT) [���������� ������]
	from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY
		group by FACULTY_NAME;

alter view [����������_������] with schemabinding
	as select FACULTY.FACULTY_NAME [���������], count(PULPIT.PULPIT) [����������_������]
	from dbo.FACULTY inner join dbo.PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY 
	group by FACULTY_NAME;

select * from ����������_������;

drop view ����������_������;	
