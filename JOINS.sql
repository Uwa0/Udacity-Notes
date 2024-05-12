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

