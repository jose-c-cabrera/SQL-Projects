
/*list the countries with more than 2 publishers */
select country , count(*) as 'Number of publishers'
from publishers 
group by country 
having count(*) > 2

/*which states contain more than one author?
display the state and number of authors */
select state, count(*) as 'number of authors'
from authors
group by state 
having count(*) > 1

/* count,avg,sum , max, min */
/* from titles table,obtain the average advance and the sum of the current sales
for the year for each categories.and display the number of books by category*/

select type,
       avg(advance) as 'average advance',
	   sum(ytd_sales) as 'sales',
	   count(*) as 'number of books'
from titles
group by type 







/* from the previous query, just give me the ones with more than 2 books */

select type,
       avg(advance) as 'average advance',
	   sum(ytd_sales) as 'sales',
	   count(*) as 'number of books'
from titles
group by type 
having count(*) > 2


/*what types of books have an average royalty of between 10 and 13 
display the type and average royalty*/

select type, avg(royalty) as 'average royalty' 
from titles 
group by type 


/* what is the number of USA publishers? */

select count(*) as 'number of American publishers'
from publishers 
group by country 
having country = 'USA'



/*display the number of books published per year */

select year(pubdate) as 'year',
       count(*) as 'number of books'
from titles 
group by year(pubdate)
order by count(*)



/*type of books which average price is greater than 15 */
select type, avg(price) as 'average price by type' 
from titles 
group by type 
having avg(price) > 15



