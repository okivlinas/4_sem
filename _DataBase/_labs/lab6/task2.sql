---1---
select �.�����������_������,
	   max(�.����������) [max],
	   min(�.����������) [min],
	   avg(�.����������) [avg],
	   count(*) [count],
	   sum(�.����������) [sum]
from ������ �
inner join ������ �
on �.������������ = �.�����������_������
group by �.�����������_������

---3---
select *
from(select case 
		when �.���������� between 1 and 10 then '1..10'
		when �.���������� between 11 and 50 then '11..50'
		when �.���������� between 51 and 100 then '51..100'
		else '101..'
		end [�������_���-��], 
		count(*)[���-��]
	  from ������ �
	  group by case
		when �.���������� between 1 and 10 then '1..10'
		when �.���������� between 11 and 50 then '11..50'
		when �.���������� between 51 and 100 then '51..100'
		else '101..'
		end) as T
order by case [�������_���-��]
	when '1..10' then 1
	when '11..50' then 2
	when '51..100' then 3
	else 4
end

---4---
select z.�����������_������,
	   r.[������������ �����],
	   round(avg(cast(z.���������� as float(4))), 2) as [��_���-��]
from ������ t inner join ������ z
on t.������������ = z.�����������_������
inner join ��������� r
on z.�������� = r.[������������ �����]
group by z.�����������_������, r.[������������ �����]
order by [��_���-��] desc

---5---
select z.�����������_������,
	   r.[������������ �����],
	   round(avg(cast(z.���������� as float(4))), 2) as [��_���-��]
from ������ t inner join ������ z
on t.������������ = z.�����������_������
inner join ��������� r
on z.�������� = r.[������������ �����]
where z.�����������_������ like '��������' or z.�����������_������ like '������'
group by z.�����������_������, r.[������������ �����]
order by [��_���-��] desc
---6---
select z.�����������_������,
	   r.[������������ �����],
	   avg(z.����������) as [��_���-��]
from ������ t inner join ������ z
on t.������������ = z.�����������_������
inner join ��������� r
on z.�������� = r.[������������ �����]
where r.[������������ �����] like '���������'
group by z.�����������_������, r.[������������ �����]

---7---
select z.�����������_������, 
	   count(z.����������) as [50_and_100]
from ������ z
group by z.�����������_������, z.����������
having z.���������� between 50 and 100;
