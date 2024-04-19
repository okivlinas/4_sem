use UNIVER;

---task1---
create view [Преподаватель]
	as select TEACHER [код],
			  TEACHER_NAME [имя_преподавателя],
			  GENDER [пол],
			  PULPIT [код_кафедры]
			  from TEACHER;

select * from Преподаватель;

drop view Преподаватель;

---task2---
create view [Количество_кафедр]
	as select FACULTY.FACULTY_NAME [факультет], count(PULPIT) [количество кафедр]
	from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY
		group by FACULTY_NAME;

select * from Количество_кафедр;

drop view Количество_кафедр;

---task3---
create view [Аудитории]
	as select AUDITORIUM [код], AUDITORIUM_TYPE [наименование_аудитории]
	from AUDITORIUM
	where AUDITORIUM_TYPE like 'ЛК%';

select * from Аудитории;

drop view Аудитории;

---task4---
create view [Лекционные_аудитории]
	as select AUDITORIUM [код], AUDITORIUM_TYPE [наименование_аудитории]
	from AUDITORIUM
	where AUDITORIUM_TYPE like 'ЛК%' with check option;

insert Лекционные_аудитории values('131-8', 'ЛК-К');

select * from Лекционные_аудитории;

drop view Лекционные_аудитории;

---task5---
create view [Дисциплины]
	as select top 3 SUBJECT [код], SUBJECT_NAME [наименование_дисциплины], PULPIT [код_кафедры]
	from SUBJECT
	order by код;

select * from Дисциплины;

drop view Дисциплины;

---task6---
create view [Количество_кафедр]
	as select FACULTY.FACULTY_NAME [факультет], count(PULPIT) [количество кафедр]
	from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY
		group by FACULTY_NAME;

alter view [Количество_кафедр] with schemabinding
	as select FACULTY.FACULTY_NAME [Факультет], count(PULPIT.PULPIT) [Количество_кафедр]
	from dbo.FACULTY inner join dbo.PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY 
	group by FACULTY_NAME;

select * from Количество_кафедр;

drop view Количество_кафедр;	
