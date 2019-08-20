/*
Write a query with FULL OUTER JOIN to see:
- each account who has a sales rep and each sales rep that 
has an account (all of the columns in these returned rows 
will be full)
- but also each account that does not have a sales rep and 
each sales rep that does not have an account (some of the 
columns in these returned rows will be empty)
*/

SELECT *
FROM accounts
FULL JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id

/*
If unmatched rows existed (they don't for this query), you could isolate them by adding the 
following line to the end of the query:
*/
WHERE accounts.sales_rep_id IS NULL OR sales_reps.id IS NULL

-- the join clause is evaluated before the where clause
-- filtering in the join clause will eliminate rows before they are joined
-- Inequality JOINs
/*
Write a query that left joins the accounts table and the 
sales_reps tables on each sale rep's ID number and joins it 
using the < comparison operator on accounts.primary_poc and 
sales_reps.name, like so:
    `accounts.primary_poc < sales_reps.name`
The query results should be a table with three columns: the 
account name (e.g. Johnson Controls), the primary contact 
name (e.g. Cammy Sosnowski), and the sales representative's 
name (e.g. Samuel Racine). 
*/
SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
  FROM accounts
  LEFT JOIN sales_reps
    ON accounts.sales_rep_id = sales_reps.id
   AND accounts.primary_poc < sales_reps.name

-- SELF JOIN
/* One of the most common use cases for self JOINs is in cases where two events occurred, 
one after another. 
*/
/*
change the interval to 1 day to find those web events that occurred after, but not more than 
1 day after, another web event (occur one after another within 1 day for each account)
*/
SELECT we1.id AS we_id,
       we1.account_id AS we1_account_id,
       we1.occurred_at AS we1_occurred_at,
       we1.channel AS we1_channel,
       we2.id AS we2_id,
       we2.account_id AS we2_account_id,
       we2.occurred_at AS we2_occurred_at,
       we2.channel AS we2_channel
  FROM web_events we1 
 LEFT JOIN web_events we2
   ON we1.account_id = we2.account_id
  AND we1.occurred_at > we2.occurred_at
  AND we1.occurred_at <= we2.occurred_at + INTERVAL '1 day'
ORDER BY we1.account_id, we2.occurred_at

