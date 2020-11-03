--Transactions by customer


--DROP VIEW IF EXISTS trans_by_cust
--CREATE VIEW trans_by_cust AS
SELECT cu.full_name, t.amount, t.transaction_date, m.merchant_name
FROM card_holder as cu
JOIN credit_card as ca ON cu.customer_id = ca.customer_id
JOIN "transaction" as t ON ca.card_id = t.card_id
JOIN "merchant" as m ON t.merchant_id = m.merchant_id
ORDER BY cu.full_name ASC, t.amount DESC;

SELECT * FROM trans_by_cust

--Transactions between 7 AND 9
DROP VIEW IF EXISTS early_morn_trans;

--CREATE VIEW early_morn_trans AS
SELECT cu.full_name, ROUND(CAST(t.amount AS NUMERIC),2) as amount  
FROM "transaction" AS t
JOIN credit_card AS ca on t.card_id = ca.card_id
JOIN card_holder as cu on ca.customer_id = cu.customer_id
WHERE EXTRACT(HOUR FROM transaction_date) BETWEEN 7 AND 9
GROUP BY cu.full_name, t.amount
ORDER BY t.amount DESC
LIMIT 100;

SELECT * FROM early_morn_trans;

DROP VIEW IF EXISTS less_than_two;
--Count less than $2
--CREATE VIEW less_than_two AS
SELECT cu.full_name,COUNT(t.transaction_id) as trans_count, m.merchant_name
FROM card_holder as cu
JOIN credit_card as ca ON cu.customer_id = ca.customer_id
JOIN "transaction" as t ON ca.card_id = t.card_id
JOIN merchant as m ON t.merchant_id = m.merchant_id
WHERE t.amount <2
GROUP BY cu.full_name, m.merchant_name
ORDER BY cu.full_name ASC;

DROP VIEW IF EXISTS merchant_low_trans;
--Top merchants by low trans amount
--CREATE VIEW merchant_low_trans AS
SELECT m.merchant_name,COUNT(t.transaction_id) as trans_count
FROM card_holder as cu
JOIN credit_card as ca ON cu.customer_id = ca.customer_id
JOIN "transaction" as t ON ca.card_id = t.card_id
JOIN  merchant as m ON t.merchant_id = m.merchant_id
WHERE t.amount <2
GROUP BY m.merchant_name
ORDER BY trans_count DESC;

--OR
--CREATE VIEW merchant_low_trans AS
SELECT merchant_name, COUNT(trans_count) AS trans_count
FROM less_than_two
GROUP BY merchant_name
ORDER BY trans_count DESC;

SELECT cu.customer_id,t.transaction_date, t.amount
FROM "transaction" as t
JOIN credit_card AS ca ON t.card_id = ca.card_id
JOIN card_holder AS cu ON ca.customer_id = cu.customer_id
WHERE cu.customer_id IN (2,18)
ORDER BY t.transaction_date;

SELECT * FROM card_holder WHERE card_holder.customer_id = 18;