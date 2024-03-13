use UNIVER;

---1---
select AUDITORIUM_TYPENAME, 
	max(AUDITORIUM_CAPACITY)[максимальна€_вместимость],
	min(AUDITORIUM_CAPACITY)[минимальна€_вместимость],
	avg(AUDITORIUM_CAPACITY)[средн€€_вместимость],
	sum(AUDITORIUM_CAPACITY)[обща€_вместимость],
	count(AUDITORIUM_CAPACITY)[количество_аудиторий]
	from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPENAME;

