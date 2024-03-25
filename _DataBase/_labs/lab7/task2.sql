use Kiv_MyBase;

--task1--
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����1')
group by rollup(������.��������_������, ������.ID_������);

--task2--
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����1')
group by cube(������.��������_������, ������.ID_������);

--task3--
--part1--
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����1')
group by ������.��������_������, ������.ID_������
union
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����2')
group by ������.��������_������, ������.ID_������;

--part2--
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����1')
group by ������.��������_������, ������.ID_������
union all
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����2')
group by ������.��������_������, ������.ID_������;

--task4--
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����1')
group by ������.��������_������, ������.ID_������
intersect
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����2')
group by ������.��������_������, ������.ID_������;

--task5--
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����1')
group by ������.��������_������, ������.ID_������
except
select ������.��������_������, ������.ID_������, sum(������.�����������_�����) as [�����]
from ������, ������
where ������.��������_������ = ������.��������_������
and ������.��������_������ in ('�����2')
group by ������.��������_������, ������.ID_������;