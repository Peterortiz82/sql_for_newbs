#How many distinct renters per month 
SELECT
    left(r.rental_date, 7) as Month, count(r.rental_id) as total_rentals,
    count(distinct r.customer_id) as unique_renters, count(r.rental_id)/
    count(distinct r.customer_id) as avg_num_rentals_per_renter
FROM
    rental r
GROUP BY 
    1
;

#Find the number of distinct films that are rented each month. 
SELECT
    left(r.rental_date, 7) as Month, count(r.rental_id) as total_rentals,
    count(distinct i.film_id) as unique_films_rented, count(r.rental_id)/count(distinct i.film_id)
    as rentals_per_film
FROM
    rental r, inventory i 
WHERE
    r.inventory_id = i.inventory_id
GROUP BY 
    1
;
