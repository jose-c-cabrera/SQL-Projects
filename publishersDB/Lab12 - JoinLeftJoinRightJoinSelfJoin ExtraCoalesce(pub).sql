
--1)List all books with their respective authors' first and last names.
select title, (au_fname + ' ' + au_lname)'author'
from titleauthor
	join authors on authors.au_id = titleauthor.au_id
	join titles on titleauthor.title_id = titles.title_id
select * from titles
select * from titleauthor
select * from authors

--2)Display the title, author, and publisher of each book
select title, (au_fname + ' ' + au_lname)'author',(pub_name)'publisher'
from titleauthor
	join authors on authors.au_id = titleauthor.au_id
	join titles on titleauthor.title_id = titles.title_id
	join publishers on publishers.pub_id = titles.pub_id

--3)Retrieve the name and location (city, state) of all stores that sold at least one book.
select stor_name, (city + ', ' + state)'location', sum(qty)'number of books sold'
from sales
join stores
on sales.stor_id = stores.stor_id
group by stor_name, (city + ', ' + state)
having sum(Qty) >= 1

--***4)Show the list of stores that sold the book titled "XYZ".
select distinct stor_id, title 
from sales
left join titles on sales.title_id = sales.title_id 
where title = 'Is Anger the Enemy?'

select * from titles
--5)Find the total quantity sold for each title in each store.
select title, stor_name, sum(qty)'quantity sold'
from sales
join stores on stores.stor_id = sales.stor_id
join titles on titles.title_id = sales.title_id 
group by title, stor_name

--6)List all publishers along with any associated books, if they exist.
select pub_name, title 
from publishers 
join titles on titles.pub_id = publishers.pub_id

--7)Show the list of all stores and the number of books sold by each store, even if no books were sold.
select stor_name, coalesce(sum(qty),0) as bookssold
from stores 
left join sales on sales.stor_id = sales.stor_id
group by stor_name 

--8)List all authors and the number of books they have written, even if they haven't written any books.
select au_fname, au_lname, count(title_id)'number of books written'
from authors
left join titleauthor on titleauthor.au_id = authors.au_id 
group by au_fname, au_lname
select * from authors 

--9)Retrieve all titles and the total sales, including titles with no sales.
select title, coalesce(sum(ytd_sales),0)'totalsales'
from titles 
group by title

--10)Display all employees and their corresponding job descriptions, even if the job description is not defined.
select fname,lname, job_desc
from employee 
left join jobs on jobs.job_id = employee.job_id
select * from employee

--11)Show all titles and the authors who wrote them, including titles without authors.
select title, coalesce((au_fname + ' ' + au_lname),'No Author') as author
from titles
left join titleauthor on titleauthor.title_id = titles.title_id
left join authors on titleauthor.au_id = authors.au_id

--12)List all books along with their stores, even if the book hasn't been sold in any store.
select title, coalesce(stor_name, 'No Store') as store
from titles 
left join sales on sales.title_id = titles.title_id 
left join stores on stores.stor_id = sales.stor_id

--13)Retrieve all authors and the titles they have written, including authors who haven't written any books.
select (au_fname + ' ' + au_lname)'author', coalesce(title, 'no book written') as booktitle
from authors 
left join titleauthor on titleauthor.au_id = authors.au_id
left join titles on titles.title_id = titleauthor.title_id

--14)Display all stores and the books they have sold, including stores that haven't sold any books.
select stor_name, sum(qty)'books sold' 
from stores
left join sales on sales.stor_id = stores.stor_id 
group by stor_name 


--15)Show the list of jobs and the employees with those jobs, even if no employee has a certain job.
select job_desc, (fname + ' ' + lname)'employee name' 
from jobs 
left join employee on employee.job_id = jobs.job_id


--16)Find the total sales for each store.
select stor_name, sum(qty)'total sales' 
from stores 
join sales on sales.stor_id = stores.stor_id 
group by stor_name 

--17)List all publishers and the total number of books they have published.
select pub_name, count(title_id)'number of books published'
from publishers 
join titles on titles.pub_id = publishers.pub_id
group by pub_name 

--18) Display the total quantity sold for each book, but only include books with more than 500 sales.
select sum(qty)'total quantity sold', title
from sales 
join titles on titles.title_id = sales.title_id 
group by title 
having sum(qty)>500

--19)Find the average price of books for each publisher, but only include publishers with more than 3 books.
select avg(price)'average price', count(title_id)'total books', pub_name 
from titles 
join publishers on publishers.pub_id = titles.pub_id 
group by pub_name 
having count(title_id)> 3

--20)Show the total number of books written by each author, but only include authors who have written more than one book.
select count(title_id)'number of books written', (au_fname + ' ' + au_lname)'authors'
from titleauthor  
join authors on titleauthor.au_id = authors.au_id
group by au_fname, au_lname 
having count(title_id) > 1

