use master;

create database Kiv_MyBase on primary
( name = N'Kiv_MyBase_mdf', filename = N'D:\���������\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_mdf.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'Kiv_MyBase_ndf', filename = N'D:\���������\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
( name = N'Kiv_MyBase_fg1_1', filename = N'D:\���������\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'Kiv_MyBase_fg1_2', filename = N'D:\���������\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'Kiv_MyBase_log', filename=N'D:\���������\_study\_university\4_sem\_DataBase\_labs\lab3\pap\Kiv_MyBase_log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)

use Kiv_MyBase
create table ������
(
	��������_������ nvarchar(20) primary key,
	����������_����������� int
) on FG;
create table ������
(
	ID_������ int primary key,
	��������_������ nvarchar(20),
	�������� nvarchar(50) unique
) on FG;
create table ������
(
	ID_������� int,
	��������_������ nvarchar(20) foreign key references ������(��������_������),
	ID_������ int foreign key references ������(ID_������),
	����������_����� money,
	�����������_����� money not null,
	���� date
) on FG;

alter table ������ add ID_������ int;
alter table ������ drop Column ID_������;

insert into ������ (ID_������, ��������_������, ��������)
	values(1,'����������', '�����, ���������, ��������'),
		  (2,'����������', '��������, ����������'),
		  (3,'��������', '�������� � ��������');
insert into ������ (��������_������, ����������_�����������)
	values('�����1', 5),
		  ('�����2', 19),
		  ('�����3', 8);
insert into ������ (ID_�������, ��������_������, ID_������, ����������_�����, �����������_�����, ����)
	values(1, '�����1', 1, 500, 250, '2024-02-01'),
		  (2, '�����2', 2, 1800, 600, '2024-02-02'),
		  (3, '�����3', 3, 100, 50, '2024-02-03');


select * from ������;

select ��������_������, ���� from ������;

select count(*) from ������;

update ������ set ����������_����������� = ����������_����������� + 1;

select * from ������;