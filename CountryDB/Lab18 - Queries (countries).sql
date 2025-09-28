
--1.	What is the population of the world? Give a title to the column.
select sum(population) as WorldPopulation
from cia 

--2.	Which country has the largest population in the whole world? Display its population and its percentage in relation to total population of all countries in the world. Do not display the country's name
select max(population) as LargestPopulation, concat(cast((max(population)/sum(population)*100) as decimal (10,2)),'%') as PercentageRelation 
from cia 

--3.	Which smallest population of any country in the world? The population must be greater than 50. Display the smallest population and its percentage in compared to the total population of the world. Do not indicate the country name.
select min(population) as SmallestPopulation, concat(cast((min(population)/sum(population)*100) as decimal (10,2)),'%') as PercentageRelation
from cia 
where population > 50

--4.	Display the name of every region.
select region
from cia

--5.	What is the average population of all European counties? Give a title to the returned column.
select avg(population) as AveragePopulation 
from cia 
where region = 'Europe'

--6.	Display the name of each region, and the amount of countries in each region.
select region, count(name) as AmountOfCountries
from cia
group by region

--7.	Display the name of each region with countries whose population is greater than 500,000,000 people, and the number of countries who pass this condition for each region respectively.
select region, count(name) as NumOfCountries
from cia 
where population > 50000000
group by region


--8.	Display the name of each region and its respective population in millions with two significant digits of precision.
select region, CAST((population/1000000) as decimal (10,2)) as PopulationInMillions
from cia 


--9.	Display in the millions the total population and the total GDP of Europe. Give a title to each of the columns.
select cast((sum(population)/1000000) as decimal (10,2)) as PopulationInMillions, cast((sum(gdp)/10000000) as decimal (16,2)) as GDP
from cia 


--10.	Display in the millions the total population, the total GDP, and the name of each region. Give a title to each column, and sort the result by decreasing GDP.
select region, cast((sum(population)/1000000) as decimal (16,2)) as TotalPopulation, cast((sum(gdp)/1000000) as decimal (20,2)) as TotalGDP
from CIA 
group by region
order by sum(gdp) desc

--11.	Display the total number of regions in the world. Give the column a name.
select count(region) as NumOfRegions
from cia 

--12.	Display the name, total population, total area, and GDP of each region. Give names to the columns.
select region, sum(population) as TotalPopulation, sum(area) as TotalArea, sum(gdp) as TotalGDP
from cia 
group by region


--13.	Display the name and population of each region which exceeds 400,000,000 people. They should be sorted by descending population.
select region, concat(cast(sum(population)/1000000 as decimal (20,2)),' M') as RegionPopulation
from cia 
group by region
having sum(population) > 400000000 
order by sum(population) desc


--14.	Display the region name and average population of each region with countries whose total population is greater than 800,000,000 people. Exclude China from the average. Results should be sorted by descending population.
select region, cast((avg(population)/1000000) as decimal (10,2)) as AveragePopulation
from cia
where population > 800000000 and name != 'China'
group by region
order by avg(population) desc

select * from cia 

--15.	Display the the name of each region and average population of countries that make up those regions (in millions). Sort by population in descending order.
select region, cast((avg(population)/1000000) as decimal (30,2)) as AveragePopulation
from cia 
group by region
order by avg(population) desc