--21)Find all books that have a price above the average price of all books.
select title, price 
from titles 
where price > (select avg(price) from titles)

--22)List the authors who have written more than the average number of books.
select au_id, count(title_id) as book_count
from titleauthor
group by au_id
having count(title_id) > 
    (select avg(book_count)
    from (select au_id, count(title_id) as book_count
    from titleauthor
    group by au_id) as author_counts)

--23)Find the titles of books that have generated more than the average total sales across all titles.
select title, ytd_sales
from titles
where ytd_sales > (select avg(ytd_sales) from titles)

--24)Display the stores that have sold fewer than the average number of books.
select stor_id, qty   
from sales 
where qty < (select avg(qty) from sales) 

--25)Retrieve the titles of books that have an advance payment greater than the average advance payment across all titles.
select title, advance 
from titles 
where advance > (select avg(advance) from titles)

--26)List all authors who have never written a book.
select au_lname, au_fname, count(title_id)'books written'
from authors 
	left join titleauthor on titleauthor.au_id = authors.au_id
group by au_lname, au_fname 
having count(title_id) = 0

--27)Display the titles that have been sold in all stores.
select title, sum(qty)'books sold'
from titles 
	join sales on sales.title_id = titles.title_id 
group by title 

 --28) Find all authors who have written books sold in at least one store.
select distinct(au_fname +' ' + au_lname)'author', count(sales.title_id)'numberofbooks'
from authors 
join titleauthor on titleauthor.au_id = authors.au_id 
join titles on titleauthor.title_id = titles.title_id
join sales on titleauthor.title_id = sales.title_id 
group by au_fname, au_lname

--29) Show the publishers that have published books by more than 5 different authors.
select pub_name, count(distinct au_id)'number of authors'
from publishers 
join titles on titles.pub_id = publishers.pub_id 
join titleauthor on titleauthor.title_id = titles.title_id
group by pub_name 
having count(au_id) > 5
select * from titleauthor 

--30)List all stores that have applied a discount for at least one sale.
select stor_name, count(discounts.stor_id)'number of stores'
from stores 
join discounts on stores.stor_id = discounts.stor_id 
group by stor_name 
having count(discounts.stor_id) >= 1

--31) select the authors who have not had any books published by 'Algodata Infosystems'.
--in addition to the full name of the author, get the amount of each advance and the
--advance's corresponding book number and publisher.
select (au_fname + ' ' + au_lname)AuthorName, advance, titles.title_id, pub_name  
from authors 
	join titleauthor on titleauthor.au_id = authors.au_id 
	join titles on titles.title_id = titleauthor.title_id 
	join publishers on publishers.pub_id = titles.pub_id
	where NOT pub_name = 'Algodata Infosystems'


--32) select the authors who have had all their books published by 'Algodata Infosystems'.
--in addition to the full name of the author, get the amount of each advance and the
--advance's corresponding book number and publisher.
select (au_fname + ' ' + au_lname)AuthorName, advance, titles.title_id, pub_name  
from authors 
	join titleauthor on titleauthor.au_id = authors.au_id 
	join titles on titles.title_id = titleauthor.title_id 
	join publishers on publishers.pub_id = titles.pub_id
	where pub_name = 'Algodata Infosystems'

--33)select the names of authors who received an advance greater than all advances paid by
-- the publisher 'Algodata Infosystems'. in addition to the full name of author, get the
-- amount of each advance, the corresponding book number , and publisher
with x as (
select titles.title_id, count(au_id)numberofAuthors
from titleauthor	
	join titles on titles.title_id = titleauthor.title_id
group by titles.title_id
			)

select titles.title_id, (au_fname + ' ' + au_lname)AuthorName, sum(advance/numberOfAuthors) EachAuthorAdvance, publishers.pub_id 
from titles	
	join x on titles.title_id = x.title_id
	join titleauthor on titleauthor.title_id = x.title_id
	join authors on authors.au_id = titleauthor.au_id
	join publishers on publishers.pub_id = titles.pub_id
group by titles.title_id, au_lname, au_fname, publishers.pub_id 
having sum(advance/numberOfAuthors) > (select max(advance) from titles 
										join publishers on publishers.pub_id = titles.pub_id 
										where pub_name = 'Algodata Infosystems')


--34)Select the names and postal codes (zip) of authors who have a postal
--  code greater than at least one (1) of the postal codes of authors by 
-- the last name of “White” or “Ringer”.
select au_fname, au_lname, zip 
from authors 
where zip > (select distinct(zip) from authors where au_lname = 'Ringer')  --94025
OR zip > (select (zip) from authors where au_lname = 'White') --84152


--35)Select the zip codes of authors who have a postal code greater than all
--postal codes of authors with the name "White" or "Ringer".
select au_fname, au_lname, zip 
from authors 
where zip > (select zip from authors where au_lname = 'White')  --94025
AND zip > (select distinct zip from authors where au_lname = 'Ringer') --84152








