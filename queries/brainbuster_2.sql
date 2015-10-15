# Which rating has the most films?
# => PG-13 223
SELECT 
  rating, count(film_id)
FROM 
  film 
GROUP BY 1
;

# How many films have an R rating and are $.99
# => 70
SELECT 
  rating, rental_rate, count(film_id)
FROM 
  film 
GROUP BY 1,2
;