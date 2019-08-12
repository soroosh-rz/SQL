SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;

--
SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;

--
/* Write a query that returns the top 5 rows from orders ordered according to 
newest to oldest, but with the largest total_amt_usd for each date listed 
first for each date*/

SELECT *
FROM orders
ORDER BY occurred_at DESC, total_amt_usd DESC 
LIMIT 5;

--
/* Write a query that returns the top 10 rows from orders ordered according 
to oldest to newest, but with the smallest total_amt_usd for each date listed 
first for each date*/

SELECT *
FROM orders
ORDER BY occurred_at, total_amt_usd
LIMIT 10;

--
/*Pull the first 5 rows and all columns from the orders table that have a 
dollar amount of gloss_amt_usd greater than or equal to 1000*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

-- WHERE 
/*Pull the first 10 rows and all columns from the orders table that have 
a total_amt_usd less than 500*/

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

-- WHERE
/*Filter the accounts table to include the company name, website, and the 
primary point of contact (primary_poc) for Exxon Mobil in the accounts table.*/

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- Derived Columns
/* Using the orders table create a column that divides the standard_amt_usd by 
the standard_qty to find the unit price for standard paper for each order. 
Limit the results to the first 10 orders, and include the id and account_id fields */

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

-- Derived Columns
/*Using the orders table write a query that finds the percentage of revenue that 
comes from poster paper for each order. You will need to use only the columns that 
end with _usd. (Try to do this without using the total column). Include the id and 
account_id fields*/

SELECT id, account_id, 
       poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders;

-- LIKE
/* Use the accounts table to find:
All the companies whose names start with 'C'. 
All companies whose names contain the string 'one' somewhere in the name.
All companies whose names end with 's' */

SELECT name
FROM accounts
WHERE name LIKE 'C%';

SELECT name
FROM accounts
WHERE name LIKE '%one%';

SELECT name
FROM accounts
WHERE name LIKE '%s';

-- 