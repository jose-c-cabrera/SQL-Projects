
--question 1) list all books for which an advance has been recorded
select * from titles
select title_id,title,advance 
from titles
where advance is NOT NULL

--question 2) list the publishers based on their (by) country
select * from publishers
select pub_id,pub_name,country
from publishers
order by country

--question 3) list the publishing dates of the books
select title_id,title,pubdate
from titles

--question 4) list the publisher id and type of the books
select pub_id,type
from titles

--question 5) list all unique publisher ids from titles
select distinct pub_id
from titles

--question 6) list all unique type of titles
select distinct title
from titles

--question 7) list the publishers' countries and states
select pub_id,pub_name, country, state
from publishers

--question 8) list all unique country and state combinations from  publishers 
select distinct country,state, pub_id
from publishers

--question 9) list all unique states from the publishers
select distinct state, pub_id
from publishers

--question 10) list all unique publisher IDs, their types, and the publication year from the titles
select distinct pub_id, type, year(pubdate)PublicationYear
from titles


--question 11) count the number of books in titles
select count(title_id)NumOfBooks
from titles

--question 12) count the number of books of each type in titles
select type, count(title_id)NumOfBooks
from titles
group by type

--QUESTIONS 13-17(NANDINI PATEL)
--question 13) count the number of publishers publishing our books
select count(pub_id)Publishers
from titles 

--question 14) count the number of publishers publishing our books
select count(pub_id)Publishers
from titles 

--question 15) count the number of unique publishers publishing our books
select count(distinct pub_id)Publishers
from titles 

--question 16) count the number of publishers publishing our books for each type of books
select type, count(pub_id)Publishers
from titles 
group by type

--question 17) count the number of unique publishers publishing our books for each type of books
select type, count(distinct pub_id)Publishers
from titles 
group by type