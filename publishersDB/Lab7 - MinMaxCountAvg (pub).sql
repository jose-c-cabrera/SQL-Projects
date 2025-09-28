
--question 1) the number of unique publisher  for each type from the titles
select type,count(distinct pub_id)NumberofUniquePublishers
from titles
group by type 

--question 2) list the countries with more than 2 publishers 
select country, count(pub_id)publishers
from publishers
group by country
having count(pub_id)>2

--question 3) which states contain more than one author? display the state and number of authors
select state, count(au_id)authors
from authors
group by state
having count(au_id)>1

--question 4) from titles table,obtain the average advance and the sum of the current sales
--for the year for each categories.and display the number of books by category
select type,avg(advance)AverageAdvance,sum(ytd_sales)SumCurrentSales,count(title_id)NumberOfBooks
from titles
group by type

--question 5) from the previous query, just give me the ones with more than 2 books
select type,avg(advance)AverageAdvance,sum(ytd_sales)SumCurrentSales,count(title_id)NumberOfBooks
from titles
group by type
having count(title_id)>2

--question 6) what types of books have an average royalty of between 10 and 13 
--display the type and average royalty
select type, avg(royalty)AverageRoyalty
from titles
group by type
having avg(royalty) between 10 and 13

--question 7) from the previous query, i want the types having more than 3 books
select type, avg(royalty)AverageRoyalty, count(title)Books
from titles
group by type
having avg(royalty) between 10 and 13 and count(title)>3

--question 8) what is the number of USA publishers?
select country, count(pub_id)NumberOfPublishers
from publishers
where country = 'USA'
group by country

--question 9) display the number of books published per year
select year(pubdate)Year ,count(title)NumberOfBooks
from titles
group by year(pubdate)

--question 10) what is the number of books published in 1991
select year(pubdate)Year ,count(title)NumberOfBooks
from titles
group by year(pubdate)
having year(pubdate)='1991'

--question 11) number of authors per city
select city, count(au_id)NumberOfAuthors
from authors
group by city

--question 12) cities that have 2 authors
select city, count(au_id)NumberOfAuthors
from authors
group by city
having count(au_id)=2

--question 13) type of books which average price is greater than 15
select type, avg(price)Price
from titles
group by type
having avg(price)>15

--question 14) display maximum,minimum of royalty for books by year of publication
select year(pubdate)Year,min(royalty)Minimum,max(royalty)Maximum
from titles
group by year(pubdate)

--question 15)  display the number of books of the publisher number 1389 by category (type)
select type,count(title)'Books(Publisher1389)'
from titles
where pub_id = '1389'
group by type

--question 16) display the number of books by category, only for books with price over 15$ 
select type, count(title)NumberOfBooks
from titles
where price>15
group by type

--question 17) number of authors by state with a phone number 9
select state,count(au_id)NumberOfAuthors
from authors
where phone like '%9%'
group by state

--question 18) list the state and phone numbers of authors located in California (CA) 
select state,phone
from authors
where state = 'CA'