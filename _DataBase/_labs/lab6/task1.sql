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

