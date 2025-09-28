
/*
From the "titles" table, get the list of titles containing the word "computer". Display the
title and price of each book.
*/
select title,price
from titles
where title like '%computer%'

/*
From the "titles" table, obtain the list of titles containing the word "computer" (in the
singular). Display the title and price of each book.
*/
select title, price
from titles
where title like '%computers%'

/*
From the "titles" table, obtain the list of titles whose identifier starts with SU or BU. Display the title and price of each book.
*/
select title, title_id
from titles
where title_id like 'SU%' or title_id like 'BU%'

/*
From the "titles" table, get the list of titles that do not start with SU or BU. Display the title and price of each book.
*/

select title, title_id
from titles
where title_id like '[^SUBU]%'

/*
From the "titles" table, obtain the list of titles starting with neither S nor B,
but whose second letter is "o". Display the title and price of each book.
*/
select title
from titles
where title like '[^SB]%' and title like '_o%'

/*
From the "titles" table, obtain the list of titles starting with neither S nor B,
but whose 3rd letter is "f". Display the title and price of each book.
*/

select title, price
from titles
where title like '[^SB]%' and title like '__f%'

/*
From the titles table, get the list of titles beginning with one of the first 10 letters of
the alphabet. Display the title and price of each book.
*/
select title, price
from titles
where title like '[ABCDEFGHIJ]%'

/* Authors whose phone number begins with 4 or 5  */

select phone 
from authors
where phone like '[45]%'

--some select exercices

/* List all authors (last name, first name, address, city , state) in 2 columns:
   in first column: display the first name and last name
   in second column: display address, city , state
*/
select (au_fname + ' ' + au_lname)'Full Name', (address + ' ' + city + ' ' +state)'Address'
from authors


/* select all authors (last name, first name, address,city, state ) except those from california state 

 in first column: display the first name and last name
  in second column: display address, city , state

*/ 
select (au_fname + ' ' + au_lname)'Full Name', (address + ' ' + city + ' ' +state)'Address'
from authors
where state like '%[^CA]'

/* select the books (id,title,price,advance) for which advance is equal to 5000 */
select title_id, title, price, advance
from titles
where advance = 5000

/* select the books (id,title,price,advance) for which advance less than 5000 */
select title_id, title, price, advance
from titles
where advance < 5000

/* select the books (id,title,price,advance) for which advance is between  5000  and 7000 */
select title_id, title, price, advance
from titles
where advance >= 5000 and advance <=7000

/* select the books (id,title,price,advance) for which advance is 
NOT between  5000  and 7000 */
select title_id, title, price, advance
from titles
where advance < 5000 OR advance > 7000


-- ~(p and q)   ~p or ~q 

 -- END





