--How SQL commands should be arranged:
SELECT
FROM
ORDER BY
LIMIT

--LIMIT statement
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15


--ORDER BY - This clause goes before the LIMIT clause. LIMIT statement always appears last.
SELECT id, occurred_at,total_amt_usd
FROM orders
ORDER BY occurred_at DESC
LIMIT 10;

--sorting, using ORDER BY on more than one column:
SELECT id, name, website, sales_rep_id
FROM accounts
ORDER BY sales_rep_id DESC, id
LIMIT 10;

