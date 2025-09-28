
-- introducing titles table
select * from titles
select title_id, type 
from titles

select type from titles 
 
 --HOW TO COUNT AMOUNT OF SOMETHING IN A CATEGORY (shows in a numbered table)
select distinct type from titles 

--what is a group by?
select type from titles group by type 

--TO HAVE TWO DIFFERENT ADDITIONAL COLUMNS WITH A FUCNTION EITHER ADD, COUNT OR SOMETHING ELSE, YOU SEPARATE
-- BY A , IF THEY ARE SELECTED AND GROUPED BY THE SAME VARIABLE
select type, count(title_id) numberOfBooks,sum(advance) sumOfAdvance
from titles
group by type

select type, sum(advance) sumOfAdvance
from titles
group by type

--GROUPING BY CATEGORY(ALWAYS GO FOR THE PRIMARY KEY IN THE COUNT SINCE IT WILL NOT GIVE ANY NULL)
select type, sum(price)sumOfPricesOfType
from titles
group by type

--SELECT THE PUB_IB AND SUM THE AMOUNT OF ADVANCE FOR EACH (THE SELECT AND GROUP BY VARIABLE HAS TO BE THE SAME)
select pub_id, sum(advance) SumOfAdvanceByPubID
from titles
group by pub_id

--FINDING THE MAXIMIMUM OF ADVANCE (FILTERS BY MAXIMUM) 
select type, max(advance) MAxOfAdvance
from titles
group by type

--FINDING THE MINIMUM OF ADVANCE (FILTERS BY MAXIMUM) 
select type, min(advance) MAxOfAdvance
from titles
group by type

--FIND MAX OF ADVANCE AND THE TYPE 
select type, advance
from titles
where type = 'business'



--HOW MANY ADVANCE BY PUB_ID
select pub_id, advance,title_id
from titles
where pub_id=1389


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



