
--Question 1.	Display the titles of books whose price
--is less than third min price of books. Also show the min price of the displayed book.
select title, price
from titles 
where price < (select min(price) from titles where 
			   price > (select min(price) from titles where 
			   price > (select min(price) from titles)))


--Question 2.	Display book "types" of which at least one price of 
--the books that comprise them is greater than the min price of all titles.

select type
from titles
where price > (
select min(price) from titles)
group by type;


--Question 3.	Display book "types" of which at least 
--one price of the books of which they are composed is less 
--than the max price of the books, and whose author's zip code 
--is less than 94705,bigger than 94130 , but not 94301
with x as (
select type, titles.title_id, au_id
from titles 
	join titleauthor on titleauthor.title_id = titles.title_id
where price < (select max(price) from titles) --22.95
	)

select distinct x.type
from authors
	join x on x.au_id = authors.au_id
	join titles on titles.title_id = x.title_id
where zip < 94705 AND zip > 94130 AND zip != 94301

--Question 4.	Which publishers have at least one published book 
--that has received an advance payment over $ 2,000 and is sold 
--in a city  which second letter of the city starts with "o" and 
--the last letter is "d"?
with x as (
select stores.stor_id, city,title_id
from stores
join sales on sales.stor_id = stores.stor_id
where city like '_o%d'
)

select distinct pub_name
from publishers

join titles on titles.pub_id = publishers.pub_id
join x on x.title_id = titles.title_id
where advance>2000

-----------------------------------------------------
with x as (
select publishers.pub_name, title_id
from titles
	join publishers on titles.pub_id = publishers.pub_id
where advance > 2000
)

select distinct x.pub_name, stor_name
from sales 
	join x on x.title_id = sales.title_id 
	join stores on stores.stor_id = sales.stor_id
where city like '_o%d'


--Question 5.	Display the books sold and their quantity and their discounts
-- for each city.
select city, sum(qty)BooksSold, discounts.discount
from sales 
	join stores on sales.stor_id = stores.stor_id
	left join discounts on sales.stor_id = discounts.stor_id
group by city, discounts.discount;


--Question 6.	Find the third and fourth most expensive book(s)
select price from titles order by price --20.95 AND -20.00

select title, price from titles 
where price = (select max(price) from titles where 
			  price < (select max(price) from titles where
			  price < (select max(price) from titles)))
union 
select titles.title, titles.price from titles
where titles.price = (select max(price) from titles where 
			  price < (select max(price) from titles where
			  price < (select max(price) from titles where
			  price < (select max(price) from titles))))  


--Question 7.	Find the book(s) with the second lowest royalty.
select title, royalty from titles ORDER BY ROYALTy

select title, royalty 
from titles 
where royalty = (select min(royalty) from titles where
				royalty > (select min(royalty) from titles))


--Question 8.	Display the book id and titles of books not 
--sold in california. 
select distinct titles.title_id, title 
from titles 
	join sales on sales.title_id = titles.title_id 
	join stores on stores.stor_id = sales.stor_id
where state != 'CA'

--Question 9. We want to know the TOTAL quantity of books sold  by each author.
--For each author, display the first name concatenated with 
--the last name,replace first name first letter by "D", and replace
--second letter of last name by "A" and also display TOTAL quantity of 
--books sold by that author.
select (stuff(au_fname,1,1,'D') + ' ' + stuff(au_lname,2,1,'A'))'AuthorName', sum(qty)BooksSold
from sales
join titleauthor on titleauthor.title_id = sales.title_id
join authors on authors.au_id = titleauthor.au_id
group by au_fname, au_lname 
order by sum(qty)



--Question 10. Display the last name of the author(s) who 
--wrote the number of books more than the second minimun number of books 
--ever written by an author and less than the maximum number of
--books ever written.
with x as (
select authors.au_id,au_fname, au_lname, count(title_id) as NumberOfBooks
from authors	
	join titleauthor on titleauthor.au_id = authors.au_id
	group by authors.au_id,au_fname, au_lname
)

select  x.au_lname, x.NumberOfBooks
from authors 
	join x on x.au_id = authors.au_id 
	where NumberOfBooks < (select max(NumberOfBooks) from x) 
	AND NumberOfBooks > (select min(NumberOfBooks) from x where NumberOfBooks > (select min(NumberOfBooks) from x))
	
	select * from titleauthor
		join authors on titleauthor.au_id = authors.au_id
-- Question 11. Display the title, author, and publisher of each book
select distinct title, (au_fname + ' ' + au_lname)'author', pub_name 
from titles 
	join titleauthor on titles.title_id = titleauthor.title_id 
	join authors on authors.au_id = titleauthor.au_id
	join publishers on publishers.pub_id = titles.pub_id


-- Question 12. Retrieve the name and location (city, state) of all stores that sold at least one book.
select stor_name, city, state, count(qty)'books sold' 
from stores 
	join sales on stores.stor_id = sales.stor_id 
	group by stor_name, city,state 
having count(qty) > 1 

--
-- Question 13. Find the total quantity sold for each title in each store.
select stor_name, title, sum(qty)'total quantity'
from sales 
	join stores on sales.stor_id = stores.stor_id 
	join titles on titles.title_id = sales.title_id 
group by stor_name, title 


-- Question 14. List all publishers along with any associated books.
select pub_name, title
from publishers 
	join titles on titles.pub_id = publishers.pub_id

-- Question 15. Show the list of all stores and the number of books sold by each store, --- even if no books were sold.
select stor_name, sum(qty)'number of books sold'
from stores
	left join sales on sales.stor_id = stores.stor_id
group by stor_name 

