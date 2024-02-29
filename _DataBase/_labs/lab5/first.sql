use UNIVER;

--task1--
select PULPIT.PULPIT_NAME
from PULPIT, FACULTY
where FACULTY.FACULTY = PULPIT.FACULTY
and
FACULTY.FACULTY in (select PROFESSION.FACULTY
					from PROFESSION
					where PROFESSION.PROFESSION_NAME like '%технология%' or PROFESSION.PROFESSION_NAME like '%технологии%');

--task2--
select PULPIT.PULPIT_NAME
from PULPIT inner join FACULTY
on FACULTY.FACULTY = PULPIT.FACULTY
	where
	FACULTY.FACULTY in (select PROFESSION.FACULTY
						from PROFESSION
						where PROFESSION.PROFESSION_NAME like '%технология%' or PROFESSION.PROFESSION_NAME like '%технологии%');

--task3--
select PULPIT.PULPIT_NAME
from PULPIT inner join FACULTY
on FACULTY.FACULTY = PULPIT.FACULTY
inner join PROFESSION
on FACULTY.FACULTY = PROFESSION.FACULTY
where PROFESSION.PROFESSION_NAME like '%технология%' or PROFESSION.PROFESSION_NAME like '%технологии%';

--task4?--
select a.AUDITORIUM_TYPE, a.AUDITORIUM_NAME, a.AUDITORIUM_CAPACITY
from AUDITORIUM a
where AUDITORIUM_CAPACITY = (select top(1) aa.AUDITORIUM_CAPACITY
							 from AUDITORIUM aa
							 where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
							 order by aa.AUDITORIUM_CAPACITY desc)
order by a.AUDITORIUM_CAPACITY desc;

--task5--
select FACULTY.FACULTY
from FACULTY
where not exists (select PULPIT.FACULTY
				  from PULPIT
				  where FACULTY.FACULTY = PULPIT.FACULTY);

--task6--
select top 1
	(select avg(PROGRESS.NOTE) from PROGRESS
	 where PROGRESS.SUBJECT like 'ОАиП')[ОАиП],
	(select avg(PROGRESS.NOTE) from PROGRESS
	 where PROGRESS.SUBJECT like 'БД')[БД],
	(select avg(PROGRESS.NOTE) from PROGRESS
	 where PROGRESS.SUBJECT like 'СУБД')[СУБД]
from PROGRESS;

--task7?--
select p.IDSTUDENT, p.NOTE, p.SUBJECT
from PROGRESS p
where p.NOTE >= all(select PROGRESS.NOTE
						   from PROGRESS
						   where p.SUBJECT = PROGRESS.SUBJECT);

--task8--
select s.NAME, sub.SUBJECT_NAME, p.NOTE 
from
	(STUDENT s inner join PROGRESS p 
	 on s.IDSTUDENT = p.IDSTUDENT) 
	 inner join [SUBJECT] sub 
	 on sub.SUBJECT = p.SUBJECT 
	 where p.NOTE >= any (select p2.NOTE 
						  from PROGRESS p2 
						  where p2.NOTE >= 6) 
order by p.NOTE desc;

