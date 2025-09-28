
-- 1)	What is the population of Canada? 
select name, population from cia
population
where name='Canada'

-- 2)	Display the name, population, area, and population
--density of the largest countries in the world (those whose 
--area exceeds 2,000,000 km2). Display the population density
--without any decimal points. ANA SOFIA 
select area, population,STR(population/area,3,0)'Population Density'from cia 
where area>2000000


-- 3) Display the countries which are smaller than 2000 km2 but have
--a GDP greater than $5,000,000,000. The displayed data should 
--resemble the following: Singapore is in Southeast Asia
select (name+' is in' + ' '+ region) 'Name Region', area, gdp from cia
where area <2000 and gdp>5000000000

--4) Write a query that displays which of the following names
--are real country names: Sri Lanka, Ceylon, Persia, Iran.
select name from cia
where name= 'Sri Lanka' or name= 'Ceylon'or name='Persia'or name='Iran'

--5) Write a query that displays the country names that start with D.
select name from cia 
where name like 'D%'

--6) Write a query that displays the area and country name
--of countries with an area between 207,600 km2 and 244,820 km2.
select area, name from cia
where area between 207600 and 244820

--7)	Write a query that displays the name and population of 
--countries with a population of at least 200,000,000 people.
select  name, population from cia
where population>=200000000

---8)	Write a query that displays name and area of countries with an area of at least 2,300,000km2. Display the results in descending order based on their area.
select  name,area from cia
where area>=2300000
order by area desc


--9)	Display the names and GDP per capita of countries with a population of equal to or greater than 200,000,000 people, in descending order based on their respective GDP per capita.
select name, gdp,population from cia
where population>200000000 
order by population,gdp desc

---10)	Display the name and population in millions of people of all countries in South America. 
--Population should be precise to the second decimal point. Use the str()function.
select name,region,STR(population/1000000,10,2)'population in millions'from cia 
where region = 'South America'

--11)	Display the populations of Japan, China, Iraq, and Iran.

select name, population from cia 
where name = 'Japan' or name = 'China' or name = 'Iraq' or name = 'Iran'

--12)	Write a query that displays the name of countries that contain the word “united”. Results should be sorted by region.

Select name from cia 
where name LIKE '%united%'

--13)	Display the population of France and Germany. Use the OR clause.
Select name, population from cia 
where name = 'France' or name = 'Germany'

--14)	Display the names of all countries whose name starts with S and are in Europe.
select name from cia 
where name LIKE 'S%' and region = 'Europe'