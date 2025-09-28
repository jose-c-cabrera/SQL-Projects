--select * from titles where advance is not null
--select * from titles where not advance is null  */

-- introducing titles table

select type from titles 

select distinct type from titles 


--what is a group by?
select type from titles group by type 

--what is  aggregate function 
select type,count(*) as count  from titles 
group  by type




select pub_id 
from titles 

/* count the number of unique publishers publishing our books */
select distinct pub_id 
from titles

/* count the number of publishers publishing our books */
select count(pub_id) as countAll
from titles 

/* count the number of UNIQUE publishers publishing our books*/
select count(distinct pub_id) as uniqueCount
from titles


/*same but for each type of book */
select    type,count(distinct pub_id) as uniqueCount
from titles
group by type 



