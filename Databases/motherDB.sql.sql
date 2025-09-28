if exists (select * from sysdatabases where name='mother')
begin
 -- raiserror('Dropping existing mother database ....',0,1)
  DROP database mother
end

GO
create database mother

GO
use mother 

create table mother (motherNb int,motherLastName varchar(25) ,motherFirstName varchar(25) );

insert mother (motherNb ,motherLastName  ,motherFirstName  ) values (16,'King','Mary' ) ;
insert mother (motherNb ,motherLastName  ,motherFirstName  ) values (22,'Trudeau','Chantal' ) ;
insert mother (motherNb ,motherLastName  ,motherFirstName  ) values (30,'Ringer','Anne' ) ;

select * from mother 

create table child ( childLastName varchar(25),childFirstName varchar(25),motherNb int )  ;

insert child (childLastName ,childFirstName ,motherNb) values ('King','Majorie',16 );
insert child (childLastName ,childFirstName ,motherNb) values ('Tremblay','Pierre',22 );

insert child (childLastName ,childFirstName ,motherNb) values ( 'King','John',16);
insert child (childLastName ,childFirstName ,motherNb) values ('Ford', 'Mary' ,16 );
insert child (childLastName ,childFirstName ,motherNb) values ( 'Tremblay','Marc',22);

insert child (childLastName ,childFirstName ,motherNb) values ( 'Cramer','Paul',NULL);
insert child (childLastName ,childFirstName ,motherNb) values ( 'Brown','Lesly',NULL);

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