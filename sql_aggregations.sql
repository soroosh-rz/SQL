-- finding all the rows in the accounts table
SELECT COUNT(*)
FROM accounts;

SELECT COUNT(accounts.id)
FROM accounts;

-- Aggregation Questions
/*
Find the total amount of poster_qty paper ordered in the orders table.

Find the total amount of standard_qty paper ordered in the orders table.

Find the total dollar amount of sales using the total_amt_usd in the orders table.

Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in 
the orders table. This should give a dollar amount for each order in the table.

Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an 
aggregation and a mathematical operator.
*/

SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;

SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;

SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

-- MIN, MAX, & AVG
/*
When was the earliest order ever placed? You only need to return the date.
*/

SELECT MIN(occurred_at) 
FROM orders;

-- MIN, MAX, & AVG
/*
Try performing the same query as in question 1 without using an aggregation function. 
*/

SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1;

-- MIN, MAX, & AVG
/*
When did the most recent (latest) web_event occur?
*/

SELECT MAX(occurred_at)
FROM web_events;

-- MIN, MAX, & AVG
/*
Try to perform the result of the previous query without using an aggregation function.
*/

SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

-- MIN, MAX, & AVG
/*
Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean 
amount of each paper type purchased per order. Your final answer should have 6 values - 
one for each paper type for the average number of sales, as well as the average amount.
*/

SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
              AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
              AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;

-- MIN, MAX, & AVG
/*
Via the video, you might be interested in how to calculate the MEDIAN. Though this is more 
advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent 
on all orders?
*/

SELECT *
FROM (SELECT total_amt_usd
         FROM orders
         ORDER BY total_amt_usd
         LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

-- The GROUP BY always goes between WHERE and ORDER BY.
-- GROUP BY
/*
Which account (by name) placed the earliest order? Your solution should have the 
account name and the date of the order.
*/

SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;

-- GROUP BY
/*
Find the total sales in usd for each account. You should include two columns - 
the total sales for each company's orders in usd and the company name.
*/

SELECT a.name, SUM(total_amt_usd) total_sales
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name;









