use master;

create database Kiv_MyBase on primary
( name = N'Kiv_MyBase_mdf', filename = N'D:\Документы\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_mdf.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'Kiv_MyBase_ndf', filename = N'D:\Документы\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
( name = N'Kiv_MyBase_fg1_1', filename = N'D:\Документы\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'Kiv_MyBase_fg1_2', filename = N'D:\Документы\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'Kiv_MyBase_log', filename=N'D:\Документы\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)

use Kiv_MyBase
create table ОТДЕЛЫ
(
	Название_отдела nvarchar(20) primary key,
	Количество_сотрудников int
) on FG;
create table ТОВАРЫ
(
	ID_товара int primary key,
	Название_товара nvarchar(20),
	Описание nvarchar(50) unique
) on FG;
create table ЗАКАЗЫ
(
	ID_расхода int,
	Название_отдела nvarchar(20) foreign key references ОТДЕЛЫ(Название_отдела),
	ID_товара int foreign key references ТОВАРЫ(ID_товара),
	Предельная_норма money,
	Потраченная_сумма money not null,
	Дата date
) on FG;

alter table ОТДЕЛЫ add ID_отдела int;
alter table ОТДЕЛЫ drop Column ID_отдела;

insert into ТОВАРЫ (ID_товара, Название_товара, Описание)
	values(1,'канцелярия', 'ручки, карандаши, блокноты'),
		  (2,'компьютеры', 'ноутбуки, акссесуары'),
		  (3,'принтеры', 'лазерные и струйные');
insert into ОТДЕЛЫ (Название_отдела, Количество_сотрудников)
	values('Отдел1', 5),
		  ('Отдел2', 19),
		  ('Отдел3', 8);
insert into ЗАКАЗЫ (ID_расхода, Название_отдела, ID_товара, Предельная_норма, Потраченная_сумма, Дата)
	values(1, 'Отдел1', 1, 500, 250, '2024-02-01'),
		  (2, 'Отдел2', 2, 1800, 600, '2024-02-02'),
		  (3, 'Отдел3', 3, 100, 50, '2024-02-03');


select * from ЗАКАЗЫ;

select Название_отдела, Дата from ЗАКАЗЫ;

select count(*) from ТОВАРЫ;

update ОТДЕЛЫ set Количество_сотрудников = Количество_сотрудников + 1;

select * from ОТДЕЛЫ;