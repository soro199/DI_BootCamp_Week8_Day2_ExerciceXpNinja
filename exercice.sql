--Fetch the last 2 customers in alphabetical order (A-Z) – exclude ‘id’ from the results.

SELECT first_name, last_name
FROM customer
ORDER BY last_name ASC
LIMIT 2;


--Use SQL to delete all purchases made by Scott.

DELETE FROM payment
WHERE customer_id = (
  SELECT customer_id FROM customer WHERE first_name = 'Scott'
);


--Does Scott still exist in the customers table, even though he has been deleted? Try and find him.
SELECT * FROM customer
WHERE first_name = 'Scott';

--6
SELECT payment.payment_id,payment.payment_date, 
  CASE WHEN customer.first_name IS NULL THEN '' ELSE customer.first_name END AS first_name,
  CASE WHEN customer.last_name IS NULL THEN '' ELSE customer.last_name END AS last_name
FROM payment
LEFT JOIN customer ON payment.customer_id = customer.customer_id;

--7

SELECT payment.payment_id, payment.amount, payment.payment_date, 
  customer.first_name, customer.last_name
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE customer.first_name != 'Scott';

