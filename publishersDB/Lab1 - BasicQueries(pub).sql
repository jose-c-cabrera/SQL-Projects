
--1. List all authors (last name, first name, address, city, state) in two columns: in the first column,
--display their first and last name, and in the second, show their address, city and the state they
--are live in 
select (au_fname+' '+au_lname)'Name',
		(address+','+city+', '+state)'Address'
		from authors

--2. Repeat example 1, but this time display only the authors from the state of California.select (au_fname+' '+au_lname)'Name',
		(address+','+city+', '+state)'Address' from authors
		where state='CA' --3. Repeat example 2, but this time only display authors who do not live in California.select (au_fname+' '+au_lname)'Name',
		(address+','+city+', '+state)'Address' from authors
		where state like '%[^CA]'

--4. List the books (id, title, price, advance) whose advance payment is equal to 5000
select title_id,title,price,advance from titles
	where advance=5000

--5. List the books (id, title, price, advance) whose advance payment is less than 5000
select title_id,title,price,advance from titles
	where advance<5000

--6. List the books (id, title, price, advance) whose advance payment is between 5000 and 7000
select title_id,title,price,advance from titles
	where advance>=5000 and advance<=7000

--7. List the books (id, title, price, advance) whose advance payment is not between 5000 and 7000
select title_id,title,price,advance from titles
	where advance<5000 or advance>7000

--8. Authors who live in the following states: 'CA' or 'TN'
select (au_fname+' '+au_lname)'Author Name',state from authors
	where state = 'CA' or state='TN'

--9. Authors who do not live in the following states: 'CA' or 'TN'
select (au_fname +' '+ au_lname)'Author Name',state from authors
	where state like '%[^CATN]'

--10. Authors who live in the following states: 'MD', 'TN', 'KS' or 'UT'
select (au_fname+' '+au_lname)'Author Name',state from authors
	where (state = 'MD' or state='TN' or state='KS' or state='UT')

-- 11. Authors who do not live in the following states: 'MD', 'TN', 'KS' or 'UT'
 select * from authors 
 where state like '%[^MDTNKSUT]'


-- 12. From the "titles" table, get the list of books with one of the following prices: $ 9.95, $ 10.95, $ 11.95, or $ 12.95. Display their book number, their genre and their price.

select title_id, type, price  from titles
where price = '9.95' or price = '10.95' or price = '11.95' or price = '12.95'

--13. Authors whose first name begins with M
select * from authors
where au_fname like 'M%'

--14. Authors whose first name contains "ch" as the third and forth character. 
select * from authors
where au_fname like '__ch%'

-- 15. Authors whose first name begins with "Ma" or "Mi"
select * from authors
where au_fname like 'M[ai]%'

--16. Authors whose phone number starts with 4, 5 or 9
select * from authors
where phone like '[459]%'

--17. Authors whose phone number does not start with 4, 5 or 9
select * from authors 
where phone like '[^459]%'

--18. Authors whose phone number ends in 0, 2 or 8
select * from authors 
where phone like '%[028]'

--19.Authors whose phone number does not end with 0, 2 or 8
select * from authors 
where phone like '%[^028]'

--20.Authors whose phone number contains "44"
select * from authors
where phone like '%44%'

--21.Authors whose phone number does not contain "44"
 select * from authors
where phone like '%[^44]%'


---22. Authors whose zip code begins and ends with 9

select * from authors
where zip like '9%9'

---23. Books whose Id starts with B, M, or C

select * from titles
where title_id like 'B%' or title_id  like 'm%' or  title_id like  'c%' 

---24. Books whose Id starts with B, M or C edited by editor id 1389
select * from titles
where (title_id like 'B%' or title_id  like 'm%' or  title_id like 'c%') AND pub_id=1389


----25. Books whose Id starts with B, M or C with a royalty between 10 and 15

select * from TITLES
where (title_id like 'B%' or title_id  like 'm%' or  title_id like 'c%') AND royalty between 10 and 15 

----26. Authors of the state of California whose phone number begins with 415

 select * from authors
 where state ='CA'
 and phone like '415%'


 ----27. Authors of the state of California whose phone number does not start with 415
 select * from authors
 where state ='CA'
 and phone not like '415%'


 ----28. Authors who are not from the state of California, and whose phone number do not start with 5, 2 or 3.
 select * from authors
 where state   like '%[^CA]'
 and phone like '[^523]%' 

---- 29. American publishers
 select * from publishers
 where country like 'usa'

--30. US or French publishers
select * from publishers
where country = 'USA' or country = 'France'