-- Question 16. List all authors and the number of books they have written, even if they -- haven't written any books.
select au_lname, au_fname, titleauthor.title_id  from authors
	left join titleauthor on titleauthor.au_id = authors.au_id 
	left join titles on titles.title_id = titleauthor.title_id 

-- Question 17. Retrieve all titles and the total sales, including titles with no sales.
select title_id, sum(ytd_sales)'total sales'
from titles 
group by title_id 

-- Question 18. Display all employees and their corresponding job descriptions, even if
--the job description is not defined.
select emp_id, job_desc
from employee
	right join jobs on jobs.job_id = employee.job_id 


-- Question 19. Show all titles and the authors who wrote them, including titles without --authors.
select titles.title_id, title, (au_fname + ' ' + au_lname)AuthorName
from titles 
	left join titleauthor on titleauthor.title_id = titles.title_id 
	left join authors on authors.au_id = titleauthor.au_id 


-- Question 20. List all books along with their stores, even if the book hasn't been sold in any store.
select titles.title_id, title, stores.stor_id, stor_name 
from titles
		left join sales on sales.title_id = titles.title_id 
		left join stores on stores.stor_id = sales.stor_id 

-- Question 21. Retrieve all authors and the titles they have written, including authors -- who haven't written any books.
select authors.au_id, title_id from authors	
	left join titleauthor on titleauthor.au_id = authors.au_id

--Question 22. Display all stores and the books they have sold, including stores that 	--haven't sold any books.
select stor_name, title
from stores
			right join sales on sales.stor_id = stores.stor_id
			right join titles on titles.title_id = sales.title_id

-- Question 23. Show the list of jobs and the employees with those jobs, even if no 	--employee has a certain job.
select emp_id, job_desc 
from employee
	right join jobs on jobs.job_id = employee.job_id 



-- Question 24. Find the total sales for each store if the total is higher than the --avg(sales) of all stores sales.
select stores.stor_id, stor_name, sum(ytd_sales) as StoreSales from titles 
	join sales on sales.title_id = titles.title_id 
	join stores on stores.stor_id = sales.stor_id
group by stores.stor_id, stor_name
having sum(ytd_sales) > (select avg(ytd_sales) from titles)
----------------------------------------------------------------------------------
select sum(qty*price)'totalsales', stor_id from titles 
	join sales on sales.title_id = titles.title_id 
group by stor_id
having sum(qty*price) > (select avg(qty*price) from titles 	join sales on sales.title_id = titles.title_id)

-- Question 25. List all publishers and the total number of books they have published.
select publishers.pub_id, count(publishers.pub_id)as PublishersNumber from publishers
	join titles on titles.pub_id = publishers.pub_id
group by publishers.pub_id
-------------------------------
select pub_id, count(title_id)NumberOfBooks from titles 
group by pub_id 

----------- Question 26. Display the total quantity sold for each book, but only include books 
--with more than 500 sales.
select title_id, qty
from sales 
where qty > 500


-- Question 27. Find the average price of books for each publisher, but only include 
--publishers with more than 3 books.
select avg(price)'Average', count(title_id)'NumberOfBooks',  pub_id 
from titles 
group by pub_id
having count(title_id) > 3

-- Question 28. Show the total number of books written by each author, but only include
--authors who have written more than one book.
select au_fname, au_lname, count(titles.title_id)'NumberOfBooks'
from authors 
	left join titleauthor on titleauthor.au_id = authors.au_id
	left join titles on titles.title_id = titleauthor.title_id 
group by au_fname, au_lname
having count(titles.title_id) > 1 

-- Question 29. Find all books that have a price above the average price of all books.
select title_id, title, price  from titles 
where price > (select avg(price) from titles)

-- Question 30. List the authors who have written more than the average number of books.
with x as (

select authors.au_id, count(titles.title_id) as NumberOfBooks
from authors
		left join titleauthor on titleauthor.au_id = authors.au_id 
		left join titles on titles.title_id = titleauthor.title_id 
group by authors.au_id
)

select au_fname, au_lname, NumberOfBooks
from authors
	join x on x.au_id = authors.au_id
where NumberOfBooks > (Select avg(NumberOfBooks) from x)

-- Question 32. Find the titles of books that have generated more than the average total 
--sales across all titles.
select title, sum(ytd_sales)'sales'
from titles
group by title
having sum(ytd_sales) > (select avg(ytd_sales) from titles)

-- Question 33. Display the stores that have sold fewer than the average number of books.
select stor_id, sum(qty)'sales'
from sales 
group by stor_id
having sum(qty) < (select avg(qty) from sales)

-- Question 34. Retrieve the titles of books that have an advance payment greater than 
--the average advance payment across all titles.
select title, advance   
from titles 
where advance > (select avg(advance) from titles) --5.962.50


-- Question 35. List all authors who have never written a book.
select (au_fname + au_lname)AuthorName, count(titleauthor.title_id) as BooksWritten
from authors 
	left join titleauthor on titleauthor.au_id = authors.au_id 
group by au_fname, au_lname 
having count(titleauthor.title_id) = 0

---********- Question 36. Display the titles that have been sold in all stores.
select title,titles.title_id, count(distinct sales.title_id)'NumberOfBooks'
from sales 
	join stores on sales.stor_id = stores.stor_id 
	join titles on sales.title_id = titles.title_id
 group by titles.title_id, title
 having count(distinct sales.title_id) = (select count(distinct sales.stor_id) from sales)

 select * from sales 
-- Question 37. Show the publishers that have published books by more than 3 different authors.
 

-- Question 38. List all stores that have applied a discount for at least one sale.
select *
from stores
	 join discounts on discounts.stor_id = stores.stor_id 




