USE sakila;

-- 1 Drop column picture from staff.
ALTER TABLE sakila.staff
DROP COLUMN picture;
SELECT * FROM staff;

-- 2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

INSERT INTO staff(staff_id,first_name,last_name, address_id, store_id, username) 
VALUES
(3,'TAMMY', 'SANDERS','79','2','TAMMY');

SELECT address_id FROM customer
WHERE first_name = 'tammy' and last_name = 'sanders';

/* Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at 
Store 1. You can use current date for the rental_date column in the rental table.
Hint: Check the columns in the table rental and see what information you would need 
to add there. You can query those pieces of information. For eg., you would notice 
that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
Use similar method to get inventory_id, film_id, and staff_id.*/

SELECT * FROM rental;
SELECT * FROM film
WHERE title = 'academy dinosaur';
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id) 
VALUES (curdate(),1,130,1);


SELECT i.inventory_id, return_date
FROM inventory i
JOIN film f USING (film_id)
JOIN rental r USING (inventory_id)
WHERE title = 'Academy Dinosaur'
AND store_id = 1;



