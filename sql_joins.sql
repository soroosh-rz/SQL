SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- pulls all the columns from both tables
SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- pull all the information from only the orders table
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

--
/*Try pulling all the data from the accounts table, and all the data from the orders table*/
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

-- 
/*Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the 
website and the primary_poc from the accounts table*/

SELECT orders.standard_qty, orders.gloss_qty, 
          orders.poster_qty,  accounts.website, 
          accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

-- join all three of these tables
SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id