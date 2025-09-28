
--From the "titles" table, get the list of titles containing the word "computer". Display the
--title and price of each book--

SELECT title, price
FROM titles
WHERE title LIKE '%computers%';

/*
From the "titles" table, obtain the list of titles containing the word "computer" (in the
singular). Display the title and price of each book.
*/

select title, price
from  titles
where title LIKE '%computer%';

/*
From the "titles" table, obtain the list of titles whose identifier starts with SU or BU. Display the title and price of each book.
*/
select * from titles

select title_id,title, price
from titles
where (title_id like 'SU%' OR title_id  LIKE 'BU%')

/*display the number of books published per year */

select year(pubdate) year, COUNT(*) AS book_count
from titles
group by year(pubdate)
order by year(pubdate);

/*what is the number of books published in 1991 */
select year(pubdate) year, COUNT(*) AS book_count
from titles
where  year(pubdate) = 1991
group by year(pubdate)


/*what is the number of books published in june of 1991 */

select month(pubdate) month, COUNT(*) AS book_count
from titles
where  month(pubdate) = 6
group by month(pubdate)

/*number of authors per city */
select city, count(*) AS author_count
from authors
group by city

/*cities that have 2 authors */
select city, count(*) AS author_count
from authors
group by city
having count(*) = 2
order by city;

/*type of books which average price is greater than 15 */
select type,avg(price) as avg_price
from titles
group by type
having avg(price)>15


/*display maximum,minimum of royalty for books by year of publication */
select pubdate, 
       MAX(royalty) AS max_royalty, 
       MIN(royalty) AS min_royalty
from titles
group by  pubdate
order by pubdate;


/* display the number of books of the publisher number 1389 by category (type) */
select count(pub_id)'number of publishers',type
from titles
where pub_id = '1389'
group by type

/*display the number of books by category, only for books with price over 15$ */
 
 select type, count(*) AS book_count
from titles
where price > 15
group by type

/*number of authors by state with a phone number 9 */
 

select state, COUNT(*) AS author_count
from authors
where phone like '9%'
group by state
order by state;