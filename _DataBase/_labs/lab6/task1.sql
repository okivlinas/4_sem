use UNIVER;

---1---
select AUDITORIUM_TYPENAME, 
	max(AUDITORIUM_CAPACITY)[������������_�����������],
	min(AUDITORIUM_CAPACITY)[�����������_�����������],
	avg(AUDITORIUM_CAPACITY)[�������_�����������],
	sum(AUDITORIUM_CAPACITY)[�����_�����������],
	count(AUDITORIUM_CAPACITY)[����������_���������]
	from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPENAME;

---3---
select *
from (select case 
		when PROGRESS.NOTE between 4 and 5 then '4-5'
		when PROGRESS.NOTE between 6 and 7 then '6-7'
		when PROGRESS.NOTE between 8 and 9 then '8-9'
		when PROGRESS.NOTE = 10 then '10'
		end [NOTE],
		count(*)[���-��]
		from PROGRESS
		group by case
			when PROGRESS.NOTE between 4 and 5 then '4-5'
			when PROGRESS.NOTE between 6 and 7 then '6-7'
			when PROGRESS.NOTE between 8 and 9 then '8-9'
			when PROGRESS.NOTE = 10 then '10'
			end
		) as T
order by case T.NOTE
	when '4-5' then 4
	when '6-7' then 3
	when '8-9' then 2
	when '10' then 1
	else 0
	end

---4---
select f.FACULTY,
	   g.PROFESSION,
	   g.IDGROUP,
	   round(avg(cast(p.NOTE as float(4))), 2) as [��_������]
from FACULTY f inner join GROUPS g
on f.FACULTY = g.FACULTY
inner join STUDENT s
on s.IDGROUP = g.IDGROUP
inner join PROGRESS p
on p.IDSTUDENT = s.IDSTUDENT
group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST, g.IDGROUP
order by [��_������] desc

---5---
select f.FACULTY,
	   g.PROFESSION,
	   g.IDGROUP,
	   p.SUBJECT,
	   round(avg(cast(p.NOTE as float(4))), 2) as [��_������]
from FACULTY f inner join GROUPS g
on f.FACULTY = g.FACULTY
inner join STUDENT s
on s.IDGROUP = g.IDGROUP
inner join PROGRESS p
on p.IDSTUDENT = s.IDSTUDENT
where p.SUBJECT like '��' or p.SUBJECT like '����'
group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST, p.SUBJECT, g.IDGROUP
order by [��_������] desc

---6---
select f.FACULTY,
	   g.PROFESSION,
	   p.SUBJECT,
	   avg(p.NOTE) as [��_������]
from FACULTY f
inner join GROUPS g
on f.FACULTY = g.FACULTY
inner join STUDENT s
on g.IDGROUP = s.IDGROUP
inner join PROGRESS p
on p.IDSTUDENT = s.IDSTUDENT
where f.FACULTY like '���'
group by f.FACULTY, g.PROFESSION, p.SUBJECT;

---7---
select p.[SUBJECT], 
	   count(p.NOTE) as [8_and_9]
from PROGRESS p
group by p.SUBJECT, p.NOTE
having p.NOTE in (8,9)
order by p.SUBJECT
