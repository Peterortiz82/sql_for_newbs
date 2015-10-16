#IN(), comparison operators, HAVING


#number of rentals in the Comedy, Sports, Family
SELECT
    c.name as category, count(r.rental_id) as num_rentals
FROM
    rental r, inventory i, film f, film_category fc, category c
WHERE
    r.inventory_id = i.inventory_id
    AND i.film_id = f.film_id
    AND f.film_id = fc.film_id
    AND fc.category_id = c.category_id
    AND c.name in ("Comedy", "Sports", "Family") #will only display the search result you ask for 
GROUP BY 
    1
;

#How many rentals between june 8th and july 19th, 2005, BETWEEN
SELECT
    count(r.rental_id)
FROM
    rental r 
WHERE
    r.rental_date between '2005-06-08' AND '2005-07-19'
;

#comparison operators (>, =) and HAVING
#user's who have rented ar least 3 times
SELECT
    r.customer_id as customer, count(r.rental_id) as num_rentals
FROM
    rental r
GROUP BY 
    1
HAVING
    count(r.rental_id) >= 3
;

#How much revenue has one single store made over PG-13 and R-Rated films
SELECT
    i.store_id as store, f.rating as movie_rating, sum(p.amount) as store_revenue
FROM
    film f, payment p, inventory i, rental r
WHERE
    p.rental_id = r.rental_id
    AND r.inventory_id = i.inventory_id
    AND i.film_id = f.film_id
    AND i.store_id = 1
    AND f.rating in("R", "PG-13")
    AND r.rental_date between '2005-06-08' AND '2005-07-19'
GROUP BY
    1, 2
ORDER BY
    3 DESC
;