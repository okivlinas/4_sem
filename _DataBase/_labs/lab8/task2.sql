use Kiv_MyBase;

---task1---
create view [заказики]
	as select ID_расхода [код_расхода],
			  Название_отдела [отдел],
			  ID_товара [код_товара],
			  Дата [дата]
			  from ЗАКАЗЫ;

select * from заказики;

drop view заказики;

---task2---
create view [количество_товаров]
	as select Название_отдела [отдел], count(Название_товара) [товары_количество]
	from ЗАКАЗЫ inner join ТОВАРЫ
		on ЗАКАЗЫ.ID_товара = ТОВАРЫ.ID_товара
		group by Название_отдела;

select * from количество_товаров;

drop view количество_товаров;

---task3---
create view [Товар]
	as select Название_отдела [отдел], ID_товара [код_товара]
	from ЗАКАЗЫ
	where ID_товара like '2%' with check option;

select * from Товар;

drop view Товар;

---task4---
create view [Товар_2]
	as select Название_отдела [отдел], ID_товара [код_товара]
	from ЗАКАЗЫ
	where ID_товара like '2%' with check option;

insert Товар_2 values('Отдел7', '2');

select * from Товар_2;

drop view Товар_2;

---task5---
create view [заказики_2]
	as select top 3 ID_расхода [код], Название_отдела [отдел], Дата [дата]
	from ЗАКАЗЫ
	order by отдел;

select * from заказики_2;

drop view заказики_2;

---task6---
create view [количество_товаров]
	as select Название_отдела [отдел], count(Название_товара) [товары_количество]
	from ЗАКАЗЫ inner join ТОВАРЫ
		on ЗАКАЗЫ.ID_товара = ТОВАРЫ.ID_товара
	group by Название_отдела;

alter view [количество_товаров] with schemabinding
	as select Название_отдела [Отдел], count(Название_товара) [Товары_количество]
	from dbo.ЗАКАЗЫ inner join dbo.ТОВАРЫ
		on ЗАКАЗЫ.ID_товара = ТОВАРЫ.ID_товара
	group by Название_отдела;

select * from количество_товаров;

drop view количество_товаров;	
