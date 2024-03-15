---1---
select З.Нименование_товара,
	   max(З.Количество) [max],
	   min(З.Количество) [min],
	   avg(З.Количество) [avg],
	   count(*) [count],
	   sum(З.Количество) [sum]
from ЗАКАЗЫ З
inner join ТОВАРЫ Т
on Т.Наименование = З.Нименование_товара
group by З.Нименование_товара

---3---
select *
from(select case 
		when з.Количество between 1 and 10 then '1..10'
		when з.Количество between 11 and 50 then '11..50'
		when з.Количество between 51 and 100 then '51..100'
		else '101..'
		end [Пределы_кол-ва], 
		count(*)[Кол-во]
	  from ЗАКАЗЫ з
	  group by case
		when з.Количество between 1 and 10 then '1..10'
		when з.Количество between 11 and 50 then '11..50'
		when з.Количество between 51 and 100 then '51..100'
		else '101..'
		end) as T
order by case [Пределы_кол-ва]
	when '1..10' then 1
	when '11..50' then 2
	when '51..100' then 3
	else 4
end

---4---
select z.Нименование_товара,
	   r.[Наименование фирмы],
	   round(avg(cast(z.Количество as float(4))), 2) as [Ср_кол-во]
from ТОВАРЫ t inner join ЗАКАЗЫ z
on t.Наименование = z.Нименование_товара
inner join ЗАКАЗЧИКИ r
on z.Заказчик = r.[Наименование фирмы]
group by z.Нименование_товара, r.[Наименование фирмы]
order by [Ср_кол-во] desc

---5---
select z.Нименование_товара,
	   r.[Наименование фирмы],
	   round(avg(cast(z.Количество as float(4))), 2) as [Ср_кол-во]
from ТОВАРЫ t inner join ЗАКАЗЫ z
on t.Наименование = z.Нименование_товара
inner join ЗАКАЗЧИКИ r
on z.Заказчик = r.[Наименование фирмы]
where z.Нименование_товара like 'помидоры' or z.Нименование_товара like 'огурцы'
group by z.Нименование_товара, r.[Наименование фирмы]
order by [Ср_кол-во] desc
---6---
select z.Нименование_товара,
	   r.[Наименование фирмы],
	   avg(z.Количество) as [Ср_кол-во]
from ТОВАРЫ t inner join ЗАКАЗЫ z
on t.Наименование = z.Нименование_товара
inner join ЗАКАЗЧИКИ r
on z.Заказчик = r.[Наименование фирмы]
where r.[Наименование фирмы] like 'РаботаТУТ'
group by z.Нименование_товара, r.[Наименование фирмы]

---7---
select z.Нименование_товара, 
	   count(z.Количество) as [50_and_100]
from ЗАКАЗЫ z
group by z.Нименование_товара, z.Количество
having z.Количество between 50 and 100;
