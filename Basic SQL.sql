POSTGRE SQL
--How SQL commands should be arranged:
SELECT
FROM
WHERE
ORDER BY
LIMIT


  LIMIT 
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15


ORDER BY
  --This clause goes before the LIMIT clause. LIMIT statement always appears last.
SELECT id, occurred_at,total_amt_usd
FROM orders
ORDER BY occurred_at DESC
LIMIT 10;

--sorting, using ORDER BY on more than one column:
SELECT id, name, website, sales_rep_id
FROM accounts
ORDER BY sales_rep_id DESC, id
LIMIT 10;


WHERE
--This query should come after FROM, but before ORDER BY or LIMIT.
Common symbols used in WHERE statements include:
> (greater than)
< (less than)
>= (greater than or equal to)
<= (less than or equal to)
= (equal to)
!= (not equal to) 

SELECT*
FROM orders
WHERE gloss_amt_usd >=1000
ORDER BY id DESC
LIMIT 5;

--WHERE for non-Numeric values (remember, use 'single quotes' for text values.)
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';


--DERIVED COLUMNS - or computed colums gotten from a combination of existing columns
SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id, poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd)* 100 AS poster_percent
FROM orders
LIMIT 10;


--LOGICAL OPERATORS
--LIKE This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
--IN This allows you to perform operations similar to using WHERE and =, but for more than one condition.
--NOT This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
--AND & BETWEEN These allow you to combine operations where all combined conditions must be true.
--OR This allows you to combine operations where at least one of the combined conditions must be true.


LIKE 
--used mostly for text-based filters. Example: '%keyword%'
SELECT *
FROM accounts
WHERE name LIKE 'C%';

SELECT *
FROM accounts
WHERE name LIKE '%one%';

SELECT *
FROM accounts
WHERE name LIKE '%s';


IN
--used like = but for multiple items. Examples:
--WHERE name IN ('Wise', 'Revolut')
--WHERE account_id IN (1001, 1021)

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');



NOT 
WHERE column NOT IN ('keyword')
WHERE column NOT LIKE '%keyword%'

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');



AND and BETWEEN
WHERE column >= 6 AND column <= 10
  --is the same as
WHERE column BETWEEN 6 AND 10

  
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name NOT LIKE '%s'
ORDER BY name DESC;

--using AND for a range
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty >= 24 AND gloss_qty <= 29
ORDER BY gloss_qty;

--the same result if using BETWEEN for a range
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29
ORDER BY gloss_qty;


SELECT *
FROM web_events
WHERE channel IN('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;



OR
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

--combining OR with AND statements
SELECT id
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);


--Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
  AND primary_poc NOT LIKE '%eana%';


