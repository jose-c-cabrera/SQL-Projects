# 🗄️ SQL Projects

This repository contains projects from my Databases I class, I created these projects as part of my Programming Analyst program at Lasalle College.   
Each folder includes the database schema and related SQL queries. I put in practice several tools in order to manipulate the data and have a story telled
through the facts and numbers. I learned the importance of data manipulation for storytelling and finding meaning.

---

## 📂 Contents

- `Databases/` → all the databases
- `publishersDB/` → Book publishers database containing all information on publishers, authors, books, etc.
This contains the database scrypt, queries and different lessons learnt.  
- `CountryDB/` → Country Database that contains information on countries, database scrypt and queries. 
- `motherChildDB` → Contains a small in class explanation about the creation of DB and join function

---

## 🛠️ How to Use
Inside each of the folders you will find the database scrypt as well as the queries developed to manage the data inside the DBs. 
You can:
1. Open your SQL client (MySQL, PostgreSQL, or SQLite as specified in each folder).
2. Run the Database scripts in order:
3. Try each of the queries in each folder. 

---

## 🗂️ Basic SQL Functions Demonstrated

This repository includes examples and usage of fundamental SQL operations:

- `📄 Data Definition Language (DDL)`

These commands define and modify the structure of your database.

CREATE TABLE – Create new tables with specified columns and data types.

DROP TABLE – Permanently delete tables and their data.

ALTER TABLE – Modify the structure of an existing table (add, remove, or change columns).

- `📝 Data Manipulation Language (DML)`

These commands are used to manage data within tables.

INSERT INTO – Add new records to a table.

UPDATE – Modify existing records in a table.

DELETE – Remove records from a table.

SELECT – Retrieve data from one or more tables.

- `🔍 Filtering and Searching`

Control which records are returned in your queries.

WHERE – Filter results based on conditions.

LIKE – Search for patterns using wildcards (% for any number of characters, _ for a single character).

IN, BETWEEN, IS NULL – Additional conditional operators for filtering.

- `🔗 Joining and Combining Tables`

INNER JOIN – Return matching rows from two tables.

LEFT JOIN, RIGHT JOIN – Return all rows from one table and matching rows from another.

FULL OUTER JOIN – Return all rows from both tables, with NULL where there is no match.

UNION / UNION ALL – Combine results from multiple SELECT statements.

- `📊 Grouping, Sorting, and Aggregates`

GROUP BY – Group rows that have the same values in specified columns.

ORDER BY – Sort results by one or more columns.

Aggregate Functions – Use functions like COUNT(), SUM(), AVG(), MAX(), MIN() for summaries.

- `📥📤 Importing and Exporting Data`

Import – Load data into SQL tables from external sources (e.g. CSV, JSON).

Example tools: COPY, LOAD DATA, database GUI tools.

Export – Save query results or entire tables to external files.

Example: SELECT ... INTO OUTFILE (MySQL), or GUI-based export.
