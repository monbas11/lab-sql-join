#list number of films per category
select a.category_id, l.name, count(*) as film_count
from sakila.category as l
join sakila.film_category as a on l.category_id = a.category_id
group by a.category_id, l.name;

#display the first and the last names as well the adres of each staff member
select d.first_name, d.last_name, a.address
from staff as d
join address as a on d.address_id = a.address_id;

#Display the total amount rung up by each staff member in August 2005.
select s.staff_id, s.first_name, s.last_name, sum(amount) as total_amount
from staff as s
join rental as r on r.staff_id = s.staff_id
join inventory as i on i.inventory_id = r.inventory_id
join payment as p on p.rental_id = r.rental_id
where r.rental_date >= '2005-08-01' and r.rental_date < '2005-09-01'

#List all films and the number of actors who are listed for each film.
select f.title, count(distinct.actor_id) as count_actors
from film as f
join film_actor as fa on f.film_id = fa.film_id
group by f.title;


#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.customer_id, c.last_name, c.first_name, sum(p.amount) as total_amount_paid
from customer as c
join payment as p on c.customer_id = p.customer_id
group by c.customer_id, c.last_name, c.first_name
order by c.last_name asc;