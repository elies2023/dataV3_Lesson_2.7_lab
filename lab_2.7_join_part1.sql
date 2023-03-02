-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
use sakila;
select * from category;
select * from film;
select * from film_category;


SELECT category.name, COUNT(*) AS num_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;

-- Display the total amount rung up by each staff member in August of 2005.
select * from payment;
select * from staff;
select sum(p.amount),p.staff_id,f.first_name,f.last_name
from payment p
left join staff f
using(staff_id)
group by p.staff_id
order by p.staff_id;
-- 3-Which actor has appeared in the most films?
select * from film;
select * from film_actor;
select * from actor;
SELECT actor.first_name, actor.last_name, COUNT(*) AS num_films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY num_films DESC
LIMIT 1;


-- Most active customer (the customer that has rented the most number of films
select * from sakila.customer;
select * from rental;
select * from film;

SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(*) AS num_rentals
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
GROUP BY customer.customer_id
ORDER BY num_rentals DESC
LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.
select s.first_name,s.last_name,a.address
from staff s
join address a on s.address_id=a.address_id;
-- List each film and the number of actors who are listed for that film.

SELECT film.film_id, film.title, COUNT(*) AS num_actors
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id, film.title;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from customer;
select * from payment;
select sum(p.amount),c.last_name
from payment p
join customer c
using(customer_id)
group by c.last_name
order by c.last_name ASC;

-- List number of films per category.
select * from film;
select * from film_category;
select * from category;

SELECT category.name, COUNT(*) AS num_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;



