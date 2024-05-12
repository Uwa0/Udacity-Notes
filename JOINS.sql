JOINS

--pulling all columns from both tables
SELECT accounts.*, orders.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

--Pulling specific columns from both tables
SELECT orders.standard_qty, 
  orders.gloss_qty, 
  orders.poster_qty,
  accounts.website,
  accounts.primary_poc
FROM orders
JOIN accounts
ON accounts.id = orders.account_id;


--QUESTION: Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

SELECT a.name, a.primary_poc, w.occurred_at, w.channel
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';


--QUESTION: Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT r.name region, s.name sales_rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY account;


--QUESTION: Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

SELECT a.name account, 
r.name region, 
o.total_amt_usd/(o.total+0.01) unit_price
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
