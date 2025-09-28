
/* 1. Books whose id starts with B, M, or C  */
select title_id
from titles 
where title_id like '[BMC]%'
 
/* 2. Books whose id starts with B, M or C published by id publisher 1389  */
select title_id, pub_id
from titles 
where title_id like '[BMC]%' and pub_id = '1389'

/* 3. Books whose id starts with B, M or C with a royalty between 10 and 15  */
select title_id, royalty
from titles 
where title_id like '[BMC]%' and royalty between 10 and 15


/* 4. State Authors of California whose phone number begins with 415 */
select au_id, (au_fname + ' ' + au_lname)'author name', state, phone
from authors
where phone like '415%' and state = 'CA'

/*5. Authors from the state of California whose phone Number does not begin with 415 */
select au_id, (au_fname + ' ' + au_lname)'author name', state, phone
from authors
where phone not like '415%' and state = 'CA'


/*6. Authors who are not from the state of California whose phone number does not start with 5, 2 or 3.  */
select au_id, (au_fname + ' ' + au_lname)'author name', state, phone
from authors
where phone like '[^523]%'

/*7. American publishers   */
select pub_name, country 
from publishers
where country = 'USA'


/*8. American or French publishers   */
select pub_name, country 
from publishers
where country = 'USA'or country = 'France'


/* 9 Display the last and first name of the authors whose last name is “Smith”. They should be sorted by their first name, and
the columns displayed must be named “Last Name” and “First Name.” */
select * from authors
select (au_lname)'Last Name', (au_fname)'First Name'
from authors
where au_lname = 'Smith'
order by au_fname


/* 10 Display all the states. */ 
select state from authors where state IS NOT NULL
union 
select state from publishers where state IS NOT NULL
union 
select state from stores where state IS NOT NULL

/* 11 Display the first and last names, city, and state of authors who live in the state of California (“CA”) and do not live in the
city of “Oakland”, or live in the city of “Salt Lake City”. */
select au_fname, au_lname, city, state 
from authors
where state = 'CA' and city not like 'Oakland'

/* 12 Display the titles of all books whose price is between $5.00 and $20.00. Use the BETWEEN clause or the AND logical operation. */
select title, price 
from titles
where price between 5 and 20 

/* 13 Display the titles and price of all books whose price is unknown. */
select title, coalesce(price,0) as price
from titles
where price IS NULL


/* 14 Display the last and first name of authors whose last name ends with the string “ger”. */
select au_lname, au_fname 
from authors
where au_lname like '%ger'


/* 15 Display the last and first names of the authors whose last name starts with D or d.   */
select au_lname, au_fname
from authors
where au_lname like '[Dd]%'


/* 16 Display the last and first names of authors whose name is 5 characters in size and end with the string “mith”.  */
select au_lname, au_fname 
from authors
where (len(au_lname) = 5 AND au_lname like '%mith')

-- OR 
select au_lname, au_fname 
from authors
where au_lname like '_mith%'



/* 17 Display the last and first names of all authors in one column named “Author Name”. The second column should display the state
the author lives in.   */
select (au_lname + ' ' + au_fname)'Author Name',state
from authors

/*18.Which states contain more than one author? Display the state and number of authors.*/
select state, count(au_id)'number of authors'
from authors
group by state
having count(au_id) > 1

/*19.From the titles table, obtain the average advance and the sum of the current sales for
the year (ytd_sales) for each of the book categories. Also Display the number of books by category.*/
select type, avg(advance)'advance average', sum(ytd_sales)'current sales', count(title_id)'number of books per category'
from titles
group by type


/*20.From the previous list we want to retain only the results for categories containing more
than 2 books.*/
select type, avg(advance)'advance average', sum(ytd_sales)'current sales', count(title_id)'number of books per category'
from titles
group by type
having count(title_id) > 2


/*21.What types of books have an average royalty of between 10 and 13? Display the type and average royalty.*/
select type, avg(royalty)'average royalty'
from titles
group by type
having avg(royalty) between 10 and 13



/*22.What types of books have an average royaltybetween 10 and 13 and have more than 3 books?
Display the type, the average royalty and the number of books. */
select type, avg(royalty)'average royalty', count(title_id)'number of books'
from titles
group by type
having avg(royalty) between 10 and 13 and count(title_id) > 3

/*23.What is the number of US publishers?  */
select count(distinct pub_id)'number of publishers', country 
from publishers
where country = 'USA'
group by country 


/*24.Display the number of books published per year. */
select count(pub_id)'number of books pulished', year(pubdate)'year'
from titles
group by year(pubdate)



/*25.What is the number of books published in 1991? */
select count(pub_id)'number of books pulished', year(pubdate)'year'
from titles
group by year(pubdate)
having year(pubdate) = '1991'



/*26.What is the number of books published in June of 1991? */
select count(pub_id)'number of books', year(pubdate)'year',month(pubdate)'month'
from titles
where year(pubdate) = '1991' and month(pubdate) = '6'
group by year(pubdate),month(pubdate)

select * from titles

/*27. Number of authors per city.*/
select city, count(distinct au_id)'authors' 
from authors
group by city

/*28. Cities that have two authors.*/
select city, count(distinct au_id)'authors' 
from authors
group by city
having count(distinct au_id) > 2


/*29. Types of books whose average price is greater than 15?*/
select type, avg(price)'average price'
from titles
group by type
having avg(price) > 15


/*30. Display maximum and minimum royalty for books by year of publication.*/
select max(royalty)'maximum royalty', min(royalty)'minimum royalty', year(pubdate)'year'
from titles
where royalty IS NOT NULL
group by year(pubdate)


/*31. Display the number of books of the publisher number 1389 by category (type).*/
select count(pub_id)'number of books (pub = 1389)', type
from titles
where pub_id = '1389'
group by type


/*32. Display the number of books by category, only consider books with a price over $ 15.*/
select count(title_id)'number of books', type 
from titles
where price > 15
group by type


/*33. Number of authors (with a phone number 9) by state.*/
select count(au_id)'number of authors', state
from authors
where phone like '%9%'
group by state

