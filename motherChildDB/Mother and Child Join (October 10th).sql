-- CARTESIAN PRODUCT 
select * 
from child,mother

--INNER JOIN
select *
from mother, child
where mother.motherNb = child.motherNb

--ALIAS
select *
from mother m, child c
where m.motherNb = c.motherNb
order by m.motherNb

--DEFINING EACH COLUMN IN THE OUTPUT
select mother.motherNb, mother.motherFirstName, mother.motherLastName,
	   child.childLastName, child.childFirstName, child.motherNb
from mother, child
where child.motherNb = mother.motherNb
order by mother.motherNb

--DEFINING EACH COLUMN IN THE OUTPUT WITH ALIAS
select m.motherNb, m.motherFirstName, m.motherLastName,
	   c.childLastName, c.childFirstName, c.motherNb
	from mother m, child c
	where c.motherNb = m.motherNb
	order by m.motherNb

--INNER JOIN
select *
	from mother inner join child on mother.motherNb=child.motherNb
	order by mother.motherNb

--LEFT JOIN (GIVE ME THE INTERSECTION + WHATEVER LEFT IN THE LEFT TABLE)
select *
	from child left join mother on mother.motherNb=child.motherNb
	order by mother.motherNb

select *
	from mother left join child on mother.motherNb=child.motherNb
	order by mother.motherNb


--RIGHT JOIN (GIVE ME THE INTERSECTION + WHATEVER LEFT IN THE RIGHT TABLE) 
select *
	from mother right join child on mother.motherNb=child.motherNb
	order by mother.motherNb

select *
	from child right join mother on mother.motherNb=child.motherNb
	order by mother.motherNb

--FULL OUTER JOIN (GIVE ME THE INTERSECTION + WHATEVER LEFT IN THE RIGHT AND LEFT TABLE) 
select *
	from child full join mother on mother.motherNb=child.motherNb
	order by mother.motherNb

select *
	from mother full join child on mother.motherNb=child.motherNb
	order by mother.motherNb


