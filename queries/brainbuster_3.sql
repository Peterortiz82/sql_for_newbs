#Film, Category Name, and Language Name (connect 3 tables)
SELECT
    film.title, category.name, language.name
FROM
    film, language, film_category, category
WHERE 
  film.film_id = film_category.film_id
  AND
  category.category_id = film_category.category_id
  AND
  film.language_id = language.language_id
;

#Introducing nicknames (for example above)
SELECT
    f.title, c.name, l.name
FROM
    film f, language l, film_category fc, category c
WHERE 
  f.film_id = fc.film_id
  AND
  c.category_id = fc.category_id
  AND
  f.language_id = l.language_id
;

#ADVANCED: (combining 3 tables, group by, and count)

#How many times has each movie been rented out?
SELECT 
  f.title, count(r.rental_id)
FROM 
  film f, rental r, inventory i
WHERE
  f.film_id = i.film_id 
  AND
  r.inventory_id = i.inventory_id
GROUP BY f.title
;

#revenue per video title
#revenue = price * number of rentals
SELECT 
  f.title as "Film Title", count(r.rental_id) as "Number of Rentals", 
  f.rental_rate as "Rental Price", count(r.rental_id) * f.rental_rate as Revenue
FROM 
  film f, rental r, inventory i
WHERE
  f.film_id = i.film_id 
  AND
  r.inventory_id = i.inventory_id
GROUP BY 
  1
ORDER BY 
  4 DESC
;

SUM()

#what customers have paid the most $$$
SELECT
    p.customer_id, SUM(p.amount)
FROM
    payment p 
GROUP BY
    1
ORDER BY
    2 DESC
;



