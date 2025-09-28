
-- 1. Display each publisher will all its employees (name, last name, first name, and title).
select pub_name, lname, fname, job_desc 
from publishers pub
	join employee on pub.pub_id = employee.pub_id
	join jobs on jobs.job_id = employee.job_id
order by pub_name

-- 2. Display the title of each book, with the name(s), city, and state of the stores where the book was sold.
select title, stor_name, city, state
from titles
	join sales on sales.title_id = titles.title_id
	join stores on stores.stor_id = sales.stor_id

-- 3. Display all authors (first and last name concatenated) with the title of the books they authored sorted by first and last name.
select (au_fname + ' ' + au_lname) 'Author Name' , title
from authors
	join titleauthor on titleauthor.au_id = authors.au_id
	join titles on titles.title_id = titleauthor.title_id


-- 4. Display the first and last name of each author who has written at least one book, as well as the amounth of books they have written.
select au_fname, au_lname, count(title_id)NumberOfBooks
from authors
	join titleauthor on titleauthor.au_id = authors.au_id
	group by au_fname, au_lname
	having count(title_id)>=1

-- 5. Display the title of each book, with the publishers name, and the author's last name concatenated with the first letter of their last 
-- name, ordered in descending alphabetic order.

select title, pub_name, (au_lname + +', '+ substring(au_fname,1,1))AuthorName 
from titles 
	join publishers on publishers.pub_id = titles.pub_id
	join titleauthor on titleauthor.title_id = titles.title_id
	join authors on authors.au_id = titleauthor.au_id

-- 6. For each store in the state of Washington, display the name of the store, the city and state it is located in, and lastly the title and 
-- amount of each book they have sold. Sort results by book titles in descending order.
select stor_name, city, state, title, qty
from stores 
	join sales on sales.stor_id = stores.stor_id 
	join titles on titles.title_id = sales.title_id
where state = 'WA'


-- 7. Display the names of all publishers who have paid an advance greater than $1000 for a book, 
-- along with the books id of the book the advance was paid for.
select pub_name, title_id
from publishers
	join titles on titles.pub_id = publishers.pub_id
where advance > 1000

-- 8. Display the names of publishers who have published books in the “business” or “psychology” categories.
select  distinct pub_name, type 
from publishers
	join titles on titles.pub_id = publishers.pub_id
where type = 'business' or type = 'psychology'


-- 9. Display the titles of books that have been written by the author Albert Ringer.
select title, au_fname, au_lname
from titles
	join titleauthor on titleauthor.title_id = titles.title_id
	join authors on titleauthor.au_id = authors.au_id
	where au_fname = 'Albert' and au_lname = 'Ringer'



-- 10. Display the name of each publisher with the number of employees they employ.
select pub_name, count(emp_id)NumberOfEmployees
from publishers
	join employee on employee.pub_id = publishers.pub_id 
	group by pub_name 
	

-- 11. Display the name of each publisher with the number of books they have published, the minimum price of their books,
-- the maximum price of their books, the sum and the average of their prices. 
select pub_name, count(title_id)NumberOfBooks, min(price)Minimum, max(price)Maximum, sum(price)'Sum', round(avg(price),2)AvgPrice
from publishers
	join titles on titles.pub_id = publishers.pub_id
	group by pub_name

select * from titles

-- 12. Display the name of each Store with the number of different books sold in each store.
select stor_name, count(qty)AmountOfBooks
from stores
join sales on sales.stor_id = stores.stor_id
group by stor_name

-- NANDINI PATEL (13-17)
-- 13. Display the title books that have sold fewer than 25 copies, along  with the quantity they have sold.
select title, sum(qty)NumberOfBooksSold
from titles
	join sales on sales.title_id=titles.title_id
group by title
having sum(qty) < 25 


-- 14. Display the largest advance payment made by each publisher (along with the publisher's name).
select pub_name, max(advance)LargesAdvancePMT
from titles
join publishers on publishers.pub_id = titles.pub_id
group by pub_name

-- 15. Display the name of authors who have not written a book.
select (au_lname + ' ' + au_fname)'author'
from authors
left join titleauthor on titleauthor.au_id = authors.au_id
group by au_lname, au_fname
having count(title_id) = 0 


-- 16. Display the number of books sold for each book title.
select title, coalesce(sum(qty),0)NumberOfBooksSold
from titles
	left join sales on titles.title_id = sales.title_id
group by title


-- 17. Display the number of books sold for each store.
select stor_id, sum(qty)'number of books sold'
from sales 
group by stor_id
