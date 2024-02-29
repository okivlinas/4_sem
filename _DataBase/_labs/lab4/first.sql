--task1--
select AUDITORIUM.AUDITORIUM_NAME, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM_TYPE inner join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE;

--task2--
select AUDITORIUM.AUDITORIUM_NAME, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM_TYPE inner join AUDITORIUM
on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE and  AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%Компьютер%';

--task3--
select FACULTY.FACULTY as Факультет, PULPIT.PULPIT as Кафедра, PROFESSION.PROFESSION as Специальность, SUBJECT.SUBJECT as Дисциплина,STUDENT.NAME as Студент,
	case 
		when PROGRESS.NOTE=6 then 'шесть'	
		when PROGRESS.NOTE=7 then 'семь'
		when PROGRESS.NOTE=8 then 'восемь'
		else 'другая'
	end as Оценки
from STUDENT 
inner join PROGRESS
on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
inner join GROUPS
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
inner join PROFESSION
on FACULTY.FACULTY = PROFESSION.FACULTY
inner join SUBJECT
on PULPIT.PULPIT = SUBJECT.PULPIT
where PROGRESS.NOTE between 6 and 8
order by PROGRESS.NOTE desc;

--task4--
select PULPIT.PULPIT as Кафедра, isnull(TEACHER.TEACHER_NAME, '***') as Преподаватель
from PULPIT left outer join TEACHER
on PULPIT.PULPIT = TEACHER.PULPIT
order by PULPIT.PULPIT;

--task5--
create table tableA(
	ID int,
	IDValue nvarchar(20)
);
insert into tableA(ID, IDValue)
values (1, 'A'), (2, 'B'), (3, 'C');

create table tableB(
	ID int,
	IDValue nvarchar(20)
);
insert into tableB(ID, IDValue)
values (2, 'X'), (3, 'Y'), (4, 'Z');

select *
from tableA full outer join tableB
on tableA.ID = tableB.ID;

select tableA.*
from tableA full outer join tableB
on tableA.ID = tableB.ID
where tableB.ID is null;

select tableB.*
from tableA full outer join tableB
on tableA.ID = tableB.ID
where tableA.ID is null;

select *
from tableA full outer join tableB
on tableA.ID = tableB.ID
where tableA.ID is not null and tableB.ID is not null;

--task6--
select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE
from AUDITORIUM_TYPE cross join AUDITORIUM
where AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE;
