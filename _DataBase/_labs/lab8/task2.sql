use Kiv_MyBase;

---task1---
create view [��������]
	as select ID_������� [���_�������],
			  ��������_������ [�����],
			  ID_������ [���_������],
			  ���� [����]
			  from ������;

select * from ��������;

drop view ��������;

---task2---
create view [����������_�������]
	as select ��������_������ [�����], count(��������_������) [������_����������]
	from ������ inner join ������
		on ������.ID_������ = ������.ID_������
		group by ��������_������;

select * from ����������_�������;

drop view ����������_�������;

---task3---
create view [�����]
	as select ��������_������ [�����], ID_������ [���_������]
	from ������
	where ID_������ like '2%' with check option;

select * from �����;

drop view �����;

---task4---
create view [�����_2]
	as select ��������_������ [�����], ID_������ [���_������]
	from ������
	where ID_������ like '2%' with check option;

insert �����_2 values('�����7', '2');

select * from �����_2;

drop view �����_2;

---task5---
create view [��������_2]
	as select top 3 ID_������� [���], ��������_������ [�����], ���� [����]
	from ������
	order by �����;

select * from ��������_2;

drop view ��������_2;

---task6---
create view [����������_�������]
	as select ��������_������ [�����], count(��������_������) [������_����������]
	from ������ inner join ������
		on ������.ID_������ = ������.ID_������
	group by ��������_������;

alter view [����������_�������] with schemabinding
	as select ��������_������ [�����], count(��������_������) [������_����������]
	from dbo.������ inner join dbo.������
		on ������.ID_������ = ������.ID_������
	group by ��������_������;

select * from ����������_�������;

drop view ����������_�������;	
